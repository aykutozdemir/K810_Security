#include "CRCPackageInterface.h"
#include "PipedStream.h"
#include "Utilities.h"

/**
 * @file CRCPackageInterface.cpp
 * @brief Implementation of the CRC package interface communication protocol
 *
 * This file contains the implementation of the CRCPackageInterface class,
 * which provides a reliable packet-based communication protocol with CRC
 * validation, error detection, and packet integrity verification.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

// Define PROGMEM strings
/**
 * @brief Prefix string for outgoing CRC messages (stored in PROGMEM)
 */
const char CRCPackageInterface::PREFIX_CRC_O_STR[] PROGMEM = "CRC:O:";

/**
 * @brief Prefix string for incoming CRC messages (stored in PROGMEM)
 */
const char CRCPackageInterface::PREFIX_CRC_I_STR[] PROGMEM = "CRC:I:";

/**
 * @brief Error message for buffer full condition (stored in PROGMEM)
 */
const char CRCPackageInterface::BUFFER_FULL_STR[] PROGMEM = "BufFull";

/**
 * @brief Error message for reaching maximum retry attempts (stored in PROGMEM)
 */
const char CRCPackageInterface::MAX_RETRY_STR[] PROGMEM = "MaxRetry";

/**
 * @brief Message indicating a retry attempt (stored in PROGMEM)
 */
const char CRCPackageInterface::RETRY_STR[] PROGMEM = "Retry";

/**
 * @brief Message indicating a negative acknowledgment (stored in PROGMEM)
 */
const char CRCPackageInterface::NACK_STR[] PROGMEM = "NACK";

/**
 * @brief Error message for unknown state (stored in PROGMEM)
 */
const char CRCPackageInterface::UNKNOWN_STATE_STR[] PROGMEM = "UnkState";

/**
 * @brief Error message for invalid CRC (stored in PROGMEM)
 */
const char CRCPackageInterface::INVALID_CRC_STR[] PROGMEM = "BadCRC";

/**
 * @brief Error message for unknown error (stored in PROGMEM)
 */
const char CRCPackageInterface::UNKNOWN_ERR_STR[] PROGMEM = "UnkErr";

/**
 * @brief Error message for maximum state changes (stored in PROGMEM)
 */
const char CRCPackageInterface::MAX_STATE_CHG_STR[] PROGMEM = "MaxStChg";
const char CRCPackageInterface::INVALID_START_STOP_STR[] PROGMEM = "InvStrtStp";
const char CRCPackageInterface::INVALID_TYPE_STR[] PROGMEM = "InvTyp";
const char CRCPackageInterface::INVALID_LENGTH_STR[] PROGMEM = "InvLen";

/**
 * @brief Constructor implementation
 *
 * Initializes the interface with default values and sets up timers.
 * Starting packet number is 1 (not 0) for outgoing packets.
 *
 * @param pipedStreamPair Stream pair for communication
 * @param encodedBufferSize Size of the encoded buffer
 */
CRCPackageInterface::CRCPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize)
    : PackageInterface(pipedStreamPair, encodedBufferSize),
      m_outgoingTimer(OUTGOING_DATA_READ_TIMEOUT),
      m_incomingTimer(INCOMING_DATA_WAIT_TIMEOUT),
      m_resetDetectionTimer(RESET_DETECTION_TIMEOUT),
      m_outgoingPacketNumber(1),
      m_lastIncomingPacketNumber(0),
      m_errorCallback(nullptr)
{
    memset(&m_outgoingPackage, 0, sizeof(m_outgoingPackage));
    memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));

    // Initialize flags
    memset(&m_outgoingFlags, 0, sizeof(m_outgoingFlags));
    memset(&m_incomingFlags, 0, sizeof(m_incomingFlags));

    // Clear message queue
    m_messageQueue.clear();

    m_outgoingFlags.m_currentState = OutgoingState::READ_DATA;
    m_incomingFlags.m_currentState = IncomingState::WAIT_FOR_START_BYTE;
}

/**
 * @brief Destructor implementation
 *
 * Cleans up resources and nullifies callback pointer.
 */
CRCPackageInterface::~CRCPackageInterface()
{
    m_errorCallback = nullptr;
}

