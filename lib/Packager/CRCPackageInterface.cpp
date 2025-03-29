/**
 * @file CRCPackageInterface.cpp
 * @brief Implementation of reliable packet protocol with CRC validation
 * @author Aykut ÖZDEMİR
 * @date 2025
 *
 * @details Implements a robust communication protocol optimized for embedded systems:
 *
 * Protocol Features:
 * - Fixed 15-byte packet format (4B header + 8B payload + 3B footer)
 * - CRC-16-CCITT error detection
 * - Automatic retransmission
 * - Connection state monitoring
 *
 * Implementation Highlights:
 * - Zero-copy buffer management
 * - Flash string optimization
 * - Minimal RAM usage
 * - Non-blocking operation
 *
 * State Machines:
 * - Outgoing: READ_DATA → SEND_PACKAGE → WAIT_FOR_ACK_OR_NACK
 * - Incoming: WAIT_FOR_START_BYTE → READ_INCOMING_DATA → PROCESS_INCOMING_DATA
 *
 * Error Handling:
 * - Comprehensive validation
 * - Detailed error reporting
 * - Automatic recovery
 */

#include "CRCPackageInterface.h"
#include "PipedStream.h"
#include "Utilities.h"

#include "../../include/TraceLevel.h"
#undef CLASS_TRACE_LEVEL
#define CLASS_TRACE_LEVEL DEBUG_CRC_PACKAGE
#include "../Utilities/TraceHelper.h"

// Flash String Constants
// Error message prefixes stored in flash memory to minimize RAM usage
const char CRCPackageInterface::PREFIX_I_STR[] PROGMEM = "I:"; ///< Incoming channel errors
const char CRCPackageInterface::PREFIX_O_STR[] PROGMEM = "O:"; ///< Outgoing protocol errors
const char CRCPackageInterface::PREFIX_STR[] PROGMEM = "X:";   ///< General protocol errors

// Error message details stored in flash memory
const char CRCPackageInterface::BUFFER_FULL_STR[] PROGMEM = "Buffer full";               ///< Buffer capacity exceeded
const char CRCPackageInterface::MAX_RETRY_STR[] PROGMEM = "Max retry";                   ///< Max retransmissions reached
const char CRCPackageInterface::RETRY_STR[] PROGMEM = "Retry";                           ///< Packet retransmission
const char CRCPackageInterface::NACK_STR[] PROGMEM = "NACK";                             ///< NACK received
const char CRCPackageInterface::UNKNOWN_STATE_STR[] PROGMEM = "Unknown state";           ///< Invalid state detected
const char CRCPackageInterface::INVALID_CRC_STR[] PROGMEM = "Bad CRC";                   ///< CRC validation failed
const char CRCPackageInterface::UNKNOWN_ERR_STR[] PROGMEM = "Unknown error";             ///< Unclassified error
const char CRCPackageInterface::MAX_STATE_CHG_STR[] PROGMEM = "Max state change";        ///< Too many state transitions
const char CRCPackageInterface::INVALID_START_STOP_STR[] PROGMEM = "Invalid start stop"; ///< Frame marker error
const char CRCPackageInterface::INVALID_TYPE_STR[] PROGMEM = "Invalid type";             ///< Invalid packet type
const char CRCPackageInterface::INVALID_LENGTH_STR[] PROGMEM = "Invalid length";         ///< Invalid payload length
const char CRCPackageInterface::RESET_NUM_STR[] PROGMEM = "Reset number";                ///< Sequence number reset

/**
 * @brief Constructor implementation
 *
 * @details Initializes protocol state:
 * - Packet counters (out: 1, in: 0)
 * - State machines (READ_DATA, WAIT_FOR_START_BYTE)
 * - Timers (data, ACK/NACK, reset)
 * - Message queues (cleared)
 * - Packet buffers (zeroed)
 *
 * Note: Starting packet number is 1 (not 0) for outgoing packets
 * to distinguish from reset packets.
 */
