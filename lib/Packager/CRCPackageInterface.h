#ifndef CRC_PACKAGE_INTERFACE_H
#define CRC_PACKAGE_INTERFACE_H

#include "PackageInterface.h"
#include "SimpleTimer.h"
#include "FastCircularQueue.h"

/**
 * @file CRCPackageInterface.h
 * @brief A reliable packet-based communication protocol with CRC validation
 * @author Aykut ÖZDEMİR
 * @date 2025-03-11
 *
 * @details This implementation provides reliable data transmission between Arduino and
 * external devices (like Android phones) with error detection using CRC16.
 * It supports ACK/NACK for confirmed delivery and reset synchronization.
 */

/**
 * @class CRCPackageInterface
 * @brief Implements a robust communication protocol with error detection and packet integrity verification
 *
 * @details This class provides reliable data transmission with error detection using CRC.
 * It supports ACK/NACK for confirmed delivery and implements separate channels
 * for outgoing and incoming data.
 *
 * The protocol features:
 * - Concurrent processing of incoming/outgoing channels
 * - Message queue for ACK/NACK handling
 * - Separate buffers for outgoing and incoming data
 * - Robust error detection and reporting
 * - Reset mechanism for handling connection interruptions
 *
 * @note This implementation is designed for single-threaded environments.
 */
class CRCPackageInterface : public PackageInterface
{
public:
    /**
     * @typedef ErrorCallback
     * @brief Function pointer type for error reporting callbacks
     * @param prefix A flash-stored string prefix identifying the error source
     * @param errorMessage A flash-stored string containing the error message
     */
    typedef void (*ErrorCallback)(const __FlashStringHelper *prefix, const __FlashStringHelper *errorMessage);

    /**
     * @enum NackReason
     * @brief Error codes for negative acknowledgment (NACK) responses
     */
    enum NackReason : uint8_t
    {
        NO_ERROR = 0x00,           /**< No error, validation successful */
        INVALID_CRC = 0x01,        /**< CRC check failed */
        INVALID_START_STOP = 0x02, /**< Invalid start or stop byte */
        INVALID_TYPE = 0x03,       /**< Invalid package type */
        INVALID_LENGTH = 0x04,     /**< Invalid length for package type */
        UNKNOWN_ERROR = 0xFF       /**< Unclassified error */
    };

    /**
     * @struct PackageHeader
     * @brief Structure defining the packet header
     * @note Uses packed attribute to ensure consistent memory layout
     */
    struct __attribute__((packed)) PackageHeader
    {
        uint8_t startByte;    /**< Start byte marker (0xAA) */
        uint8_t packetNumber; /**< Sequence number for packet ordering */
        uint8_t type;         /**< Packet type (DATA, ACK, NACK, RESET) */
        uint8_t length;       /**< Length of data payload */
    };

    /**
     * @struct PackageFooter
     * @brief Structure defining the packet footer
     * @note Uses packed attribute to ensure consistent memory layout
     */
    struct __attribute__((packed)) PackageFooter
    {
        uint16_t crc;     /**< CRC16 checksum for error detection */
        uint8_t stopByte; /**< Stop byte marker (0x55) */
    };

    /** @brief Maximum payload data length per packet */
    static constexpr uint8_t MAX_DATA_LENGTH = 8;

    /**
     * @struct Package
     * @brief Complete packet structure including header, data and footer
     * @note Uses packed attribute to ensure consistent memory layout
     */
    struct __attribute__((packed)) Package
    {
        PackageHeader header;          /**< Packet header */
        uint8_t data[MAX_DATA_LENGTH]; /**< Data payload */
        PackageFooter footer;          /**< Packet footer */
    };

    /** @brief Total size of a complete packet in bytes */
    static constexpr uint8_t PACKAGE_LENGTH = sizeof(Package);

    /**
     * @brief Constructor for CRCPackageInterface
     * @param pipedStreamPair Reference to the stream pair for communication
     * @param encodedBufferSize Size of the encoded buffer, defaults to PACKAGE_LENGTH
     */
    explicit CRCPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize = PACKAGE_LENGTH);

    /**
     * @brief Virtual destructor to ensure proper cleanup
     */
    virtual ~CRCPackageInterface();

    /**
     * @brief Main processing loop, handles both incoming and outgoing channels
     * @details This method should be called regularly to process incoming and outgoing data.
     *          It handles packet reception, validation, acknowledgment, and transmission.
     */
    virtual void loop() override;

    /**
     * @brief Sets a callback function for error reporting
     * @param callback Function pointer to the error callback
     */
    void setErrorCallback(const ErrorCallback callback);

    /**
     * @brief Sends a reset packet to resynchronize communication
     * @details Call this method when you need to reset the communication state,
     *          such as when the Android app is restarted or communication becomes unreliable.
     *          This will send a RESET packet and reset local packet counters.
     */
    void sendResetPacket();

