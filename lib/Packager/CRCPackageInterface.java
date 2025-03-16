/**
 * CRC Package Interface - Reliable packet-based communication protocol
 * 
 * This class implements a reliable communication protocol with the following features:
 * - Fixed 15-byte packet format (4B header + 8B payload + 3B footer)
 * - CRC-16-CCITT error detection
 * - Automatic retransmission with ACK/NACK
 * - Connection state monitoring
 * - Thread-safe operation
 * 
 * The protocol uses state machines for both outgoing and incoming channels:
 * - Outgoing: READ_DATA → SEND_PACKAGE → WAIT_FOR_ACK_OR_NACK
 * - Incoming: WAIT_FOR_START_BYTE → READ_INCOMING_DATA → PROCESS_INCOMING_DATA
 * 
 * @author Aykut ÖZDEMİR
 */
package com.goldenhorn.k810security;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;

public class CRCPackageInterface {
    // Protocol frame markers
    /** Start of packet marker (0xAA) */
    private static final byte START_BYTE = (byte) 0xAA;
    /** End of packet marker (0x55) */
    private static final byte STOP_BYTE = (byte) 0x55;

    // Protocol parameters
    /** Maximum payload size per packet */
    private static final int MAX_DATA_LENGTH = 8;
    /** Total packet size: Header(4) + Data(8) + Footer(3) */
    private static final int PACKAGE_LENGTH = 15;
    /** Maximum retransmission attempts */
    private static final int MAX_RETRY_COUNT = 5;
    /** Maximum state transitions per loop */
    private static final int MAX_REPLAY_COUNT = 17;
    /** Main loop delay (milliseconds) */
    private static final int LOOP_DELAY_MS = 10;

    // Protocol timeouts (milliseconds)
    /** Timeout for collecting outgoing data */
    private static final long OUTGOING_DATA_READ_TIMEOUT = 100;
    /** Timeout waiting for ACK/NACK */
    private static final long OUTGOING_DATA_ACK_NACK_TIMEOUT = 500;
    /** Timeout for receiving complete packet */
    private static final long INCOMING_DATA_WAIT_TIMEOUT = 500;
    /** Connection reset detection timeout */
    private static final long RESET_DETECTION_TIMEOUT = 10000;

    // Packet type identifiers
    /** Regular data packet */
    private static final byte DATA_TYPE = 0x00;
    /** Positive acknowledgment */
    private static final byte ACK_TYPE = 0x01;
    /** Negative acknowledgment */
    private static final byte NACK_TYPE = 0x02;
    /** Connection reset request */
    private static final byte RESET_TYPE = 0x03;

    // Communication streams
    /** Raw input stream for receiving data */
    private final InputStream inputStream;
    /** Raw output stream for sending data */
    private final OutputStream outputStream;

    // Thread-safe message queues
    /** Queue for outgoing data chunks */
    private final ConcurrentLinkedQueue<byte[]> outgoingDataQueue;
    /** Queue for received data chunks */
    private final ConcurrentLinkedQueue<byte[]> incomingDataQueue;
    /** Queue for ACK/NACK messages */
    private final ConcurrentLinkedQueue<PendingMessage> messageQueue;

    // Thread control
    /** Protocol running state flag */
    private final AtomicBoolean isRunning;
    /** Lock for thread synchronization */
    private final Object threadLock;

    // Protocol timers
    /** Timer for outgoing operations */
    private final Timer outgoingTimer;
    /** Timer for incoming operations */
    private final Timer incomingTimer;
    /** Timer for connection monitoring */
    private final Timer resetDetectionTimer;

    // Sequence tracking
    /** Current outgoing packet number (1-255) */
    private byte outgoingPacketNumber;
    /** Last received packet number */
    private byte lastIncomingPacketNumber;

    // Protocol state machines
    /** Current state of outgoing channel */
    private OutgoingState outgoingState;
    /** Current state of incoming channel */
    private IncomingState incomingState;