/**
 * @brief Main processing loop
 *
 * This method should be called regularly in the main application loop.
 * Checks for timeout-based reset conditions and processes both outgoing and incoming channels.
 */
void CRCPackageInterface::loop()
{
    // Check if there's been a long period without communication
    // This might indicate the Android side has reset or disconnected
    if (m_resetDetectionTimer.isReady())
    {
        // After timeout, prepare for a possible reconnection
        resetPacketNumbering();
        m_resetDetectionTimer.reset();
    }

    {
        // Process outgoing channel
        uint8_t outgoingStateChanges = 0;
        bool outgoingChanged = false;
        do
        {
            // Define local methods to work around linter issues
            outgoingChanged = handleOutgoingState();
            if (outgoingChanged)
            {
                outgoingStateChanges++;
            }
        } while (outgoingChanged && outgoingStateChanges < MAX_REPLAY_COUNT);

        // Log warning if max state changes hit
        if (outgoingStateChanges == MAX_REPLAY_COUNT)
        {
            reportError(PGMT(PREFIX_CRC_O_STR), PGMT(MAX_STATE_CHG_STR));
        }
    }

    {
        // Process incoming channel
        uint8_t incomingStateChanges = 0;
        bool incomingChanged = false;
        do
        {
            // Define local methods to work around linter issues
            incomingChanged = handleIncomingState();
            if (incomingChanged)
            {
                incomingStateChanges++;
            }
        } while (incomingChanged && incomingStateChanges < MAX_REPLAY_COUNT);

        // Log warning if max state changes hit
        if (incomingStateChanges == MAX_REPLAY_COUNT)
        {
            reportError(PGMT(PREFIX_CRC_I_STR), PGMT(MAX_STATE_CHG_STR));
        }
    }
}

/**
 * @brief Sets the error callback function
 *
 * @param callback Function to call when errors occur
 */
void CRCPackageInterface::setErrorCallback(const ErrorCallback callback)
{
    m_errorCallback = callback;
}

/**
 * @brief Sends a reset packet and resets local state
 *
 * This method sends a RESET packet to the other side and resets
 * the local packet numbering state. Used to reestablish synchronization
 * after connection issues or resets on either side.
 */
void CRCPackageInterface::sendResetPacket()
{
    PipedStream &encodedStream = getInternalEncodedStream();

    // Only send reset if we have enough buffer space
    if (PACKAGE_LENGTH > encodedStream.availableForWrite())
    {
        reportError(PGMT(PREFIX_CRC_O_STR), PGMT(BUFFER_FULL_STR));
        return;
    }

    // Create and send a reset packet
    Package resetPackage;
    memset(&resetPackage, 0, sizeof(resetPackage));
    preparePackage(resetPackage, RESET_TYPE, 0);
    sendPackage(resetPackage);

    // Reset our own packet numbering
    resetPacketNumbering();
}

/**
 * @brief Resets the packet numbering and state machines
 *
 * Called when communication needs to be reestablished, either
 * due to timeout, explicit reset request, or detected reset condition.
 */
void CRCPackageInterface::resetPacketNumbering()
{
    // Reset packet counters
    m_outgoingPacketNumber = 1;
    m_lastIncomingPacketNumber = 0;

    // Clear any pending messages
    m_messageQueue.clear();

    // Reset state machines
    resetOutgoingState();
    resetIncomingState();
}

/**
 * @brief Calculates CRC16-CCITT
 *
 * Implementation of the CRC16-CCITT algorithm for error detection.
 * Polynomial: x^16 + x^12 + x^5 + 1 (0x1021)
 * Initial value: 0xFFFF
 *
 * @param data Pointer to the data buffer
 * @param length Length of the data
 * @return uint16_t Calculated CRC value
 */
uint16_t CRCPackageInterface::crc16(const uint8_t *const data, const uint8_t length)
{
    uint16_t crc = 0xFFFF;
    for (uint8_t i = 0; i < length; i++)
    {
        crc ^= (uint16_t)data[i] << 8;

        for (uint8_t bit = 0; bit < 8; bit++)
        {
            crc = (crc & 0x8000) ? ((crc << 1) ^ 0x1021) : (crc << 1);
        }
    }
    return crc;
}

