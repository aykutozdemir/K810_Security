/**
 * @file DefaultPackageInterface.cpp
 * @brief Implementation of the DefaultPackageInterface class.
 *
 * This file implements the methods of the DefaultPackageInterface class,
 * which provides a simple pass-through implementation of the PackageInterface.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "DefaultPackageInterface.h"
#include "PipedStream.h"
#include <Arduino.h>

// This constant is already defined in the header file as a static class member
// const uint8_t DEFAULT_PACKAGE_LENGTH = 8;

/**
 * @brief Constructs a DefaultPackageInterface instance.
 *
 * Initializes the DefaultPackageInterface by passing the parameters to the
 * PackageInterface base class constructor.
 *
 * @param pipedStreamPair The paired streams used for external communication.
 * @param encodedBufferSize The size of the buffer for encoded data.
 */
DefaultPackageInterface::DefaultPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize)
    : PackageInterface(pipedStreamPair, encodedBufferSize)
{
}

/**
 * @brief Main processing loop.
 *
 * Implements the main processing loop that transfers data between internal
 * and external streams in both directions. This is a simple pass-through
 * implementation with no special encoding or decoding.
 *
 * The method first transfers data from plain to encoded stream, then from
 * encoded to plain stream, as long as there is available data and space.
 */
void DefaultPackageInterface::loop()
{
    PipedStream &plain = getInternalPlainStream();
    PipedStream &encoded = getInternalEncodedStream();

    // Transfer data from plain to encoded stream
    while ((plain.available() > 0) && (encoded.availableForWrite() > 0))
    {
        encoded.write(plain.read());
    }

    // Transfer data from encoded to plain stream
    while ((encoded.available() > 0) && (plain.availableForWrite() > 0))
    {
        plain.write(encoded.read());
    }
}