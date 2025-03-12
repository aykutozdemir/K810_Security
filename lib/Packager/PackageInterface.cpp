/**
 * @file PackageInterface.cpp
 * @brief Implementation of the PackageInterface abstract class.
 *
 * This file implements the methods of the PackageInterface abstract class,
 * which provides a base interface for packet-based communication protocols.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "PackageInterface.h"
#include "PipedStream.h"

/**
 * @brief Constructs a PackageInterface instance.
 *
 * Initializes the PackageInterface with the provided paired streams and buffer size.
 * The paired streams are used for external communication, while an internal paired
 * stream is created for packet processing.
 *
 * @param pipedStreamPair The paired streams used for external communication.
 * @param encodedBufferSize The size of the buffer for encoded data.
 */
PackageInterface::PackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize)
    : p_pipedStreamPair(&pipedStreamPair),
      m_packagerStreamPair(encodedBufferSize)
{
}

/**
 * @brief Clears all associated streams.
 *
 * Resets all internal and external stream buffers to their initial state.
 * This includes both sides of the external pipedStreamPair and the internal
 * packagerStreamPair.
 */
void PackageInterface::clear()
{
    p_pipedStreamPair->first.clear();
    p_pipedStreamPair->second.clear();
    m_packagerStreamPair.first.clear();
    m_packagerStreamPair.second.clear();
}