/**
 * @brief Store CRC value in a way that handles different endianness
 *
 * @param dest Destination variable
 * @param src Source CRC value
 */
inline void storeCRC(uint16_t &dest, const uint16_t src)
{
    uint8_t *const destBytes = (uint8_t *)&dest;
    destBytes[0] = (src >> 8) & 0xFF; // MSB
    destBytes[1] = src & 0xFF;        // LSB
}

/**
 * @brief Retrieve CRC value in a way that handles different endianness
 *
 * @param src Source variable containing CRC
 * @return uint16_t Retrieved CRC value
 */
inline uint16_t retrieveCRC(const uint16_t &src)
{
    const uint8_t *const srcBytes = (const uint8_t *)&src;
    return ((uint16_t)srcBytes[0] << 8) | srcBytes[1];
}

/**
 * @brief Reports an error using the callback if set
 *
 * @param prefix Error prefix (e.g., "CRC:I:")
 * @param errorMessage Error message
 */
void CRCPackageInterface::reportError(const __FlashStringHelper *const prefix, const __FlashStringHelper *const errorMessage) const
{
    if (m_errorCallback)
    {
        m_errorCallback(prefix, errorMessage);
    }
}

/**
 * @brief Reports a NACK reason using the error callback
 *
 * Converts a NackReason code to a human-readable error message
 * and reports it through the error callback.
 *
 * @param prefix Error prefix
 * @param reason NACK reason code
 */
void CRCPackageInterface::reportNackReason(const __FlashStringHelper *const prefix, const NackReason reason) const
{
    if (m_errorCallback)
    {
        const __FlashStringHelper *errorMessage;

        switch (reason)
        {
        case NackReason::INVALID_CRC:
            errorMessage = PGMT(INVALID_CRC_STR);
            break;
        case NackReason::INVALID_START_STOP:
            errorMessage = PGMT(INVALID_START_STOP_STR);
            break;
        case NackReason::INVALID_TYPE:
            errorMessage = PGMT(INVALID_TYPE_STR);
            break;
        case NackReason::INVALID_LENGTH:
            errorMessage = PGMT(INVALID_LENGTH_STR);
            break;
        default:
            errorMessage = PGMT(UNKNOWN_ERR_STR);
            break;
        }

        reportError(prefix, errorMessage);
    }
}

/**
 * @brief Resets the outgoing state machine to initial state
 *
 * Clears the outgoing package buffer, resets flags, and resets timer.
 */
void CRCPackageInterface::resetOutgoingState()
{
    memset(&m_outgoingPackage, 0, sizeof(m_outgoingPackage));
    m_outgoingFlags.m_currentState = OutgoingState::READ_DATA;
    m_outgoingFlags.m_retryCount = 0;
    m_outgoingTimer.setInterval(OUTGOING_DATA_READ_TIMEOUT);
    m_outgoingTimer.reset();
}

/**
 * @brief Resets the incoming state machine to initial state
 *
 * Clears the incoming package buffer, resets flags, and resets timer.
 */
void CRCPackageInterface::resetIncomingState()
{
    memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
    m_incomingFlags.m_incomingDataLength = 0;
    m_incomingFlags.m_currentState = IncomingState::WAIT_FOR_START_BYTE;
    m_incomingTimer.setInterval(INCOMING_DATA_WAIT_TIMEOUT);
    m_incomingTimer.reset();
}

/**
 * @brief Prepares a packet for transmission
 *
 * Fills in the packet structure with header, data, and footer information,
 * and calculates the CRC.
 *
 * @param package Packet structure to prepare
 * @param type Packet type (DATA, ACK, NACK, RESET)
 * @param packetNumber Sequence number
 * @param dataLength Length of data (0 for control packets)
 * @param data Pointer to data buffer (nullptr if no data)
 */
void CRCPackageInterface::preparePackage(Package &package, const uint8_t type, const uint8_t packetNumber,
                                         const uint8_t dataLength, const uint8_t *const data) const
{
    // Set header fields
    package.header.startByte = START_BYTE;
    package.header.packetNumber = packetNumber;
    package.header.type = type;
    package.header.length = dataLength;

    // Copy data if provided
    if (data && dataLength > 0)
    {
        memcpy(package.data, data, dataLength);
    }

    // Set footer fields
    package.footer.stopByte = STOP_BYTE;

    // Calculate and store CRC in a portable way
    const uint16_t calculatedCrc = crc16((uint8_t *)&package.header.packetNumber, CRC_LENGTH);
    storeCRC(package.footer.crc, calculatedCrc);
}

