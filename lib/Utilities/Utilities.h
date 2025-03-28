/**
 * @file Utilities.h
 * @brief Common utility functions for Arduino applications.
 *
 * This file provides a collection of utility functions and macros for Arduino
 * applications, including debug printing, memory management, bit manipulation,
 * and other common operations.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef UTILITIES_H
#define UTILITIES_H

#include <Arduino.h>
#include <StaticSerialCommands.h>

/**
 * @brief Utility functions to reduce code duplication and flash usage
 */
namespace Utilities
{
    // Macro for converting PROGMEM strings to __FlashStringHelper*
    #define PGMT(str) reinterpret_cast<const __FlashStringHelper *>(str)
    
    // Macro for unused variables
    #define UNUSED(x) (void)(x)

    /**
     * @brief Prints a standard OK response to the serial interface
     *
     * @param sender The SerialCommands instance to use for output
     */
    void printOK(SerialCommands &sender);

    /**
     * @brief Prints an error message to the serial interface
     *
     * @param sender The SerialCommands instance to use for output
     * @param msg The error message (stored in flash)
     */
    void printError(SerialCommands &sender, const __FlashStringHelper *msg);

    /**
     * @brief Prints a byte as a hexadecimal value with leading zero if needed
     *
     * @param sender The SerialCommands instance to use for output
     * @param value The byte to print
     */
    void printHexByte(SerialCommands &sender, byte value);

    /**
     * @brief Prints a byte array as hexadecimal values
     *
     * @param sender The SerialCommands instance to use for output
     * @param data The byte array to print
     * @param length The length of the array
     * @param separator Optional separator between bytes (default: none)
     */
    void printHexArray(SerialCommands &sender, const byte *data, size_t length, char separator = '\0');

    /**
     * @brief Converts a hex character to its numeric value
     *
     * @param c The hex character to convert
     * @param result The resulting byte value
     * @return true if conversion was successful, false otherwise
     */
    bool hexCharToByte(const char c, byte &result);

    /**
     * @brief Converts a hex string to a byte array
     *
     * @param str The hex string to convert
     * @param data The resulting byte array
     * @param length The expected length of the byte array
     * @return true if conversion was successful, false otherwise
     */
    bool hexStringToBytes(const char *str, byte *data, size_t length);

    /**
     * @brief Prints a separator line of stars to the output
     *
     * @param output The Print instance to use for output
     */
    void printStars(Print &output);

    /**
     * @brief Safely disables interrupts with nesting support
     */
    void safeDisableInterrupts();

    /**
     * @brief Safely enables interrupts with nesting support
     */
    void safeEnableInterrupts();

    /**
     * @brief Initializes a controller state
     *
     * @tparam T The type of the state enum
     * @param currentState Reference to the current state variable
     * @param newState The new state to set
     * @return true if the state was changed, false otherwise
     */
    template <typename T>
    bool changeState(T &currentState, const T newState)
    {
        if (currentState != newState)
        {
            currentState = newState;
            return true;
        }
        return false;
    }

} // namespace Utilities

#endif // UTILITIES_H