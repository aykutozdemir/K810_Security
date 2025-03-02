#include "CRCPackageInterface.h"
#include "PipedStream.h"

const uint16_t CRCPackageInterface::CRC_TABLE[4] = {
    0x0000, 0x1021, 0x2042, 0x3063};

CRCPackageInterface::CRCPackageInterface(PipedStream &plainStream)
    : PackageInterface(plainStream, m_packagePipes.first), m_packagePipes(sizeof(Package)),
      m_outgoingDataTimer(OUTGOING_DATA_READ_TIMEOUT), m_incomingDataTimer(INCOMING_DATA_WAIT_TIMEOUT),
      m_packetNumber(0), m_lastReceivedPacketNumber(255), m_incomingDataLength(0), m_retryCount(0),
      m_currentStateForOutgoingPackage(OutgoingState::READ_DATA),
      m_currentStateForIncomingPackage(IncomingState::WAIT_FOR_START_BYTE),
      m_isAckReceived(false), m_isNackReceived(false)
{
    memset(m_outgoingPackage.data, 0, sizeof(m_outgoingPackage.data));
    memset(m_incomingPackage.data, 0, sizeof(m_incomingPackage.data));
}

void CRCPackageInterface::preparePackage(Package &package, const uint8_t type, const uint8_t packetNumber,
                                         const uint8_t dataLength, const uint8_t *const data) const
{
    memset(package.data, 0, sizeof(package.data));

    package.dataPackage.startByte = START_BYTE;
    package.dataPackage.packetNumber = packetNumber;
    package.dataPackage.type = type;
    package.dataPackage.length = dataLength;

    if (data && dataLength > 0)
    {
        memcpy(package.dataPackage.data, data, dataLength);
    }

    package.dataPackage.stopByte = STOP_BYTE;

    const uint8_t crcDataLength = HEADER_LENGTH - offsetof(DataPackage, packetNumber) + dataLength;
    package.dataPackage.crc = crc16(&package.dataPackage.packetNumber, crcDataLength);
}

bool CRCPackageInterface::validatePackage(const Package &package) const
{
    if (package.dataPackage.startByte != START_BYTE ||
        package.dataPackage.stopByte != STOP_BYTE)
    {
        return false;
    }

    if (package.dataPackage.type > NACK_TYPE)
    {
        return false;
    }

    if (package.dataPackage.type == DATA_TYPE)
    {
        if (package.dataPackage.length > MAX_DATA_LENGTH)
        {
            return false;
        }
    }
    else if (package.dataPackage.type == NACK_TYPE)
    {
        if (package.dataPackage.length != 1)
        {
            return false;
        }
    }
    else // ACK_TYPE
    {
        if (package.dataPackage.length != 0)
        {
            return false;
        }
    }

    const uint8_t crcDataLength = HEADER_LENGTH - offsetof(DataPackage, packetNumber) +
                                  package.dataPackage.length;
    const uint16_t calculatedCrc = crc16(&package.dataPackage.packetNumber, crcDataLength);

    return calculatedCrc == package.dataPackage.crc;
}

void CRCPackageInterface::resetState(const bool isOutgoing)
{
    if (isOutgoing)
    {
        m_retryCount = 0;
        memset(m_outgoingPackage.data, 0, sizeof(m_outgoingPackage.data));
        m_outgoingDataTimer.setInterval(OUTGOING_DATA_READ_TIMEOUT);
        m_outgoingDataTimer.reset();
        m_currentStateForOutgoingPackage = OutgoingState::READ_DATA;
    }
    else
    {
        memset(m_incomingPackage.data, 0, sizeof(m_incomingPackage.data));
        m_incomingDataLength = 0;
        m_currentStateForIncomingPackage = IncomingState::WAIT_FOR_START_BYTE;
    }
}

void CRCPackageInterface::sendPackage(const Package &package)
{
    m_packagePipes.second.write(package.data, PACKAGE_LENGTH);
}

bool CRCPackageInterface::handleOutgoingState()
{
    switch (m_currentStateForOutgoingPackage)
    {
    case OutgoingState::READ_DATA:
        if (m_outgoingPackage.dataPackage.length == 0)
        {
            m_outgoingDataTimer.reset();
        }

        while (p_plainStream->available())
        {
            if (m_outgoingPackage.dataPackage.length < MAX_DATA_LENGTH)
            {
                m_outgoingPackage.dataPackage.data[m_outgoingPackage.dataPackage.length] = p_plainStream->read();
                m_outgoingPackage.dataPackage.length++;
            }
            else
            {
                break;
            }
        }

        if ((m_outgoingDataTimer.isReady() && (m_outgoingPackage.dataPackage.length > 0)))
        {
            m_retryCount = 0;
            m_currentStateForOutgoingPackage = OutgoingState::SEND_PACKAGE;
            return true; 
        }
        break;

    case OutgoingState::SEND_PACKAGE:
        preparePackage(m_outgoingPackage, DATA_TYPE, m_packetNumber, m_outgoingPackage.dataPackage.length);

        m_isAckReceived = false;
        m_isNackReceived = false;

        sendPackage(m_outgoingPackage);

        m_currentStateForOutgoingPackage = OutgoingState::WAIT_FOR_ACK_OR_NACK;
        m_outgoingDataTimer.setInterval(OUTGOING_DATA_ACK_NACK_TIMEOUT);
        m_outgoingDataTimer.reset();
        return true;

    case OutgoingState::WAIT_FOR_ACK_OR_NACK:
        if (m_outgoingDataTimer.isReady())
        {
            if (m_retryCount >= MAX_RETRY_COUNT)
            {
                resetState(true);
            }
            else
            {
                m_retryCount++;
                m_currentStateForOutgoingPackage = OutgoingState::SEND_PACKAGE;
            }
            return true;
        }
        else if (m_isAckReceived)
        {
            m_packetNumber = (m_packetNumber + 1) % 256;
            resetState(true);
            return true;
        }
        else if (m_isNackReceived)
        {
            m_retryCount++;
            m_currentStateForOutgoingPackage = OutgoingState::SEND_PACKAGE;
            return true;
        }
        break;

    default:
        break;
    }

    return false;
}