/**
 * @brief Validates a received packet
 *
 * Performs checks on the packet structure including:
 * - Start/stop bytes
 * - Packet type
 * - Length validity
 * - CRC validation
 *
 * @param package The packet to validate
 * @return NackReason Error code, or NO_ERROR if validation successful
 */
CRCPackageInterface::NackReason CRCPackageInterface::validatePackage(const Package &package) const
{
    // Check start and stop bytes
    if (package.header.startByte != START_BYTE || package.footer.stopByte != STOP_BYTE)
    {
        return NackReason::INVALID_START_STOP;
    }

    // Check package type - update to include RESET_TYPE
    if (package.header.type > RESET_TYPE)
    {
        return NackReason::INVALID_TYPE;
    }

    // Validate length based on type
    if (package.header.type == DATA_TYPE && package.header.length > MAX_DATA_LENGTH)
    {
        return NackReason::INVALID_LENGTH;
    }
    else if ((package.header.type == NACK_TYPE && package.header.length != 1) ||
             (package.header.type == ACK_TYPE && package.header.length != 0) ||
             (package.header.type == RESET_TYPE && package.header.length != 0))
    {
        return NackReason::INVALID_LENGTH;
    }

    // Validate CRC
    const uint16_t calculatedCrc = crc16((uint8_t *)&package.header.packetNumber, CRC_LENGTH);
    const uint16_t packageCrc = retrieveCRC(package.footer.crc);

    if (calculatedCrc != packageCrc)
    {
        return NackReason::INVALID_CRC;
    }

    // All checks passed
    return NackReason::NO_ERROR;
}

/**
 * @brief Sends a packet over the encoded stream
 *
 * @param package The packet to send
 */
void CRCPackageInterface::sendPackage(const Package &package)
{
    getInternalEncodedStream().write(reinterpret_cast<const uint8_t *>(&package), PACKAGE_LENGTH);
}

/**
 * @brief Processes a fully received packet
 *
 * Validates the received packet and takes appropriate action based on the packet type.
 * For DATA packets: Validates, processes, and sends ACK
 * For ACK/NACK packets: Adds to message queue for handling by outgoing state machine
 * For RESET packets: Resets local state and acknowledges
 *
 * @return true if processing successful, false if error occurred
 */
