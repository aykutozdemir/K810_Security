/**
 * @file PackageInterface.h
 * @brief Abstract interface for packet-based communication protocols.
 *
 * This file defines the PackageInterface abstract class, which provides
 * a base interface for implementing various packet-based communication protocols.
 * It manages streams for both plain and encoded data transmission.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef PACKAGEINTERFACE_H
#define PACKAGEINTERFACE_H

#include "PipedStream.h"

/**
 * @brief Abstract interface for packet-based communication protocols.
 *
 * This class provides the foundation for implementing packet-based
 * communication protocols. It handles the piped streams for both raw
 * and encoded data transmission.
 */
class PackageInterface
{
public:
    /**
     * @brief Constructs a PackageInterface instance.
     *
     * @param pipedStreamPair The paired streams used for external communication.
     * @param maxPackageSize The maximum size allowed for a packet.
     */
    PackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t maxPackageSize);

    /**
     * @brief Main processing loop.
     *
     * Derived classes must implement this to handle the main processing loop
     * for encoding and decoding packets.
     */
    virtual void loop() = 0;

    /**
     * @brief Clears all associated streams.
     *
     * Resets all internal and external stream buffers to their initial state.
     */
    void clear();

    /**
     * @brief Gets the plain (decoded) data stream.
     *
     * @return Reference to the stream containing plain data.
     */
    PipedStream &getPlainStream() { return p_pipedStreamPair->first; }

    /**
     * @brief Gets the encoded data stream.
     *
     * @return Reference to the stream containing encoded data.
     */
    PipedStream &getEncodedStream() { return m_packagerStreamPair.first; }

protected:
    /**
     * @brief Gets the internal plain data stream.
     *
     * @return Reference to the internal stream for plain data.
     */
    PipedStream &getInternalPlainStream() { return p_pipedStreamPair->second; }

    /**
     * @brief Gets the internal encoded data stream.
     *
     * @return Reference to the internal stream for encoded data.
     */
    PipedStream &getInternalEncodedStream() { return m_packagerStreamPair.second; }

private:
    PipedStreamPair *p_pipedStreamPair;   ///< Pointer to the external paired streams
    PipedStreamPair m_packagerStreamPair; ///< Internal paired streams for packet processing
};

#endif