bool CRCPackageInterface::handleIncomingState()
{
    switch (m_currentStateForIncomingPackage)
    {
    case IncomingState::WAIT_FOR_START_BYTE:
        if (m_packagePipes.second.available())
        {
            if (m_packagePipes.second.peek() != START_BYTE)
            {
                m_packagePipes.second.read();
            }
            else
            {
                m_incomingDataLength = 0;
                m_currentStateForIncomingPackage = IncomingState::READ_INCOMING_DATA;
                m_incomingDataTimer.reset();
                return true;
            }
        }
        break;

    case IncomingState::READ_INCOMING_DATA:
        if (m_incomingDataTimer.isReady())
        {
            resetState(false);
            return true;
        }

        while (m_packagePipes.second.available())
        {
            const uint8_t ch = m_packagePipes.second.read();

            if (m_incomingDataLength >= PACKAGE_LENGTH)
            {
                Package nackPackage;
                const uint8_t reason = BUFFER_OVERFLOW;
                preparePackage(nackPackage, NACK_TYPE, m_incomingPackage.dataPackage.packetNumber, 1, &reason);
                sendPackage(nackPackage);
                resetState(false);
                return true;
            }

            m_incomingPackage.data[m_incomingDataLength++] = ch;

            if (m_incomingDataLength == PACKAGE_LENGTH)
            {
                m_currentStateForIncomingPackage = IncomingState::PROCESS_INCOMING_DATA;
                return true;
            }
        }
        break;

    case IncomingState::PROCESS_INCOMING_DATA:
        processPackage();
        return true;

    default:
        break;
    }

    return false;
}

void CRCPackageInterface::processPackage()
{
    if (validatePackage(m_incomingPackage))
    {
        if (m_incomingPackage.dataPackage.type == DATA_TYPE)
        {
            const bool isDuplicate = (m_incomingPackage.dataPackage.packetNumber == m_lastReceivedPacketNumber);
            if (!isDuplicate)
            {
                p_plainStream->write(m_incomingPackage.dataPackage.data, m_incomingPackage.dataPackage.length);
            }

            m_lastReceivedPacketNumber = m_incomingPackage.dataPackage.packetNumber;

            Package ackPackage;
            preparePackage(ackPackage, ACK_TYPE, m_incomingPackage.dataPackage.packetNumber);
            sendPackage(ackPackage);
        }
        else if ((m_incomingPackage.dataPackage.type == ACK_TYPE) && (m_incomingPackage.dataPackage.packetNumber == m_packetNumber))
        {
            m_isAckReceived = true;
        }
        else if ((m_incomingPackage.dataPackage.type == NACK_TYPE) && (m_incomingPackage.dataPackage.packetNumber == m_packetNumber))
        {
            m_isNackReceived = true;
        }
    }
    else if (m_incomingPackage.dataPackage.startByte == START_BYTE)
    {
        Package nackPackage;
        const uint8_t reason = INVALID_CRC;
        preparePackage(nackPackage, NACK_TYPE, m_incomingPackage.dataPackage.packetNumber, 1, &reason);
        sendPackage(nackPackage);
    }

    resetState(false);
}

void CRCPackageInterface::handleOutgoingStateMachine()
{
    uint8_t stateChanges = 0;

    while (stateChanges < MAX_REPLAY_COUNT)
    {
        if (!handleOutgoingState())
            break;

        stateChanges++;
    }
}

void CRCPackageInterface::handleIncomingStateMachine()
{
    uint8_t stateChanges = 0;

    while (stateChanges < MAX_REPLAY_COUNT)
    {
        if (!handleIncomingState())
            break;

        stateChanges++;
    }
}

void CRCPackageInterface::loop()
{
    handleOutgoingStateMachine();
    handleIncomingStateMachine();
}

uint16_t CRCPackageInterface::crc16(const uint8_t *const data, const uint8_t length)
{
    uint16_t crc = 0xFFFF;

    for (uint8_t i = 0; i < length; i++)
    {
        crc ^= (uint16_t)data[i] << 8;
        for (uint8_t j = 0; j < 8; j++)
        {
            if (crc & 0x8000)
            {
                crc = (crc << 1) ^ 0x1021;
            }
            else
            {
                crc <<= 1;
            }
        }
    }

    return crc;
}