bool CRCPackageInterface::processPackage()
{
    PipedStream &plainStream = getInternalPlainStream();
    PipedStream &encodedStream = getInternalEncodedStream();

    // Reset the detection timer whenever we receive a packet
    m_resetDetectionTimer.reset();

    // Check for potential out-of-sequence packets that might indicate a reset
    if (m_incomingPackage.header.type == DATA_TYPE &&
        m_lastIncomingPacketNumber > 0 &&
        m_incomingPackage.header.packetNumber < m_lastIncomingPacketNumber &&
        m_incomingPackage.header.packetNumber <= 2) // First few packets after reset
    {
        // This looks like the Android side has reset - accept the new sequence
        resetPacketNumbering();
    }

    // Validate the package and get specific error reason
    const NackReason validationResult = validatePackage(m_incomingPackage);

    if (validationResult == NackReason::NO_ERROR)
    {
        if (m_incomingPackage.header.type == DATA_TYPE)
        {
            if (PACKAGE_LENGTH > encodedStream.availableForWrite())
            {
                reportError(PGMT(PREFIX_CRC_I_STR), PGMT(BUFFER_FULL_STR));
                return false;
            }

            // Only process the packet if it's new (not a duplicate)
            if (m_incomingPackage.header.packetNumber != m_lastIncomingPacketNumber)
            {
                const uint8_t safeLength = min(m_incomingPackage.header.length, MAX_DATA_LENGTH);

                if (safeLength > plainStream.availableForWrite())
                {
                    reportError(PGMT(PREFIX_CRC_I_STR), PGMT(BUFFER_FULL_STR));
                    return false;
                }

                // Write received data to plain stream
                plainStream.write(m_incomingPackage.data, safeLength);
                m_lastIncomingPacketNumber = m_incomingPackage.header.packetNumber;
            }

            // Send ACK with the same packet number
            const uint8_t packetNumber = m_incomingPackage.header.packetNumber;
            memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
            preparePackage(m_incomingPackage, ACK_TYPE, packetNumber);
            sendPackage(m_incomingPackage);
        }
        else if (m_incomingPackage.header.type == RESET_TYPE)
        {
            // Handle reset packet - reset local packet numbering
            resetPacketNumbering();

            // Send an ACK for the reset packet
            memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
            preparePackage(m_incomingPackage, ACK_TYPE, 0);
            sendPackage(m_incomingPackage);
        }
        else if (m_incomingPackage.header.type == ACK_TYPE &&
                 m_incomingPackage.header.packetNumber == m_outgoingPacketNumber)
        {
            // Queue ACK received message
            PendingMessage message;
            message.type = MessageType::ACK_RECEIVED;
            message.packetNumber = m_incomingPackage.header.packetNumber;
            message.nackReason = NackReason::NO_ERROR;
            m_messageQueue.push(message);
        }
        else if (m_incomingPackage.header.type == NACK_TYPE &&
                 m_incomingPackage.header.packetNumber == m_outgoingPacketNumber)
        {
            NackReason nackReason = NackReason::NO_ERROR;
            if (m_incomingPackage.header.length > 0)
            {
                nackReason = static_cast<NackReason>(m_incomingPackage.data[0]);
                reportNackReason(PGMT(PREFIX_CRC_O_STR), static_cast<NackReason>(nackReason));
            }

            // Queue NACK received message
            PendingMessage message;
            message.type = MessageType::NACK_RECEIVED;
            message.packetNumber = m_incomingPackage.header.packetNumber;
            message.nackReason = nackReason;
            m_messageQueue.push(message);
        }
    }
    else
    {
        reportNackReason(PGMT(PREFIX_CRC_I_STR), validationResult);

        // Send NACK with the specific error reason
        if (m_incomingPackage.header.type == DATA_TYPE)
        {
            if (PACKAGE_LENGTH > encodedStream.availableForWrite())
            {
                reportError(PGMT(PREFIX_CRC_I_STR), PGMT(BUFFER_FULL_STR));
                return false;
            }

            const uint8_t packetNumber = m_incomingPackage.header.packetNumber;
            const uint8_t reasonData[1] = {validationResult};
            memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
            preparePackage(m_incomingPackage, NACK_TYPE, packetNumber, 1, reasonData);
            sendPackage(m_incomingPackage);
        }
    }

    resetIncomingState();

    return true;
}

/**
 * @brief Handles the outgoing channel state machine
 *
 * Implements the state machine for sending data packets and
 * handling acknowledgments. States are:
 * - READ_DATA: Gather data from plain stream
 * - SEND_PACKAGE: Transmit data packet
 * - WAIT_FOR_ACK_OR_NACK: Wait for acknowledgment
 *
 * @return true if state changed, false otherwise
 */
