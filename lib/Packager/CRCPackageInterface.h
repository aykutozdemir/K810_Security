#ifndef CRC_PACKAGE_INTERFACE_H
#define CRC_PACKAGE_INTERFACE_H

#include "PackageInterface.h"
#include "SimpleTimer.h"
#include "FastCircularQueue.h"

/**
 * @file CRCPackageInterface.h
 * @brief Reliable packet-based communication protocol with CRC-16 validation
 * @author Aykut ÖZDEMİR
 * @date 2025-03-11
 *
 * @details Implements a robust communication protocol for reliable data exchange between
 * microcontrollers and external devices. Key features:
 * - CRC-16 error detection for data integrity
 * - 8-byte packet payload with minimal overhead
 * - Automatic retransmission with ACK/NACK
 * - Bidirectional flow control
 * - Connection state synchronization
 * - Flash memory optimization for embedded systems
 */

/**
 * @class CRCPackageInterface
 * @brief High-reliability packet protocol with error detection
 *
 * @details Provides a complete communication stack with the following features:
 * 
 * Protocol Structure:
 * - Fixed 15-byte packet format (4B header + 8B payload + 3B footer)
 * - CRC-16-CCITT error detection (polynomial: 0x1021)
 * - Start/stop byte framing (0xAA/0x55)
 * 
 * Reliability Features:
 * - Automatic packet acknowledgment (ACK/NACK)
 * - Configurable retry mechanism
 * - Sequence number tracking
 * - Connection state monitoring
 * 
 * Performance Optimizations:
 * - Zero-copy buffer management
 * - Interrupt-safe operation
 * - Minimal memory footprint
 * - Flash string support for embedded systems
 * 
 * Error Handling:
 * - Comprehensive error detection
 * - Detailed error reporting
 * - Automatic recovery mechanisms
 * - Connection reset handling
 *
 * @note Designed for single-threaded environments with interrupt safety
 * @note All packet operations are non-blocking
 */
class CRCPackageInterface : public PackageInterface
{
public:
    /**
     * @typedef ErrorCallback
     * @brief Function pointer for error event handling
     * 
     * @details Callback interface for error reporting and logging. The callback
     * receives both a category prefix and detailed message stored in flash memory
     * to minimize RAM usage in embedded systems.
     * 
     * @param prefix Category/source of the error (stored in flash)
     * @param errorMessage Detailed error description (stored in flash)
     */
    typedef void (*ErrorCallback)(const __FlashStringHelper *prefix, const __FlashStringHelper *errorMessage);

    /**
     * @enum NackReason
     * @brief Error codes for packet rejection
     * 
     * @details Comprehensive set of error codes indicating why a packet was rejected.
     * Used in NACK responses to inform the sender about specific validation failures,
     * enabling targeted recovery actions.
     */
    enum NackReason : uint8_t
    {
        NO_ERROR = 0x00,           ///< Packet validation successful
        INVALID_CRC = 0x01,        ///< CRC-16 checksum mismatch
        INVALID_START_STOP = 0x02, ///< Missing/incorrect frame markers (0xAA/0x55)
        INVALID_TYPE = 0x03,       ///< Unknown or unsupported packet type
        INVALID_LENGTH = 0x04,     ///< Payload length exceeds limits or invalid for type
        UNKNOWN_ERROR = 0xFF       ///< Unclassified protocol error
    };

    /**
     * @struct PackageHeader
     * @brief Packet framing and control information
     * 
     * @details Fixed 4-byte header structure containing:
     * - Frame start marker (1B)
     * - Sequence number for ordering (1B)
     * - Packet type identifier (1B)
     * - Payload length indicator (1B)
     * 
     * Memory layout is guaranteed by packed attribute for cross-platform compatibility.
     */
    struct __attribute__((packed)) PackageHeader
    {
        uint8_t startByte;    ///< Frame start marker (constant: 0xAA)
        uint8_t packetNumber; ///< Sequence number (1-255, 0 reserved)
        uint8_t type;         ///< Packet type (DATA/ACK/NACK/RESET)
        uint8_t length;       ///< Payload length (0-8 bytes)
    };