    // Packet buffers
    /** Buffer for outgoing packet */
    private Package outgoingPackage;
    /** Buffer for incoming packet */
    private Package incomingPackage;
    /** Bytes received for current incoming packet */
    private int incomingDataLength;
    /** Current retransmission attempt count */
    private int retryCount;

    /** Callback for error notifications */
    private ErrorCallback errorCallback;

    /** Background communication thread */
    private Thread communicationThread;

    /**
     * Initializes communication interface
     * 
     * @param inputStream Stream for receiving data
     * @param outputStream Stream for sending data
     */
    public CRCPackageInterface(InputStream inputStream, OutputStream outputStream) {
        this.inputStream = inputStream;
        this.outputStream = outputStream;
        this.outgoingDataQueue = new ConcurrentLinkedQueue<>();
        this.incomingDataQueue = new ConcurrentLinkedQueue<>();
        this.messageQueue = new ConcurrentLinkedQueue<>();
        this.isRunning = new AtomicBoolean(false);
        this.threadLock = new Object();
        this.outgoingPacketNumber = 1;
        this.lastIncomingPacketNumber = 0;
        this.outgoingState = OutgoingState.READ_DATA;
        this.incomingState = IncomingState.WAIT_FOR_START_BYTE;
        this.outgoingTimer = new Timer(OUTGOING_DATA_READ_TIMEOUT);
        this.incomingTimer = new Timer(INCOMING_DATA_WAIT_TIMEOUT);
        this.resetDetectionTimer = new Timer(RESET_DETECTION_TIMEOUT);
        this.outgoingPackage = new Package();
        this.incomingPackage = new Package();
    }

    /**
     * Starts protocol operation
     * 
     * Creates and starts background communication thread
     * if not already running. Thread-safe.
     */
    public void start() {
        synchronized (threadLock) {
            if (isRunning.get()) return;
            isRunning.set(true);
            communicationThread = new Thread(new CommunicationRunnable());
            communicationThread.setName("CRC-Communication-Thread");
            communicationThread.start();
        }
    }