bool CRCPackageInterface::handleOutgoingState()
{
    PipedStream &plainStream = getInternalPlainStream();
    PipedStream &encodedStream = getInternalEncodedStream();
    // Check message queue for ACK/NACK before processing state
    PendingMessage message;
    if (m_messageQueue.pop(message))
    {
        if (message.type == MessageType::ACK_RECEIVED &&
            message.packetNumber == m_outgoingPacketNumber &&
            m_outgoingFlags.m_currentState == OutgoingState::WAIT_FOR_ACK_OR_NACK)
        {
            // Process ACK
            m_outgoingPacketNumber++;
            resetOutgoingState();
            return true;
        }
        else if (message.type == MessageType::NACK_RECEIVED &&
                 message.packetNumber == m_outgoingPacketNumber &&
                 m_outgoingFlags.m_currentState == OutgoingState::WAIT_FOR_ACK_OR_NACK)
        {
            // Process NACK
            m_outgoingFlags.m_retryCount++;
            reportError(PGMT(PREFIX_CRC_O_STR), PGMT(NACK_STR));
            m_outgoingFlags.m_currentState = OutgoingState::SEND_PACKAGE;
            return true;
        }
    }

    switch (m_outgoingFlags.m_currentState)
    {
    case OutgoingState::READ_DATA:
        if (m_outgoingPackage.header.length == 0)
        {
            m_outgoingTimer.reset();
        }

        while (plainStream.available() &&
               m_outgoingPackage.header.length < MAX_DATA_LENGTH)
        {
            m_outgoingPackage.data[m_outgoingPackage.header.length++] = plainStream.read();
        }

        if (m_outgoingTimer.isReady() && (m_outgoingPackage.header.length > 0))
        {
            m_outgoingFlags.m_retryCount = 0;
            m_outgoingFlags.m_currentState = OutgoingState::SEND_PACKAGE;
            return true;
        }
        break;

    case OutgoingState::SEND_PACKAGE:
        if (PACKAGE_LENGTH > encodedStream.availableForWrite())
        {
            reportError(PGMT(PREFIX_CRC_O_STR), PGMT(BUFFER_FULL_STR));
            return false;
        }

        preparePackage(m_outgoingPackage, DATA_TYPE, m_outgoingPacketNumber,
                       m_outgoingPackage.header.length);
        sendPackage(m_outgoingPackage);

        m_outgoingFlags.m_currentState = OutgoingState::WAIT_FOR_ACK_OR_NACK;
        m_outgoingTimer.setInterval(OUTGOING_DATA_ACK_NACK_TIMEOUT);
        m_outgoingTimer.reset();
        return true;

    case OutgoingState::WAIT_FOR_ACK_OR_NACK:
        if (m_outgoingTimer.isReady())
        {
            if (m_outgoingFlags.m_retryCount >= MAX_RETRY_COUNT)
            {
                reportError(PGMT(PREFIX_CRC_O_STR), PGMT(MAX_RETRY_STR));
                resetOutgoingState();
            }
            else
            {
                m_outgoingFlags.m_retryCount++;
                reportError(PGMT(PREFIX_CRC_O_STR), PGMT(RETRY_STR));
                m_outgoingFlags.m_currentState = OutgoingState::SEND_PACKAGE;
            }
            return true;
        }
        break;

    default:
        reportError(PGMT(PREFIX_CRC_O_STR), PGMT(UNKNOWN_STATE_STR));
        resetOutgoingState();
        return true;
    }
    return false;
}

/**
 * @brief Handles the incoming channel state machine
 *
 * Implements the state machine for receiving data packets.
 * States are:
 * - WAIT_FOR_START_BYTE: Looking for start of packet
 * - READ_INCOMING_DATA: Reading packet bytes
 * - PROCESS_INCOMING_DATA: Validating and processing packet
 *
 * @return true if state changed, false otherwise
 */
bool CRCPackageInterface::handleIncomingState()
{
    PipedStream &encodedStream = getInternalEncodedStream();
    // Declare buffer pointer outside the switch to avoid jumping over initialization
    uint8_t *buffer = reinterpret_cast<uint8_t *>(&m_incomingPackage);

    switch (m_incomingFlags.m_currentState)
    {
    case IncomingState::WAIT_FOR_START_BYTE:
        if (encodedStream.available())
        {
            const uint8_t peekByte = static_cast<uint8_t>(encodedStream.peek());
            if (peekByte != START_BYTE)
            {
                encodedStream.read();
            }
            else
            {
                m_incomingFlags.m_currentState = IncomingState::READ_INCOMING_DATA;
                m_incomingTimer.reset();
                return true;
            }
        }
        break;

    case IncomingState::READ_INCOMING_DATA:
        if (m_incomingTimer.isReady() && !encodedStream.available())
        {
            resetIncomingState();
            return true;
        }

        // Use the buffer declared outside the switch
        buffer[m_incomingFlags.m_incomingDataLength++] = encodedStream.read();

        if (m_incomingFlags.m_incomingDataLength == PACKAGE_LENGTH)
        {
            m_incomingFlags.m_currentState = IncomingState::PROCESS_INCOMING_DATA;
            return true;
        }
        break;

    case IncomingState::PROCESS_INCOMING_DATA:
        return processPackage();

    default:
        reportError(PGMT(PREFIX_CRC_I_STR), PGMT(UNKNOWN_STATE_STR));
        resetIncomingState();
        return true;
    }
    return false;
}