CRCPackageInterface::CRCPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize)
    : PackageInterface(pipedStreamPair, encodedBufferSize),
      Traceable(F("CRCPackageInterface"), static_cast<Level>(DEBUG_CRC_PACKAGE)),
      m_outgoingTimer(OUTGOING_DATA_READ_TIMEOUT),
      m_incomingTimer(INCOMING_DATA_WAIT_TIMEOUT),
      m_resetDetectionTimer(RESET_DETECTION_TIMEOUT),
      m_outgoingPacketNumber(1),
      m_lastIncomingPacketNumber(0)
{
    // Zero packet buffers
    memset(&m_outgoingPackage, 0, sizeof(m_outgoingPackage));
    memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));

    // Clear status flags
    memset(&m_outgoingFlags, 0, sizeof(m_outgoingFlags));
    memset(&m_incomingFlags, 0, sizeof(m_incomingFlags));

    // Clear message queue
    m_messageQueue.clear();

    // Set initial states
    m_outgoingFlags.m_currentState = OutgoingState::READ_DATA;
    m_incomingFlags.m_currentState = IncomingState::WAIT_FOR_START_BYTE;
}

/**
 * @brief Main protocol processing loop
 *
 * @details Performs one iteration of protocol processing:
 *
 * 1. Connection Monitoring:
 *    - Checks reset detection timer
 *    - Resets protocol if timeout
 *
 * 2. Outgoing Channel:
 *    - Processes state machine
 *    - Limits state transitions
 *    - Reports excessive transitions
 *
 * 3. Incoming Channel:
 *    - Processes state machine
 *    - Limits state transitions
 *    - Reports excessive transitions
 *
 * Note: State machine transitions are limited to prevent
 * infinite loops in case of corruption.
 */
void CRCPackageInterface::loop()
{
    // Check for connection timeout
    if (m_resetDetectionTimer.isReady())
    {
        resetPacketNumbering();
        m_resetDetectionTimer.reset();
    }

    {
        // Process outgoing channel with transition limit
        uint8_t outgoingStateChanges = 0;
        bool outgoingChanged = false;
        do
        {
            outgoingChanged = handleOutgoingState();
            if (outgoingChanged)
            {
                outgoingStateChanges++;
            }
        } while (outgoingChanged && outgoingStateChanges < MAX_REPLAY_COUNT);

        // Report if limit reached
        if (outgoingStateChanges == MAX_REPLAY_COUNT)
        {
            TRACE_WARN()
                << PGMT(PREFIX_O_STR)
                << PGMT(MAX_STATE_CHG_STR)
                << endl;
        }
    }

    {
        // Process incoming channel with transition limit
        uint8_t incomingStateChanges = 0;
        bool incomingChanged = false;
        do
        {
            incomingChanged = handleIncomingState();
            if (incomingChanged)
            {
                incomingStateChanges++;
            }
        } while (incomingChanged && incomingStateChanges < MAX_REPLAY_COUNT);

        // Report if limit reached
        if (incomingStateChanges == MAX_REPLAY_COUNT)
        {
            TRACE_WARN()
                << PGMT(PREFIX_I_STR)
                << PGMT(MAX_STATE_CHG_STR)
                << endl;
        }
    }
}

/**
 * @brief Initiates connection reset
 *
 * @details Performs connection reset sequence:
 * 1. Checks buffer capacity
 * 2. Sends RESET packet (type: 3, number: 0)
 * 3. Resets local protocol state
 *
 * Used to recover from:
 * - Connection loss
 * - Protocol desynchronization
 * - Peer reset/restart
 */
void CRCPackageInterface::sendResetPacket()
{
    PipedStream &encodedStream = getInternalEncodedStream();

    // Verify buffer capacity
    if (PACKAGE_LENGTH > encodedStream.availableForWrite())
    {
        TRACE_WARN()
            << PGMT(PREFIX_O_STR)
            << PGMT(BUFFER_FULL_STR)
            << endl;
        return;
    }

    // Send reset packet
    Package resetPackage;
    memset(&resetPackage, 0, sizeof(resetPackage));
    preparePackage(resetPackage, RESET_TYPE, 0);
    sendPackage(resetPackage);

    // Reset local state
    resetPacketNumbering();
}

/**
 * @brief Resets protocol state
 *
 * @details Performs complete protocol reset:
 * 1. Resets packet counters (out: 1, in: 0)
 * 2. Clears message queues
 * 3. Resets state machines
 * 4. Reports reset event
 *
 * Note: Only resets if outgoing number isn't already 1
 * to avoid unnecessary operations.
 */