    /**
     * Stops protocol operation
     * 
     * Gracefully stops background thread and waits for completion.
     * Thread-safe.
     */
    public void stop() {
        synchronized (threadLock) {
            isRunning.set(false);
            if (communicationThread != null) {
                communicationThread.interrupt();
                try {
                    communicationThread.join(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
                communicationThread = null;
            }
        }
    }

    /**
     * Checks if protocol is running
     * 
     * @return true if background thread is active
     */
    public boolean isRunning() {
        return isRunning.get();
    }

    /**
     * Main protocol processing loop
     * 
     * Performs one iteration of protocol processing:
     * 1. Check connection timeout
     * 2. Process outgoing state machine
     * 3. Process incoming state machine
     * 4. Handle error conditions
     * 
     * @throws IOException on communication error
     */
    private void loop() throws IOException {
        if (resetDetectionTimer.isReady()) {
            resetPacketNumbering();
            resetDetectionTimer.reset();
        }

        // Outgoing state machine
        int outgoingStateChanges = 0;
        boolean outgoingChanged;
        do {
            outgoingChanged = handleOutgoingState();
            if (outgoingChanged) outgoingStateChanges++;
        } while (outgoingChanged && outgoingStateChanges < MAX_REPLAY_COUNT);

        if (outgoingStateChanges == MAX_REPLAY_COUNT) {
            reportError("CRC:O:", "MaxStateChg");
        }

        // Incoming state machine
        int incomingStateChanges = 0;
        boolean incomingChanged;
        do {
            incomingChanged = handleIncomingState();
            if (incomingChanged) incomingStateChanges++;
        } while (incomingChanged && incomingStateChanges < MAX_REPLAY_COUNT);

        if (incomingStateChanges == MAX_REPLAY_COUNT) {
            reportError("CRC:I:", "MaxStateChg");
        }
    }

    /**
     * Registers error callback handler
     * 
     * @param callback Function to receive error notifications
     */
    public void setErrorCallback(ErrorCallback callback) {
        this.errorCallback = callback;
    }

    /**
     * Queues data for transmission
     * 
     * Splits data into chunks of maximum payload size
     * and queues for transmission.
     * 
     * @param data Data buffer to send
     * @param length Number of bytes to send
     */
    public void sendData(byte[] data, int length) {
        if (data == null || length <= 0) return;
        int offset = 0;
        while (offset < length) {
            int chunkSize = Math.min(MAX_DATA_LENGTH, length - offset);
            byte[] chunk = new byte[chunkSize];
            System.arraycopy(data, offset, chunk, 0, chunkSize);
            outgoingDataQueue.offer(chunk);
            offset += chunkSize;
        }
    }

    /**
     * Retrieves received data
     * 
     * Combines all received chunks into single buffer.
     * 
     * @return Combined received data or null if none
     */
    public byte[] readData() {
        if (incomingDataQueue.isEmpty()) return null;
        int totalSize = 0;
        for (byte[] chunk : incomingDataQueue) totalSize += chunk.length;
        byte[] combined = new byte[totalSize];
        int offset = 0;
        while (!incomingDataQueue.isEmpty()) {
            byte[] chunk = incomingDataQueue.poll();
            if (chunk == null) continue;
            System.arraycopy(chunk, 0, combined, offset, chunk.length);
            offset += chunk.length;
        }
        return combined;
    }

    /**
     * Initiates connection reset
     * 
     * Sends reset packet and resets local state.
     * 
     * @throws IOException on communication error
     */
    public void sendResetPacket() throws IOException {
        Package resetPackage = new Package();
        preparePackage(resetPackage, RESET_TYPE, (byte) 0, (byte) 0, null);
        sendPackage(resetPackage);
        resetPacketNumbering();
    }

    /**
     * Resets protocol state
     * 
     * Resets packet numbering, clears queues,
     * and resets state machines.
     */
    private void resetPacketNumbering() {
        if (outgoingPacketNumber == 1) return;
        outgoingPacketNumber = 1;
        lastIncomingPacketNumber = 0;
        messageQueue.clear();
        outgoingDataQueue.clear();
        incomingDataQueue.clear();
        resetOutgoingState();
        resetIncomingState();
        reportError("CRC:", "ResetNum");
    }

    /**
     * Resets outgoing channel state
     * 
     * Clears packet buffer and resets state machine.
     */
    private void resetOutgoingState() {
        outgoingPackage = new Package();
        outgoingState = OutgoingState.READ_DATA;
        retryCount = 0;
        outgoingTimer.setInterval(OUTGOING_DATA_READ_TIMEOUT);
        outgoingTimer.reset();
    }

    /**
     * Resets incoming channel state
     * 
     * Clears packet buffer and resets state machine.
     */
    private void resetIncomingState() {
        incomingPackage = new Package();
        incomingDataLength = 0;
        incomingState = IncomingState.WAIT_FOR_START_BYTE;
        incomingTimer.setInterval(INCOMING_DATA_WAIT_TIMEOUT);
        incomingTimer.reset();
    }

    /**
     * Prepares packet for transmission
     * 
     * Sets header fields, copies payload,
     * and calculates CRC.
     * 
     * @param pkg Packet to prepare
     * @param type Packet type
     * @param packetNumber Sequence number
     * @param dataLength Payload length
     * @param data Optional payload data
     */
    private void preparePackage(Package pkg, byte type, byte packetNumber, byte dataLength, byte[] data) {
        pkg.header.startByte = START_BYTE;
        pkg.header.packetNumber = packetNumber;
        pkg.header.type = type;
        pkg.header.length = dataLength;
        if (data != null && dataLength > 0) {
            System.arraycopy(data, 0, pkg.data, 0, dataLength);
        }
        pkg.footer.stopByte = STOP_BYTE;
        pkg.footer.crc = (short) calculateCRC16(pkg);
    }

    /**
     * Transmits packet
     * 
     * Serializes and sends packet over output stream.
     * 
     * @param pkg Packet to send
     * @throws IOException on communication error
     */
    private void sendPackage(Package pkg) throws IOException {
        byte[] buffer = pkg.toByteArray();
        outputStream.write(buffer);
        outputStream.flush();
    }

    /**
     * Calculates CRC-16-CCITT checksum
     * 
     * Uses polynomial 0x1021 (x^16 + x^12 + x^5 + 1)
     * 
     * @param pkg Packet to checksum
     * @return Calculated CRC value
     */
    private int calculateCRC16(Package pkg) {
        byte[] data = pkg.toByteArray();
        int crc = 0xFFFF;
        for (int i = 1; i < (data.length - 3); i++) {
            int currentByte = data[i] & 0xFF;
            crc ^= (currentByte << 8);
            crc &= 0xFFFF;
            for (int bit = 0; bit < 8; bit++) {
                int msb = crc & 0x8000;
                crc = (crc << 1) & 0xFFFF;
                if (msb != 0) {
                    crc ^= 0x1021;
                    crc &= 0xFFFF;
                }
            }
        }
        return crc & 0xFFFF;
    }

    /**
     * Handles outgoing state machine
     * 
     * Processes one state machine iteration:
     * - READ_DATA: Collect data to send
     * - SEND_PACKAGE: Transmit packet
     * - WAIT_FOR_ACK_OR_NACK: Wait for response
     * 
     * @return true if state changed
     * @throws IOException on communication error
     */
    private boolean handleOutgoingState() throws IOException {
        PendingMessage message = messageQueue.poll();
        if (message != null) {
            if (message.type == PendingMessageType.ACK_RECEIVED &&
                    message.packetNumber == outgoingPacketNumber &&
                    outgoingState == OutgoingState.WAIT_FOR_ACK_OR_NACK) {
                outgoingPacketNumber++;
                resetOutgoingState();
                return true;
            } else if (message.type == PendingMessageType.NACK_RECEIVED &&
                    message.packetNumber == outgoingPacketNumber &&
                    outgoingState == OutgoingState.WAIT_FOR_ACK_OR_NACK) {
                retryCount++;
                reportError("CRC:O:", "Retry");
                outgoingState = OutgoingState.SEND_PACKAGE;
                return true;
            }
        }

        switch (outgoingState) {
            case READ_DATA:
                if (!outgoingDataQueue.isEmpty()) {
                    byte[] nextChunk = outgoingDataQueue.poll();
                    if (nextChunk != null) {
                        retryCount = 0;
                        System.arraycopy(nextChunk, 0, outgoingPackage.data, 0, nextChunk.length);
                        outgoingPackage.header.length = (byte) nextChunk.length;
                        outgoingState = OutgoingState.SEND_PACKAGE;
                        return true;
                    }
                }
                break;

            case SEND_PACKAGE:
                preparePackage(outgoingPackage, DATA_TYPE, outgoingPacketNumber,
                        outgoingPackage.header.length, null);
                sendPackage(outgoingPackage);
                outgoingState = OutgoingState.WAIT_FOR_ACK_OR_NACK;
                outgoingTimer.setInterval(OUTGOING_DATA_ACK_NACK_TIMEOUT);
                outgoingTimer.reset();
                return true;

            case WAIT_FOR_ACK_OR_NACK:
                if (outgoingTimer.isReady()) {
                    if (retryCount >= MAX_RETRY_COUNT) {
                        reportError("CRC:O:", "MaxRetry");
                        resetOutgoingState();
                    } else {
                        retryCount++;
                        reportError("CRC:O:", "Retry");
                        outgoingState = OutgoingState.SEND_PACKAGE;
                    }
                    return true;
                }
                break;
        }
        return false;
    }

    /**
     * Handles incoming state machine
     * 
     * Processes one state machine iteration:
     * - WAIT_FOR_START_BYTE: Find packet start
     * - READ_INCOMING_DATA: Receive packet
     * - PROCESS_INCOMING_DATA: Handle packet
     * 
     * @return true if state changed
     * @throws IOException on communication error
     */
    private boolean handleIncomingState() throws IOException {
        switch (incomingState) {
            case WAIT_FOR_START_BYTE:
                if (inputStream.available() > 0) {
                    int b = inputStream.read();
                    if ((byte) b == START_BYTE) {
                        incomingState = IncomingState.READ_INCOMING_DATA;
                        incomingTimer.reset();
                        incomingDataLength = 1;
                        incomingPackage.header.startByte = START_BYTE;
                        return true;
                    }
                }
                break;

            case READ_INCOMING_DATA:
                if (incomingTimer.isReady() && inputStream.available() == 0) {
                    resetIncomingState();
                    return true;
                }

                while (inputStream.available() > 0 && incomingDataLength < PACKAGE_LENGTH) {
                    int b = inputStream.read();
                    byte[] packageBytes = incomingPackage.toByteArray();
                    packageBytes[incomingDataLength++] = (byte) b;
                    rebuildPackageFromArray(incomingPackage, packageBytes);
                }

                if (incomingDataLength == PACKAGE_LENGTH) {
                    incomingState = IncomingState.PROCESS_INCOMING_DATA;
                    return true;
                }
                break;

            case PROCESS_INCOMING_DATA:
                return processPackage();
        }
        return false;
    }

    /**
     * Rebuilds packet from raw bytes
     * 
     * Copies raw bytes into packet structure.
     * 
     * @param pkg Packet to rebuild
     * @param raw Raw packet bytes
     */
    private void rebuildPackageFromArray(Package pkg, byte[] raw) {
        pkg.header.startByte = raw[0];
        pkg.header.packetNumber = raw[1];
        pkg.header.type = raw[2];
        pkg.header.length = raw[3];
        System.arraycopy(raw, 4, pkg.data, 0, MAX_DATA_LENGTH);
        pkg.footer.crc = (short) (((raw[PACKAGE_LENGTH - 3] & 0xFF) << 8) | (raw[PACKAGE_LENGTH - 2] & 0xFF));
        pkg.footer.stopByte = raw[PACKAGE_LENGTH - 1];
    }

    /**
     * Processes received packet
     * 
     * Validates and handles packet based on type:
     * - DATA: Store payload, send ACK
     * - RESET: Reset state, send ACK
     * - ACK/NACK: Update outgoing state
     * 
     * @return true if processed successfully
     * @throws IOException on communication error
     */
    private boolean processPackage() throws IOException {
        resetDetectionTimer.reset();
        NackReason validationResult = validatePackage(incomingPackage);

        if (validationResult == NackReason.NO_ERROR) {
            switch (incomingPackage.header.type) {
                case DATA_TYPE:
                    if (incomingPackage.header.packetNumber > lastIncomingPacketNumber) {
                        if (incomingPackage.header.length > 0) {
                            byte[] chunk = Arrays.copyOfRange(incomingPackage.data, 0,
                                    Math.min(incomingPackage.header.length, MAX_DATA_LENGTH));
                            incomingDataQueue.offer(chunk);
                        }
                        lastIncomingPacketNumber = incomingPackage.header.packetNumber;
                    }
                    Package ackPackage = new Package();
                    preparePackage(ackPackage, ACK_TYPE, incomingPackage.header.packetNumber, (byte) 0, null);
                    sendPackage(ackPackage);
                    break;

                case RESET_TYPE:
                    resetPacketNumbering();
                    Package resetAckPackage = new Package();
                    preparePackage(resetAckPackage, ACK_TYPE, (byte) 0, (byte) 0, null);
                    sendPackage(resetAckPackage);
                    break;

                case ACK_TYPE:
                    if (incomingPackage.header.packetNumber == outgoingPacketNumber) {
                        PendingMessage message = new PendingMessage();
                        message.type = PendingMessageType.ACK_RECEIVED;
                        message.packetNumber = incomingPackage.header.packetNumber;
                        messageQueue.offer(message);
                    }
                    break;

                case NACK_TYPE:
                    if (incomingPackage.header.packetNumber == outgoingPacketNumber) {
                        PendingMessage message = new PendingMessage();
                        message.type = PendingMessageType.NACK_RECEIVED;
                        message.packetNumber = incomingPackage.header.packetNumber;
                        message.nackReason = incomingPackage.header.length > 0
                                ? NackReason.values()[incomingPackage.data[0]]
                                : NackReason.NO_ERROR;
                        messageQueue.offer(message);
                    }
                    break;
            }
        } else {
            reportError("CRC:I:", validationResult.toString());
            if (incomingPackage.header.type == DATA_TYPE) {
                Package nackPackage = new Package();
                byte[] reasonData = new byte[]{(byte) validationResult.ordinal()};
                preparePackage(nackPackage, NACK_TYPE, incomingPackage.header.packetNumber,
                        (byte) 1, reasonData);
                sendPackage(nackPackage);
            }
        }

        resetIncomingState();
        return true;
    }

    /**
     * Validates received packet
     * 
     * Checks:
     * - Frame markers
     * - Packet type
     * - Payload length
     * - CRC checksum
     * 
     * @param pkg Packet to validate
     * @return Error code (NO_ERROR if valid)
     */
    private NackReason validatePackage(Package pkg) {
        if (pkg.header.startByte != START_BYTE || pkg.footer.stopByte != STOP_BYTE) {
            return NackReason.INVALID_START_STOP;
        }
        if (pkg.header.type > RESET_TYPE) {
            return NackReason.INVALID_TYPE;
        }
        if (pkg.header.type == DATA_TYPE && pkg.header.length > MAX_DATA_LENGTH) {
            return NackReason.INVALID_LENGTH;
        } else if ((pkg.header.type == NACK_TYPE && pkg.header.length != 1) ||
                (pkg.header.type == ACK_TYPE && pkg.header.length != 0) ||
                (pkg.header.type == RESET_TYPE && pkg.header.length != 0)) {
            return NackReason.INVALID_LENGTH;
        }

        int calculatedCrc = calculateCRC16(pkg);
        if (calculatedCrc != (pkg.footer.crc & 0xFFFF)) {
            return NackReason.INVALID_CRC;
        }
        return NackReason.NO_ERROR;
    }

    /**
     * Reports error through callback
     * 
     * @param prefix Error category
     * @param error Error message
     */
    private void reportError(String prefix, String error) {
        if (errorCallback != null) {
            errorCallback.onError(prefix + error);
        }
    }

    // Inner classes and enums
    /**
     * States for outgoing channel state machine
     */
    private enum OutgoingState {
        /** Collecting data to send */
        READ_DATA,
        /** Preparing and transmitting packet */
        SEND_PACKAGE,
        /** Waiting for acknowledgment */
        WAIT_FOR_ACK_OR_NACK
    }

    /**
     * States for incoming channel state machine
     */
    private enum IncomingState {
        /** Looking for packet start marker */
        WAIT_FOR_START_BYTE,
        /** Receiving packet bytes */
        READ_INCOMING_DATA,
        /** Validating and handling packet */
        PROCESS_INCOMING_DATA
    }

    /**
     * Types of pending acknowledgment messages
     */
    private enum PendingMessageType {
        /** Positive acknowledgment received */
        ACK_RECEIVED,
        /** Negative acknowledgment received */
        NACK_RECEIVED
    }

    /**
     * Error codes for packet validation failures
     */
    private enum NackReason {
        /** Packet validation successful */
        NO_ERROR,
        /** CRC-16 checksum mismatch */
        INVALID_CRC,
        /** Missing/incorrect frame markers */
        INVALID_START_STOP,
        /** Unknown packet type */
        INVALID_TYPE,
        /** Invalid payload length */
        INVALID_LENGTH
    }

    /**
     * Interface for error event notifications
     */
    public interface ErrorCallback {
        /**
         * Called when protocol error occurs
         * @param error Error message with prefix
         */
        void onError(String error);
    }

    /**
     * Complete packet structure
     */
    private static class Package {
        /** Packet header (4 bytes) */
        Header header;
        /** Packet payload (8 bytes max) */
        byte[] data;
        /** Packet footer (3 bytes) */
        Footer footer;

        /**
         * Creates empty packet with zeroed fields
         */
        Package() {
            header = new Header();
            data = new byte[MAX_DATA_LENGTH];
            footer = new Footer();
        }

        /**
         * Serializes packet to byte array
         * @return Raw packet bytes
         */
        byte[] toByteArray() {
            byte[] result = new byte[PACKAGE_LENGTH];
            // Copy header fields
            result[0] = header.startByte;
            result[1] = header.packetNumber;
            result[2] = header.type;
            result[3] = header.length;
            // Copy payload
            System.arraycopy(data, 0, result, 4, MAX_DATA_LENGTH);
            // Copy footer fields
            result[PACKAGE_LENGTH - 3] = (byte) ((footer.crc >> 8) & 0xFF);
            result[PACKAGE_LENGTH - 2] = (byte) (footer.crc & 0xFF);
            result[PACKAGE_LENGTH - 1] = footer.stopByte;
            return result;
        }
    }

    /**
     * Packet header structure
     */
    private static class Header {
        /** Start of packet marker */
        byte startByte;
        /** Packet sequence number */
        byte packetNumber;
        /** Packet type identifier */
        byte type;
        /** Payload length */
        byte length;
    }

    /**
     * Packet footer structure
     */
    private static class Footer {
        /** CRC-16 checksum */
        short crc;
        /** End of packet marker */
        byte stopByte;
    }

    /**
     * Queued acknowledgment message
     */
    private static class PendingMessage {
        /** Message type (ACK/NACK) */
        PendingMessageType type;
        /** Associated packet number */
        byte packetNumber;
        /** Error code if NACK */
        NackReason nackReason;
    }

    /**
     * Protocol timer with millisecond precision
     */
    private static class Timer {
        /** Timer duration in milliseconds */
        private long interval;
        /** Last reset timestamp */
        private long lastReset;

        /**
         * Creates timer with specified interval
         * @param interval Timer duration (ms)
         */
        Timer(long interval) {
            this.interval = interval;
            reset();
        }

        /**
         * Updates timer duration
         * @param interval New duration (ms)
         */
        void setInterval(long interval) {
            this.interval = interval;
        }

        /**
         * Restarts timer from current time
         */
        void reset() {
            lastReset = System.currentTimeMillis();
        }

        /**
         * Checks if timer has expired
         * @return true if interval elapsed
         */
        boolean isReady() {
            return System.currentTimeMillis() - lastReset >= interval;
        }
    }

    /**
     * Background communication thread implementation
     */
    private class CommunicationRunnable implements Runnable {
        @Override
        public void run() {
            try {
                // Main protocol loop
                while (isRunning.get() && !Thread.currentThread().isInterrupted()) {
                    try {
                        // Process one protocol iteration
                        loop();
                        // Delay before next iteration
                        Thread.sleep(LOOP_DELAY_MS);
                    } catch (IOException e) {
                        reportError("CRC:Thread", "IO Error: " + e.getMessage());
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                }
            } finally {
                try {
                    // Clean up on thread exit
                    resetPacketNumbering();
                } catch (Exception e) {
                    reportError("CRC:Thread", "Cleanup Error: " + e.getMessage());
                }
            }
        }
    }
}