    /**
     * @struct PackageFooter
     * @brief Packet integrity verification
     * 
     * @details Fixed 3-byte footer containing:
     * - CRC-16-CCITT checksum covering header and payload
     * - Frame end marker
     * 
     * Memory layout is guaranteed by packed attribute for cross-platform compatibility.
     */
    struct __attribute__((packed)) PackageFooter
    {
        uint16_t crc;     ///< CRC-16-CCITT (polynomial: 0x1021)
        uint8_t stopByte; ///< Frame end marker (constant: 0x55)
    };

    /** @brief Maximum allowed payload size per packet */
    static constexpr uint8_t MAX_DATA_LENGTH = 8;

    /**
     * @struct Package
     * @brief Complete packet structure
     * 
     * @details Represents a complete protocol packet with:
     * - 4-byte header (framing, control)
     * - 8-byte payload (data)
     * - 3-byte footer (integrity check)
     * 
     * Total packet size is fixed at 15 bytes for predictable behavior.
     * Memory layout is guaranteed by packed attribute for cross-platform compatibility.
     */
    struct __attribute__((packed)) Package
    {
        PackageHeader header;          ///< Packet control information (4B)
        uint8_t data[MAX_DATA_LENGTH]; ///< Payload buffer (8B)
        PackageFooter footer;          ///< Integrity verification (3B)
    };

    /** @brief Total packet size including header, payload, and footer */
    static constexpr uint8_t PACKAGE_LENGTH = sizeof(Package);

    /**
     * @brief Constructs a new CRC package interface
     * 
     * @details Initializes the communication interface with:
     * - Separate incoming/outgoing channels
     * - Message queues for ACK/NACK handling
     * - State machines for both channels
     * - Timers for timeout management
     * 
     * @param pipedStreamPair Bidirectional stream for raw/encoded data
     * @param encodedBufferSize Size of encoded data buffer (default: PACKAGE_LENGTH)
     */
    explicit CRCPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize = PACKAGE_LENGTH);

    /**
     * @brief Destructor
     * @details Ensures proper cleanup of resources and nullifies callbacks
     */
    virtual ~CRCPackageInterface();

    /**
     * @brief Main protocol processing loop
     * 
     * @details Performs one iteration of protocol processing:
     * 1. Checks for connection timeouts
     * 2. Processes outgoing channel state machine
     * 3. Processes incoming channel state machine
     * 4. Handles error conditions
     * 
     * This method should be called regularly in the application's main loop.
     */
    virtual void loop() override;

    /**
     * @brief Registers error callback handler
     * 
     * @details The callback will be invoked for:
     * - Protocol errors (CRC, framing)
     * - Buffer overflows
     * - Timeout conditions
     * - State machine errors
     * 
     * @param callback Function to handle error events
     */
    void setErrorCallback(const ErrorCallback callback);

    /**
     * @brief Initiates connection reset
     * 
     * @details Performs the following sequence:
     * 1. Sends RESET packet to peer
     * 2. Resets local packet numbering
     * 3. Clears message queues
     * 4. Resets state machines
     * 
     * Use this to recover from:
     * - Connection loss
     * - Protocol desynchronization
     * - Peer reset/restart
     */
    void sendResetPacket();