void CRCPackageInterface::resetPacketNumbering()
{
    if (m_outgoingPacketNumber == 1)
    {
        return;
    }

    // Reset packet sequence
    m_outgoingPacketNumber = 1;
    m_lastIncomingPacketNumber = 0;

    // Clear queues and states
    m_messageQueue.clear();
    resetOutgoingState();
    resetIncomingState();

    TRACE_INFO()
        << PGMT(PREFIX_STR)
        << PGMT(RESET_NUM_STR)
        << endl;
}

/**
 * @brief Calculates CRC-16-CCITT checksum
 *
 * @details Implements CRC-16-CCITT algorithm:
 * - Polynomial: 0x1021 (x^16 + x^12 + x^5 + 1)
 * - Initial value: 0xFFFF
 * - No final XOR
 *
 * Algorithm steps:
 * 1. Initialize CRC to 0xFFFF
 * 2. For each byte:
 *    - XOR byte into high byte of CRC
 *    - For each bit:
 *      - If MSB set: shift left and XOR with polynomial
 *      - If MSB clear: shift left only
 *
 * @param data Input data buffer
 * @param length Number of bytes to process
 * @return uint16_t Calculated CRC-16 value
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
 * @brief Stores CRC value with endianness handling
 *
 * @details Ensures consistent byte order:
 * - MSB stored first (big-endian)
 * - LSB stored second
 *
 * This approach works correctly regardless of
 * platform endianness.
 *
 * @param dest Destination CRC variable
 * @param src Source CRC value
 */
inline void storeCRC(uint16_t &dest, const uint16_t src)
{
    uint8_t *const destBytes = (uint8_t *)&dest;
    destBytes[0] = (src >> 8) & 0xFF; // MSB
    destBytes[1] = src & 0xFF;        // LSB
}

/**
 * @brief Retrieves CRC value with endianness handling
 *
 * @details Reconstructs CRC value:
 * - MSB from first byte
 * - LSB from second byte
 *
 * This approach works correctly regardless of
 * platform endianness.
 *
 * @param src Source CRC variable
 * @return uint16_t Retrieved CRC value
 */
inline uint16_t retrieveCRC(const uint16_t &src)
{
    const uint8_t *const srcBytes = (const uint8_t *)&src;
    return ((uint16_t)srcBytes[0] << 8) | srcBytes[1];
}

/**
 * @brief Converts NACK reason to human-readable string
 *
 * @param reason NACK reason code
 * @return const __FlashStringHelper* Human-readable string
 */
const __FlashStringHelper *CRCPackageInterface::toString(const NackReason reason) const
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

    return errorMessage;
}

/**
 * @brief Resets outgoing channel state
 *
 * @details Performs complete outgoing reset:
 * 1. Clears packet buffer
 * 2. Resets state to READ_DATA
 * 3. Clears retry counter
 * 4. Resets timeout timer
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
 * @brief Resets incoming channel state
 *
 * @details Performs complete incoming reset:
 * 1. Clears packet buffer
 * 2. Resets byte counter
 * 3. Resets state to WAIT_FOR_START_BYTE
 * 4. Resets timeout timer
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
 * @brief Prepares packet for transmission
 *
 * @details Assembles a complete packet:
 * 1. Sets header fields
 *    - Start byte (0xAA)
 *    - Packet number
 *    - Type
 *    - Length
 * 2. Copies payload data (if any)
 * 3. Sets footer fields
 *    - CRC-16 over header+data
 *    - Stop byte (0x55)
 *
 * @param package Packet structure to prepare
 * @param type Packet type (DATA/ACK/NACK/RESET)
 * @param packetNumber Sequence number
 * @param dataLength Payload length (0-8 bytes)
 * @param data Payload buffer (nullptr if no data)
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

    // Calculate and store CRC
    const uint16_t calculatedCrc = crc16((uint8_t *)&package.header.packetNumber, CRC_SCOPE_LENGTH);
    storeCRC(package.footer.crc, calculatedCrc);
}

/**
 * @brief Validates received packet
 *
 * @details Performs comprehensive validation:
 * 1. Frame markers (0xAA/0x55)
 * 2. Packet type (0-3)
 * 3. Length constraints:
 *    - DATA: 0-8 bytes
 *    - ACK: 0 bytes
 *    - NACK: 1 byte
 *    - RESET: 0 bytes
 * 4. CRC-16 integrity
 *
 * @param package Packet to validate
 * @return NackReason Error code (NO_ERROR if valid)
 */
