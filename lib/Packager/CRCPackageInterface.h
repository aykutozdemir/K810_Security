#ifndef CRCPACKAGEINTERFACE_H
#define CRCPACKAGEINTERFACE_H

#include "PackageInterface.h"
#include "SimpleTimer.h"

class CRCPackageInterface : public PackageInterface
{
public:
    CRCPackageInterface(PipedStream &plainStream);
    virtual void loop() override;

    // NACK reason codes - using uint8_t to minimize size
    enum NackReason : uint8_t
    {
        INVALID_CRC = 0x01,
        INVALID_PACKET_FORMAT = 0x02,
        BUFFER_OVERFLOW = 0x03,
        TIMEOUT = 0x04,
        UNEXPECTED_PACKET_NUMBER = 0x05,
        UNKNOWN_ERROR = 0xFF
    };

private:
    // Package structure constants - grouped together for better memory layout
    constexpr static uint8_t MAX_DATA_LENGTH = 8;
    constexpr static uint8_t START_BYTE = 0xAA;
    constexpr static uint8_t STOP_BYTE = 0x55;

    // Package types as bit flags to save space and enable bit operations
    constexpr static uint8_t DATA_TYPE = 0;
    constexpr static uint8_t ACK_TYPE = 1;
    constexpr static uint8_t NACK_TYPE = 2;

    // Timing constants
    constexpr static uint16_t OUTGOING_DATA_READ_TIMEOUT = 100;
    constexpr static uint16_t OUTGOING_DATA_ACK_NACK_TIMEOUT = 500;
    constexpr static uint16_t INCOMING_DATA_WAIT_TIMEOUT = 500;

    // Retry constants
    constexpr static uint8_t MAX_RETRY_COUNT = 3;
    constexpr static uint8_t MAX_REPLAY_COUNT = MAX_DATA_LENGTH + 1;

    // State machine states as bit flags to save space
    enum OutgoingState : uint8_t
    {
        READ_DATA = 0,
        SEND_PACKAGE = 1,
        WAIT_FOR_ACK_OR_NACK = 2
    };

    enum IncomingState : uint8_t
    {
        WAIT_FOR_START_BYTE = 0,
        READ_INCOMING_DATA = 1,
        PROCESS_INCOMING_DATA = 2
    };

    // Optimized package structure
    struct __attribute__((packed)) DataPackage
    {
        uint8_t startByte;             // Start of packet (e.g., 0xAA)
        uint8_t packetNumber;          // Unique number for each packet (increments per new packet)
        uint8_t type;                  // Packet Type: 0 = Data, 1 = ACK, 2 = NACK
        uint8_t length;                // Length of data (if type = 0, otherwise 0)
        uint8_t data[MAX_DATA_LENGTH]; // Payload data (valid if type = 0)
        uint16_t crc;                  // CRC for error detection
        uint8_t stopByte;              // Stop of packet (e.g., 0x55)
    };

    union __attribute__((packed)) Package
    {
        DataPackage dataPackage;
        uint8_t data[sizeof(DataPackage)];
    };

    // Derived constants - calculated once to save recalculation
    constexpr static uint8_t PACKAGE_LENGTH = sizeof(DataPackage);
    constexpr static uint8_t HEADER_LENGTH = offsetof(DataPackage, data);
    constexpr static uint8_t FOOTER_LENGTH = sizeof(DataPackage) - HEADER_LENGTH - MAX_DATA_LENGTH;

    // CRC calculation
    static uint16_t crc16(const uint8_t *const data, const uint8_t length);
    static const uint16_t CRC_TABLE[4];

    // Package validation and preparation - combined related functions
    bool validatePackage(const Package &package) const;
    void preparePackage(Package &package, const uint8_t type, const uint8_t packetNumber,
                        const uint8_t dataLength = 0, const uint8_t *const data = nullptr) const;

    // State management
    void resetState(const bool isOutgoing);
    void sendPackage(const Package &package);

    // State machine handlers - optimized to reduce function count
    void handleOutgoingStateMachine();
    void handleIncomingStateMachine();
    void processPackage();

    // Individual state handlers
    bool handleOutgoingState();
    bool handleIncomingState();

    // Member variables - grouped by type for better memory alignment
    PipedStreamPair m_packagePipes;
    Package m_outgoingPackage;
    Package m_incomingPackage;
    SimpleTimer<uint16_t> m_outgoingDataTimer;
    SimpleTimer<uint16_t> m_incomingDataTimer;
    uint8_t m_packetNumber;
    uint8_t m_lastReceivedPacketNumber;
    uint8_t m_incomingDataLength;
    uint8_t m_retryCount;
    OutgoingState m_currentStateForOutgoingPackage;
    IncomingState m_currentStateForIncomingPackage;
    bool m_isAckReceived;
    bool m_isNackReceived;
};

#endif // CRCPACKAGEINTERFACE_H