private:
    // Protocol Constants
    static constexpr uint8_t START_BYTE = 0xAA;    ///< Packet frame start marker
    static constexpr uint8_t STOP_BYTE = 0x55;     ///< Packet frame end marker

    // Packet Types
    static constexpr uint8_t DATA_TYPE = 0;        ///< Data packet (with payload)
    static constexpr uint8_t ACK_TYPE = 1;         ///< Positive acknowledgment
    static constexpr uint8_t NACK_TYPE = 2;        ///< Negative acknowledgment
    static constexpr uint8_t RESET_TYPE = 3;       ///< Connection reset request

    // Protocol Parameters
    static constexpr uint8_t MAX_PENDING_MESSAGES = 4;  ///< ACK/NACK queue size
    static constexpr uint8_t MAX_RETRY_COUNT = 5;       ///< Max retransmission attempts
    static constexpr uint8_t MAX_REPLAY_COUNT = PACKAGE_LENGTH + 2;  ///< Max state transitions per loop

    /**
     * @enum PendingMessageType
     * @brief Message types for ACK/NACK queue
     * 
     * @details Classifies queued acknowledgment messages for the state machine.
     * Used to track responses to outgoing packets and trigger appropriate actions.
     */
    enum class PendingMessageType : uint8_t
    {
        NONE = 0,     ///< No pending message
        ACK_RECEIVED, ///< Positive acknowledgment received
        NACK_RECEIVED ///< Negative acknowledgment received
    };

    /**
     * @struct PendingMessage
     * @brief ACK/NACK queue entry
     * 
     * @details Stores acknowledgment information including:
     * - Message type (ACK/NACK)
     * - Associated packet number
     * - Error reason (for NACK)
     */
    struct PendingMessage
    {
        PendingMessageType type; ///< Message classification
        uint8_t packetNumber;    ///< Associated packet sequence number
        NackReason nackReason;   ///< Error code (if NACK)
    };

    // Error Message Strings (stored in flash)
    static const char PREFIX_CRC_O_STR[] PROGMEM;       ///< "CRC:O:" - Outgoing channel
    static const char PREFIX_CRC_I_STR[] PROGMEM;       ///< "CRC:I:" - Incoming channel
    static const char PREFIX_CRC_STR[] PROGMEM;         ///< "CRC:" - General
    static const char BUFFER_FULL_STR[] PROGMEM;        ///< Buffer capacity exceeded
    static const char MAX_RETRY_STR[] PROGMEM;          ///< Max retransmissions reached
    static const char RETRY_STR[] PROGMEM;              ///< Packet retransmission
    static const char NACK_STR[] PROGMEM;               ///< NACK received
    static const char UNKNOWN_STATE_STR[] PROGMEM;      ///< Invalid state machine state
    static const char INVALID_CRC_STR[] PROGMEM;        ///< CRC validation failed
    static const char UNKNOWN_ERR_STR[] PROGMEM;        ///< Unclassified error
    static const char MAX_STATE_CHG_STR[] PROGMEM;      ///< Too many state transitions
    static const char INVALID_START_STOP_STR[] PROGMEM; ///< Frame marker error
    static const char INVALID_TYPE_STR[] PROGMEM;       ///< Invalid packet type
    static const char INVALID_LENGTH_STR[] PROGMEM;     ///< Invalid payload length
    static const char RESET_NUM_STR[] PROGMEM;          ///< Sequence number reset

    // Protocol Timeouts (milliseconds)
    static constexpr uint16_t OUTGOING_DATA_READ_TIMEOUT = 100;      ///< Max time to collect outgoing data
    static constexpr uint16_t OUTGOING_DATA_ACK_NACK_TIMEOUT = 500;  ///< Max time to wait for ACK/NACK
    static constexpr uint16_t INCOMING_DATA_WAIT_TIMEOUT = 500;      ///< Max time to receive complete packet
    static constexpr uint16_t RESET_DETECTION_TIMEOUT = 10000;       ///< Connection timeout threshold

    // Packet Structure Constants
    static constexpr uint8_t HEADER_LENGTH = sizeof(PackageHeader);   ///< Header size (4B)
    static constexpr uint8_t FOOTER_LENGTH = sizeof(PackageFooter);   ///< Footer size (3B)

    /**
     * @brief CRC calculation scope
     * @details CRC-16 is computed over:
     * - Header fields after startByte
     * - Complete payload
     * Total: packetNumber + type + length + data (11 bytes)
     */
    static constexpr uint8_t CRC_SCOPE_LENGTH = HEADER_LENGTH - 1 + MAX_DATA_LENGTH;

    /**
     * @enum OutgoingState
     * @brief State machine for outgoing packets
     * 
     * @details Controls the transmission sequence:
     * 1. READ_DATA: Collect data until timeout or buffer full
     * 2. SEND_PACKAGE: Transmit packet with CRC
     * 3. WAIT_FOR_ACK_OR_NACK: Wait for response, retry if needed
     */
    enum OutgoingState : uint8_t
    {
        READ_DATA = 0,       ///< Collecting outgoing data
        SEND_PACKAGE,        ///< Transmitting packet
        WAIT_FOR_ACK_OR_NACK ///< Awaiting acknowledgment
    };

    /**
     * @enum IncomingState
     * @brief State machine for incoming packets
     * 
     * @details Controls the reception sequence:
     * 1. WAIT_FOR_START_BYTE: Frame synchronization
     * 2. READ_INCOMING_DATA: Receive complete packet
     * 3. PROCESS_INCOMING_DATA: Validate and handle packet
     */
    enum IncomingState : uint8_t
    {
        WAIT_FOR_START_BYTE = 0, ///< Seeking frame start
        READ_INCOMING_DATA,      ///< Receiving packet bytes
        PROCESS_INCOMING_DATA    ///< Processing complete packet
    };

    /**
     * @struct OutgoingFlags
     * @brief Packed status flags for outgoing channel
     * 
     * @details Bit-field structure containing:
     * - Retry counter (3 bits, 0-7)
     * - Current state (2 bits, 0-3)
     * 
     * Memory layout is guaranteed by packed attribute.
     */
    struct __attribute__((packed)) OutgoingFlags
    {
        uint8_t m_retryCount : 3;   ///< Current retry attempt (0-7)
        uint8_t m_currentState : 2; ///< Current state (0-3)
    };

    /**
     * @struct IncomingFlags
     * @brief Packed status flags for incoming channel
     * 
     * @details Bit-field structure containing:
     * - Current state (2 bits, 0-3)
     * - Received data length (5 bits, 0-31)
     * 
     * Memory layout is guaranteed by packed attribute.
     */
    struct __attribute__((packed)) IncomingFlags
    {
        uint8_t m_currentState : 2;       ///< Current state (0-3)
        uint8_t m_incomingDataLength : 5; ///< Bytes received (0-31)
    };

    /**
     * @brief Handles outgoing state machine
     * 
     * @details Processes one state machine iteration:
     * - READ_DATA: Collect/batch data
     * - SEND_PACKAGE: Transmit packet
     * - WAIT_FOR_ACK_OR_NACK: Handle response
     * 
     * @return true if state changed
     * @return false if no state change
     */
    bool handleOutgoingState();

    /**
     * @brief Handles incoming state machine
     * 
     * @details Processes one state machine iteration:
     * - WAIT_FOR_START_BYTE: Frame sync
     * - READ_INCOMING_DATA: Receive packet
     * - PROCESS_INCOMING_DATA: Handle packet
     * 
     * @return true if state changed
     * @return false if no state change
     */
    bool handleIncomingState();

    /**
     * @brief Resets packet sequence numbers
     * 
     * @details Performs a complete protocol reset:
     * 1. Resets packet counters (out: 1, in: 0)
     * 2. Clears message queues
     * 3. Resets state machines
     * 4. Resets timers
     */
    void resetPacketNumbering();

    /**
     * @brief Calculates CRC-16-CCITT checksum
     * 
     * @details Implements CRC-16-CCITT algorithm:
     * - Polynomial: 0x1021 (x^16 + x^12 + x^5 + 1)
     * - Initial value: 0xFFFF
     * - No final XOR
     * 
     * @param data Input data buffer
     * @param length Number of bytes to process
     * @return uint16_t Calculated CRC-16 value
     */
    static uint16_t crc16(const uint8_t *const data, const uint8_t length);

    /**
     * @brief Validates received packet
     * 
     * @details Performs comprehensive packet validation:
     * 1. Frame markers (start/stop bytes)
     * 2. Packet type validity
     * 3. Length constraints
     * 4. CRC-16 integrity
     * 
     * @param package Packet to validate
     * @return NackReason Error code (NO_ERROR if valid)
     */
    NackReason validatePackage(const Package &package) const;

    /**
     * @brief Prepares packet for transmission
     * 
     * @details Assembles a complete packet:
     * 1. Sets header fields
     * 2. Copies payload data
     * 3. Calculates CRC-16
     * 4. Sets footer fields
     * 
     * @param package Packet structure to prepare
     * @param type Packet type (DATA/ACK/NACK/RESET)
     * @param packetNumber Sequence number
     * @param dataLength Payload length (0-8 bytes)
     * @param data Payload buffer (nullptr if no data)
     */
    void preparePackage(Package &package, const uint8_t type, const uint8_t packetNumber,
                        const uint8_t dataLength = 0, const uint8_t *const data = nullptr) const;

    /**
     * @brief Reports error through callback
     * 
     * @details Formats and delivers error information:
     * - Category prefix (from flash)
     * - Error message (from flash)
     * - No heap allocations
     * 
     * @param prefix Error category (flash string)
     * @param errorMessage Error details (flash string)
     */
    void reportError(const __FlashStringHelper *const prefix, const __FlashStringHelper *const errorMessage) const;

    /**
     * @brief Reports NACK reason through callback
     * 
     * @details Converts NACK reason to human-readable form:
     * - Maps reason code to message
     * - Adds appropriate prefix
     * - Reports through callback
     * 
     * @param prefix Error category (flash string)
     * @param reason NACK reason code
     */
    void reportNackReason(const __FlashStringHelper *const prefix, const NackReason reason) const;

    /**
     * @brief Resets outgoing channel state
     * 
     * @details Performs complete outgoing reset:
     * 1. Clears packet buffer
     * 2. Resets state to READ_DATA
     * 3. Clears retry counter
     * 4. Resets timeout timer
     */
    void resetOutgoingState();

    /**
     * @brief Resets incoming channel state
     * 
     * @details Performs complete incoming reset:
     * 1. Clears packet buffer
     * 2. Resets byte counter
     * 3. Resets state to WAIT_FOR_START_BYTE
     * 4. Resets timeout timer
     */
    void resetIncomingState();

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
    void sendPackage(const Package &package);

    /**
     * @brief Processes complete received packet
     * 
     * @details Handles received packet based on type:
     * - DATA: Validate, store, send ACK
     * - ACK/NACK: Queue for outgoing state machine
     * - RESET: Reset protocol state, send ACK
     * 
     * @return true if processing successful
     * @return false if error occurred
     */
    bool processPackage();

    // Member variables
    SimpleTimer<uint16_t> m_outgoingTimer;       /**< Timer for outgoing data handling */
    SimpleTimer<uint16_t> m_incomingTimer;       /**< Timer for incoming data handling */
    SimpleTimer<uint16_t> m_resetDetectionTimer; /**< Timer for detecting communication resets */

    uint8_t m_outgoingPacketNumber;     /**< Current outgoing packet sequence number */
    uint8_t m_lastIncomingPacketNumber; /**< Last received incoming packet sequence number */

    Package m_outgoingPackage; /**< Buffer for outgoing packet */
    Package m_incomingPackage; /**< Buffer for incoming packet */

    OutgoingFlags m_outgoingFlags; /**< State flags for outgoing channel */
    IncomingFlags m_incomingFlags; /**< State flags for incoming channel */

    FastCircularQueue<PendingMessage, MAX_PENDING_MESSAGES> m_messageQueue; /**< Queue for ACK/NACK messages */

    ErrorCallback m_errorCallback; /**< Callback for error reporting */
};

#endif
