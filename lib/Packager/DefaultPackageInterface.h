/**
 * @file DefaultPackageInterface.h
 * @brief Default implementation of the PackageInterface.
 *
 * This file defines the DefaultPackageInterface class, which provides
 * a simple pass-through implementation of the PackageInterface for
 * scenarios where no special encoding or decoding is required.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef DEFAULTPACKAGEINTERFACE_H
#define DEFAULTPACKAGEINTERFACE_H

#include "PackageInterface.h"

/**
 * @brief Default implementation of the PackageInterface.
 *
 * This class provides a simple pass-through implementation of the PackageInterface,
 * where data is transferred between the internal and external streams without
 * any special encoding or processing.
 */
class DefaultPackageInterface : public PackageInterface
{
public:
    /**
     * @brief Default buffer size for the encoded stream.
     *
     * This constant defines the default buffer size used for the encoded stream
     * if no specific size is provided in the constructor.
     */
    static constexpr uint8_t DEFAULT_PACKAGE_LENGTH = 8;

    /**
     * @brief Constructs a DefaultPackageInterface instance.
     *
     * @param pipedStreamPair The paired streams used for external communication.
     * @param encodedBufferSize The size of the buffer for encoded data, defaults to DEFAULT_PACKAGE_LENGTH.
     */
    explicit DefaultPackageInterface(PipedStreamPair &pipedStreamPair, const uint16_t encodedBufferSize = DEFAULT_PACKAGE_LENGTH);

    /**
     * @brief Main processing loop.
     *
     * Transfers data between the internal and external streams without any special encoding.
     * This implements the pure virtual method from the base class.
     */
    virtual void loop() override;
};

#endif