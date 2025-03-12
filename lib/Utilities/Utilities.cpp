/**
 * @file Utilities.cpp
 * @brief Implementation of common utility functions.
 *
 * This file contains the implementation of utility functions for Arduino applications,
 * including debug printing, memory management, and other common operations.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "Utilities.h"
#include <SafeInterrupts.h>

namespace Utilities
{

    void printOK(SerialCommands &sender)
    {
        sender.getSerial().println(F("\r\nOK"));
    }

    void printError(SerialCommands &sender, const __FlashStringHelper *msg)
    {
        sender.getSerial().print(F("ERROR: "));
        sender.getSerial().println(msg);
    }

    void printHexByte(SerialCommands &sender, byte value)
    {
        static const char hexChars[] PROGMEM = "0123456789ABCDEF";
        sender.getSerial().write(pgm_read_byte(&hexChars[value >> 4]));
        sender.getSerial().write(pgm_read_byte(&hexChars[value & 0x0F]));
    }

    void printHexArray(SerialCommands &sender, const byte *data, size_t length, char separator)
    {
        for (size_t i = 0; i < length; i++)
        {
            printHexByte(sender, data[i]);
            if (separator != '\0' && i < length - 1)
            {
                sender.getSerial().write(separator);
            }
        }
    }

    bool hexCharToByte(const char c, byte &result)
    {
        if (c >= '0' && c <= '9')
        {
            result = c - '0';
            return true;
        }
        if (c >= 'a' && c <= 'f')
        {
            result = c - 'a' + 10;
            return true;
        }
        if (c >= 'A' && c <= 'F')
        {
            result = c - 'A' + 10;
            return true;
        }
        return false;
    }

    bool hexStringToBytes(const char *str, byte *data, size_t length)
    {
        // Check if string is long enough (2 chars per byte)
        size_t strLen = strlen(str);
        if (strLen < length * 2)
        {
            return false;
        }

        for (size_t i = 0; i < length; i++)
        {
            byte high, low;
            if (!hexCharToByte(str[i * 2], high) || !hexCharToByte(str[i * 2 + 1], low))
            {
                return false;
            }
            data[i] = (high << 4) | low;
        }

        return true;
    }

    void printStars(Print &output)
    {
        output.println(F("********************"));
    }

    void safeDisableInterrupts()
    {
        SafeInterrupts::disable();
    }

    void safeEnableInterrupts()
    {
        SafeInterrupts::enable();
    }

} // namespace Utilities