private:
    // Constants

    /** @brief Start byte marker for packets */
    static constexpr uint8_t START_BYTE = 0xAA;

    /** @brief Stop byte marker for packets */
    static constexpr uint8_t STOP_BYTE = 0x55;

    /** @brief Packet type for data payload */
    static constexpr uint8_t DATA_TYPE = 0;

    /** @brief Packet type for positive acknowledgment */
    static constexpr uint8_t ACK_TYPE = 1;

    /** @brief Packet type for negative acknowledgment */
    static constexpr uint8_t NACK_TYPE = 2;

    /** @brief Packet type for resetting communication */
    static constexpr uint8_t RESET_TYPE = 3;

    /** @brief Maximum number of pending ACK/NACK messages to store */
    static constexpr uint8_t MAX_PENDING_MESSAGES = 4;

    /**
     * @enum MessageType
     * @brief Types of messages that can be stored in the message queue
     */
    enum class MessageType : uint8_t
    {
        NONE = 0,     /**< No message */
        ACK_RECEIVED, /**< Acknowledgment received */
        NACK_RECEIVED /**< Negative acknowledgment received */
    };

    /**
     * @struct PendingMessage
     * @brief Structure for ACK/NACK message queue
     */
    struct PendingMessage
    {
        MessageType type;      /**< Type of message */
        uint8_t packetNumber;  /**< Packet number the message applies to */
        NackReason nackReason; /**< Reason for NACK (if applicable) */
    };

    // PROGMEM strings for error reporting
    static const char PREFIX_CRC_O_STR[] PROGMEM;       /**< Outgoing channel prefix */
    static const char PREFIX_CRC_I_STR[] PROGMEM;       /**< Incoming channel prefix */
    static const char BUFFER_FULL_STR[] PROGMEM;        /**< Buffer full error */
    static const char MAX_RETRY_STR[] PROGMEM;          /**< Maximum retries reached error */
    static const char RETRY_STR[] PROGMEM;              /**< Retry attempt notification */
    static const char NACK_STR[] PROGMEM;               /**< NACK received notification */
    static const char UNKNOWN_STATE_STR[] PROGMEM;      /**< Unknown state error */
    static const char INVALID_CRC_STR[] PROGMEM;        /**< Invalid CRC error */
    static const char UNKNOWN_ERR_STR[] PROGMEM;        /**< Unknown error */
    static const char MAX_STATE_CHG_STR[] PROGMEM;      /**< Max state changes error */
    static const char INVALID_START_STOP_STR[] PROGMEM; /**< Invalid start/stop byte error */
    static const char INVALID_TYPE_STR[] PROGMEM;       /**< Invalid type error */
    static const char INVALID_LENGTH_STR[] PROGMEM;     /**< Invalid length error */

    // Timeouts
    /** @brief Timeout for batching outgoing data (ms) */
    static constexpr uint16_t OUTGOING_DATA_READ_TIMEOUT = 100;

    /** @brief Timeout for waiting for ACK/NACK (ms) */
    static constexpr uint16_t OUTGOING_DATA_ACK_NACK_TIMEOUT = 500;

    /** @brief Timeout for completing incoming data reception (ms) */
    static constexpr uint16_t INCOMING_DATA_WAIT_TIMEOUT = 500;

    /** @brief Timeout for automatically detecting connection resets (ms) */
    static constexpr uint16_t RESET_DETECTION_TIMEOUT = 10000;

    /** @brief Maximum retry attempts for packet transmission */
    static constexpr uint8_t MAX_RETRY_COUNT = 5;

    /** @brief Maximum state changes per loop iteration to prevent infinite loops */
    static constexpr uint8_t MAX_REPLAY_COUNT = PACKAGE_LENGTH + 2;

    /** @brief Size of the packet header in bytes */
    static constexpr uint8_t HEADER_LENGTH = sizeof(PackageHeader);

    /** @brief Size of the packet footer in bytes */
    static constexpr uint8_t FOOTER_LENGTH = sizeof(PackageFooter);

    /**
     * @brief CRC calculation scope
     * @details Calculates CRC over header (excluding startByte) and data.
     *          Specifically: packetNumber + type + length + data fields
     *          This scope is defined by protocol specification.
     */
    static constexpr uint8_t CRC_LENGTH = HEADER_LENGTH - 1 + MAX_DATA_LENGTH;

    /**
     * @enum OutgoingState
     * @brief State machine states for outgoing packet processing
     */
    enum OutgoingState : uint8_t
    {
        READ_DATA = 0,       /**< Reading data from plain stream */
        SEND_PACKAGE,        /**< Sending package to encoded stream */
        WAIT_FOR_ACK_OR_NACK /**< Waiting for acknowledgment */
    };

    /**
     * @enum IncomingState
     * @brief State machine states for incoming packet processing
     */
    enum IncomingState : uint8_t
    {
        WAIT_FOR_START_BYTE = 0, /**< Waiting for start byte */
        READ_INCOMING_DATA,      /**< Reading packet data */
        PROCESS_INCOMING_DATA    /**< Processing received packet */
    };

    /**
     * @struct OutgoingFlags
     * @brief Bit-packed flags for outgoing channel state
     * @note Uses packed attribute for memory efficiency
     */
    struct __attribute__((packed)) OutgoingFlags
    {
        uint8_t m_retryCount : 3;   /**< Current retry count (0-7) */
        uint8_t m_currentState : 2; /**< Current outgoing state (0-3) */
    };

    /**
     * @struct IncomingFlags
     * @brief Bit-packed flags for incoming channel state
     * @note Uses packed attribute for memory efficiency
     */
    struct __attribute__((packed)) IncomingFlags
    {
        uint8_t m_currentState : 2;       /**< Current incoming state (0-3) */
        uint8_t m_incomingDataLength : 5; /**< Length of data received so far (0-31) */
    };

    /**
     * @brief Handles the state machine for outgoing packets
     * @return true if state changed, false otherwise
     */
    bool handleOutgoingState();

    /**
     * @brief Handles the state machine for incoming packets
     * @return true if state changed, false otherwise
     */
    bool handleIncomingState();

    /**
     * @brief Resets the local packet numbering state
     * @details Use this when you detect that communication needs to be reestablished.
     *          This method resets packet counters, clears message queues, and resets state machines.
     */
    void resetPacketNumbering();

    /**
     * @brief Calculates CRC16-CCITT checksum for data integrity
     * @param data Pointer to data buffer
     * @param length Length of data to calculate CRC for
     * @return Calculated CRC16 value
     */
    static uint16_t crc16(const uint8_t *const data, const uint8_t length);

    /**
     * @brief Validates a received packet
     * @param package The packet to validate
     * @return NackReason error code, NO_ERROR if validation successful
     */
    NackReason validatePackage(const Package &package) const;

    /**
     * @brief Prepares a packet for transmission
     * @param package Reference to the packet structure to prepare
     * @param type Type of packet (DATA, ACK, NACK, RESET)
     * @param packetNumber Sequence number for the packet
     * @param dataLength Length of data payload (default 0)
     * @param data Pointer to data buffer (default nullptr)
     */
    void preparePackage(Package &package, const uint8_t type, const uint8_t packetNumber,
                        const uint8_t dataLength = 0, const uint8_t *const data = nullptr) const;

    /**
     * @brief Reports an error through the callback if set
     * @param prefix Flash-stored string prefix identifying the error source
     * @param errorMessage Flash-stored string containing the error message
     */
    void reportError(const __FlashStringHelper *const prefix, const __FlashStringHelper *const errorMessage) const;

    /**
     * @brief Reports a NACK reason through the error callback
     * @param prefix Flash-stored string prefix identifying the error source
     * @param reason The NackReason error code
     */
    void reportNackReason(const __FlashStringHelper *const prefix, const NackReason reason) const;

    /**
     * @brief Resets the outgoing state machine to initial state
     */
    void resetOutgoingState();

    /**
     * @brief Resets the incoming state machine to initial state
     */
    void resetIncomingState();

    /**
     * @brief Sends a packet over the encoded stream
     * @param package The packet to send
     */
    void sendPackage(const Package &package);

    /**
     * @brief Processes a fully received packet
     * @return true if processing successful, false otherwise
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