CRCPackageInterface::NackReason CRCPackageInterface::validatePackage(const Package &package) const
{
    // Check frame markers
    if (package.header.startByte != START_BYTE || package.footer.stopByte != STOP_BYTE)
    {
        return NackReason::INVALID_START_STOP;
    }

    // Check packet type
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
    const uint16_t calculatedCrc = crc16((uint8_t *)&package.header.packetNumber, CRC_SCOPE_LENGTH);
    const uint16_t packageCrc = retrieveCRC(package.footer.crc);

    if (calculatedCrc != packageCrc)
    {
        return NackReason::INVALID_CRC;
    }

    return NackReason::NO_ERROR;
}

/**
 * @brief Transmits packet over encoded stream
 *
 * @details Sends complete packet:
 * 1. Serializes to byte array
 * 2. Writes to encoded stream
 * 3. No buffering/queueing
 *
 * @param package Prepared packet to send
 */
void CRCPackageInterface::sendPackage(const Package &package)
{
    getInternalEncodedStream().write(reinterpret_cast<const uint8_t *>(&package), PACKAGE_LENGTH);
}

/**
 * @brief Processes complete received packet
 *
 * @details Handles packet based on type:
 *
 * DATA:
 * 1. Validate packet
 * 2. Check sequence number
 * 3. Store payload
 * 4. Send ACK
 *
 * ACK/NACK:
 * 1. Verify packet number
 * 2. Queue for outgoing state machine
 *
 * RESET:
 * 1. Reset protocol state
 * 2. Send ACK
 *
 * @return true if processing successful
 * @return false if error occurred
 */
bool CRCPackageInterface::processPackage()
{
    PipedStream &plainStream = getInternalPlainStream();
    PipedStream &encodedStream = getInternalEncodedStream();

    // Reset detection timer
    m_resetDetectionTimer.reset();

    // Validate packet
    const NackReason validationResult = validatePackage(m_incomingPackage);

    if (validationResult == NackReason::NO_ERROR)
    {
        if (m_incomingPackage.header.type == DATA_TYPE)
        {
            // Check buffer space for response
            if (PACKAGE_LENGTH > encodedStream.availableForWrite())
            {
                TRACE_WARN()
                    << PGMT(PREFIX_I_STR)
                    << PGMT(BUFFER_FULL_STR)
                    << endl;
                return false;
            }

            // Process if new packet
            if (m_incomingPackage.header.packetNumber > m_lastIncomingPacketNumber)
            {
                const uint8_t safeLength = min(m_incomingPackage.header.length, MAX_DATA_LENGTH);

                // Check buffer space for payload
                if (safeLength > plainStream.availableForWrite())
                {
                    TRACE_WARN()
                        << PGMT(PREFIX_I_STR)
                        << PGMT(BUFFER_FULL_STR)
                        << endl;
                    return false;
                }

                // Store payload and update sequence
                plainStream.write(m_incomingPackage.data, safeLength);
                m_lastIncomingPacketNumber = m_incomingPackage.header.packetNumber;
            }

            // Send ACK
            const uint8_t packetNumber = m_incomingPackage.header.packetNumber;
            memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
            preparePackage(m_incomingPackage, ACK_TYPE, packetNumber);
            sendPackage(m_incomingPackage);
        }
        else if (m_incomingPackage.header.type == RESET_TYPE)
        {
            // Handle reset request
            TRACE_INFO()
                << PGMT(PREFIX_I_STR)
                << PGMT(RESET_NUM_STR)
                << endl;

            resetPacketNumbering();

            // Send ACK
            memset(&m_incomingPackage, 0, sizeof(m_incomingPackage));
            preparePackage(m_incomingPackage, ACK_TYPE, 0);
            sendPackage(m_incomingPackage);
        }
        else if (m_incomingPackage.header.type == ACK_TYPE &&
                 m_incomingPackage.header.packetNumber == m_outgoingPacketNumber)
        {
            // Queue ACK
            PendingMessage message;
            message.type = PendingMessageType::ACK_RECEIVED;
            message.packetNumber = m_incomingPackage.header.packetNumber;
            message.nackReason = NackReason::NO_ERROR;
            m_messageQueue.push(message);
        }
        else if (m_incomingPackage.header.type == NACK_TYPE &&
                 m_incomingPackage.header.packetNumber == m_outgoingPacketNumber)
        {
            // Extract and report NACK reason
            NackReason nackReason = NackReason::NO_ERROR;
            if (m_incomingPackage.header.length > 0)
            {
                nackReason = static_cast<NackReason>(m_incomingPackage.data[0]);
                TRACE_ERROR()
                    << PGMT(PREFIX_O_STR)
                    << toString(nackReason)
                    << endl;
            }

            // Queue NACK
            PendingMessage message;
            message.type = PendingMessageType::NACK_RECEIVED;
            message.packetNumber = m_incomingPackage.header.packetNumber;
            message.nackReason = nackReason;
            m_messageQueue.push(message);
        }
    }
    else
    {
        // Report validation failure
        TRACE_ERROR()
            << PGMT(PREFIX_I_STR)
            << toString(validationResult)
            << endl;

        // Send NACK if DATA packet
        if (m_incomingPackage.header.type == DATA_TYPE)
        {
            if (PACKAGE_LENGTH > encodedStream.availableForWrite())
            {
                TRACE_WARN()
                    << PGMT(PREFIX_I_STR)
                    << PGMT(BUFFER_FULL_STR)
                    << endl;

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
 * @brief Handles outgoing state machine
 *
 * @details Processes one state machine iteration:
 *
 * READ_DATA:
 * - Collect data until timeout or buffer full
 * - Reset timer on first byte
 * - Move to SEND_PACKAGE when ready
 *
 * SEND_PACKAGE:
 * - Prepare packet with CRC
 * - Transmit over encoded stream
 * - Move to WAIT_FOR_ACK_OR_NACK
 *
 * WAIT_FOR_ACK_OR_NACK:
 * - Wait for response with timeout
 * - On ACK: Increment sequence, reset state
 * - On NACK: Retry if attempts remain
 * - On timeout: Retry if attempts remain
 *
 * @return true if state changed
 * @return false if no state change
 */
bool CRCPackageInterface::handleOutgoingState()
{
    PipedStream &plainStream = getInternalPlainStream();
    PipedStream &encodedStream = getInternalEncodedStream();

    // Check pending ACK/NACK messages
    PendingMessage message;
    if (m_messageQueue.pop(message))
    {
        if (message.type == PendingMessageType::ACK_RECEIVED &&
            message.packetNumber == m_outgoingPacketNumber &&
            m_outgoingFlags.m_currentState == OutgoingState::WAIT_FOR_ACK_OR_NACK)
        {
            // Process ACK - advance sequence and reset state
            m_outgoingPacketNumber++;
            if (m_outgoingPacketNumber == 0) // Handle overflow
            {
                m_outgoingPacketNumber = 1;
                m_lastIncomingPacketNumber = 0;
                TRACE_INFO()
                    << PGMT(PREFIX_O_STR)
                    << PGMT(RESET_NUM_STR)
                    << endl;
            }
            resetOutgoingState();
            return true;
        }
        else if (message.type == PendingMessageType::NACK_RECEIVED &&
                 message.packetNumber == m_outgoingPacketNumber &&
                 m_outgoingFlags.m_currentState == OutgoingState::WAIT_FOR_ACK_OR_NACK)
        {
            // Process NACK - retry if attempts remain
            m_outgoingFlags.m_retryCount++;
            TRACE_ERROR()
                << PGMT(PREFIX_O_STR)
                << PGMT(NACK_STR)
                << endl;
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

        // Collect data until full or timeout
        while (plainStream.available() &&
               m_outgoingPackage.header.length < MAX_DATA_LENGTH)
        {
            m_outgoingPackage.data[m_outgoingPackage.header.length++] = plainStream.read();
        }

        // Move to SEND_PACKAGE if data ready
        if (m_outgoingTimer.isReady() && (m_outgoingPackage.header.length > 0))
        {
            m_outgoingFlags.m_retryCount = 0;
            m_outgoingFlags.m_currentState = OutgoingState::SEND_PACKAGE;
            return true;
        }
        break;

    case OutgoingState::SEND_PACKAGE:
        // Verify buffer space
        if (PACKAGE_LENGTH > encodedStream.availableForWrite())
        {
            TRACE_WARN()
                << PGMT(PREFIX_O_STR)
                << PGMT(BUFFER_FULL_STR)
                << endl;
            return false;
        }

        // Prepare and send packet
        preparePackage(m_outgoingPackage, DATA_TYPE, m_outgoingPacketNumber,
                       m_outgoingPackage.header.length);
        sendPackage(m_outgoingPackage);

        // Move to wait state
        m_outgoingFlags.m_currentState = OutgoingState::WAIT_FOR_ACK_OR_NACK;
        m_outgoingTimer.setInterval(OUTGOING_DATA_ACK_NACK_TIMEOUT);
        m_outgoingTimer.reset();
        return true;

    case OutgoingState::WAIT_FOR_ACK_OR_NACK:
        // Check for timeout
        if (m_outgoingTimer.isReady())
        {
            if (m_outgoingFlags.m_retryCount >= MAX_RETRY_COUNT)
            {
                // Max retries reached - reset state
                TRACE_ERROR()
                    << PGMT(PREFIX_O_STR)
                    << PGMT(MAX_RETRY_STR)
                    << endl;
                resetOutgoingState();
            }
            else
            {
                // Retry transmission
                m_outgoingFlags.m_retryCount++;
                TRACE_ERROR()
                    << PGMT(PREFIX_O_STR)
                    << PGMT(RETRY_STR)
                    << endl;
                m_outgoingFlags.m_currentState = OutgoingState::SEND_PACKAGE;
            }
            return true;
        }
        break;

    default:
        // Invalid state - reset
        TRACE_ERROR()
            << PGMT(PREFIX_O_STR)
            << PGMT(UNKNOWN_STATE_STR)
            << endl;
        resetOutgoingState();
        return true;
    }
    return false;
}

/**
 * @brief Handles incoming state machine
 *
 * @details Processes one state machine iteration:
 *
 * WAIT_FOR_START_BYTE:
 * - Discard bytes until 0xAA found
 * - Move to READ_INCOMING_DATA
 * - Reset timeout timer
 *
 * READ_INCOMING_DATA:
 * - Collect bytes until complete packet
 * - Handle timeout if reception stalls
 * - Move to PROCESS_INCOMING_DATA when done
 *
 * PROCESS_INCOMING_DATA:
 * - Validate packet integrity
 * - Handle based on packet type
 * - Send ACK/NACK as appropriate
 *
 * @return true if state changed
 * @return false if no state change
 */
bool CRCPackageInterface::handleIncomingState()
{
    PipedStream &encodedStream = getInternalEncodedStream();
    uint8_t *buffer = reinterpret_cast<uint8_t *>(&m_incomingPackage);

    switch (m_incomingFlags.m_currentState)
    {
    case IncomingState::WAIT_FOR_START_BYTE:
        if (encodedStream.available())
        {
            const uint8_t peekByte = static_cast<uint8_t>(encodedStream.peek());
            if (peekByte != START_BYTE)
            {
                // Discard non-start bytes
                encodedStream.read();
            }
            else
            {
                // Start byte found - begin packet reception
                m_incomingFlags.m_currentState = IncomingState::READ_INCOMING_DATA;
                m_incomingTimer.reset();
                return true;
            }
        }
        break;

    case IncomingState::READ_INCOMING_DATA:
        // Check for reception timeout
        if (m_incomingTimer.isReady() && !encodedStream.available())
        {
            resetIncomingState();
            return true;
        }

        // Store next byte
        buffer[m_incomingFlags.m_incomingDataLength++] = encodedStream.read();

        // Check if packet complete
        if (m_incomingFlags.m_incomingDataLength == PACKAGE_LENGTH)
        {
            m_incomingFlags.m_currentState = IncomingState::PROCESS_INCOMING_DATA;
            return true;
        }
        break;

    case IncomingState::PROCESS_INCOMING_DATA:
        return processPackage();

    default:
        // Invalid state - reset
        TRACE_ERROR()
            << PGMT(PREFIX_I_STR)
            << PGMT(UNKNOWN_STATE_STR)
            << endl;
        resetIncomingState();
        return true;
    }
    return false;
}