/**
 * @file Traceable.h
 * @brief Provides a debug and tracing utility for Arduino projects.
 *
 * This file contains the Traceable class, which offers a flexible and efficient
 * debug logging system optimized for Arduino. It supports multiple debug levels,
 * source code location tracking, and method chaining, all while being optimized
 * for both RAM and flash memory usage.
 *
 * @note This utility is designed to have zero overhead when debugging is disabled.
 *
 * @date 2024-03-11
 * @author Aykut ÖZDEMİR
 */

#ifndef TRACEABLE_H
#define TRACEABLE_H

#include <Arduino.h>
#include <Print.h>
#include "../ArduinoMap/ArduinoMap.h" // Assumed to be a lightweight map implementation for embedded systems

/**
 * @class Traceable
 * @brief Debug and tracing utility class for Arduino.
 *
 * The Traceable class provides a flexible and efficient debug logging system.
 * It supports multiple debug levels, source code location tracking, and method chaining.
 * The implementation is optimized for both RAM and flash memory usage.
 */
class Traceable
{
public:
    /**
     * @enum Level
     * @brief Enumeration of debug levels in order of severity.
     *
     * These levels determine the verbosity of the logs:
     * - OFF: No debug output
     * - ERROR: Critical errors only
     * - WARN: Warnings and errors
     * - INFO: General information, warnings, and errors
     * - DEBUG: Detailed debug information
     * - TRACE: Most verbose level for detailed tracing
     */
    enum class Level : uint8_t
    {
        OFF = 0,
        ERROR,
        WARN,
        INFO,
        DEBUG,
        TRACE
    };

    /**
     * @brief Constructs a Traceable instance with a function name.
     *
     * Each function name will have a unique settings entry
     * for output device and debug level.
     *
     * @param functionName The name of the function for tracing.
     */
    Traceable(const __FlashStringHelper *const functionName);

    // Debug level setters and getters

    void setLevel(const Level level);
    Level getLevel() const;
    bool isEnabled(const Level level) const;

    // Output redirection

    void setOutput(Print &output);
    Print *getOutput() const;

    // Logging methods for each level

    Print &printError(const __FlashStringHelper *const file, const int line);
    Print &printWarn(const __FlashStringHelper *const file, const int line);
    Print &printInfo(const __FlashStringHelper *const file, const int line);
    Print &printDebug(const __FlashStringHelper *const file, const int line);
    Print &printTrace(const __FlashStringHelper *const file, const int line);

    /**
     * @brief Provides a dummy print wrapper for disabled debug levels.
     *
     * Returns a no-op printer that is optimized away by the compiler
     * when logging is disabled.
     */
    Print &printDummy();

private:
    /**
     * @class Settings
     * @brief Stores configuration for each Traceable instance.
     *
     * Each function has its own settings (printer and level).
     */
    class Settings
    {
    public:
        Settings(Print *const printer, const Level level);
        inline Print *const getPrinter() const;
        inline void setPrinter(Print *printer);
        inline Level getLevel() const;
        inline void setLevel(const Level level);

    private:
        Print *printer;
        Level level;
    };

    /**
     * @class DummyPrintWrapper
     * @brief Dummy writer that outputs nothing.
     *
     * Used to eliminate logging overhead when disabled.
     */
    class DummyPrintWrapper : public Print
    {
    public:
        static DummyPrintWrapper &instance();
        size_t write(uint8_t) override;
        size_t write(const uint8_t *, size_t) override;

    private:
        DummyPrintWrapper() = default;
    };

    /**
     * @class PrintWrapper
     * @brief Wrapper around Print with debug context.
     *
     * This class adds the debug level, file, and line info,
     * then allows chaining further output using `<<` or `.print()`.
     */
    class PrintWrapper : public Print
    {
    public:
        static PrintWrapper &instance(Traceable &traceable, const Level level,
                                      const __FlashStringHelper *const file, const int line);
        size_t write(uint8_t c) override;
        size_t write(const uint8_t *buffer, size_t size) override;

    private:
        PrintWrapper(Traceable &traceable, const Level level,
                     const __FlashStringHelper *const file, const int line);
        Traceable *const traceable;
        const Level level;
    };

    // Internal method for printing timestamp, file, and line headers
    void print(const Level level,
               const __FlashStringHelper *const file,
               const int line);

    // Map holding settings per function name
    static ArduinoMap<const __FlashStringHelper *, Traceable::Settings *> settingsMap;

    // Pointer to this instance's settings
    Settings *settings;
};

// ------------------------
// Print Stream Overloads
// ------------------------

/**
 * @brief Overloads the << operator for the Print class to support chaining.
 */
template <typename T>
inline Print &operator<<(Print &stream, T arg)
{
    stream.print(arg);
    return stream;
}

/**
 * @brief Enumeration for simulating endl.
 */
enum _EndLineCode
{
    endl
};

/**
 * @brief Overloads << to simulate std::endl.
 *
 * Calls `println()` followed by `flush()`.
 */
inline Print &operator<<(Print &stream, _EndLineCode)
{
    stream.println();
    stream.flush();
    return stream;
}

// ------------------------
// Logging Macros
// ------------------------

/**
 * @brief Lightweight logging macros for optimized log control.
 *
 * These macros resolve at compile time and eliminate overhead
 * when logging levels are below the threshold.
 */

// Dynamic (instance-based) logging
#define TRACE_ERROR() ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::ERROR)) ? printError(F(__FILE__), __LINE__) : printDummy())
#define TRACE_WARN() ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::WARN)) ? printWarn(F(__FILE__), __LINE__) : printDummy())
#define TRACE_INFO() ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::INFO)) ? printInfo(F(__FILE__), __LINE__) : printDummy())
#define TRACE_DEBUG() ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::DEBUG)) ? printDebug(F(__FILE__), __LINE__) : printDummy())
#define TRACE_TRACE() ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::TRACE)) ? printTrace(F(__FILE__), __LINE__) : printDummy())

// Static (per-function) logging
#define TRACE_ERROR_STATIC(functionName) ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::ERROR)) ? Traceable(functionName).printError(F(__FILE__), __LINE__) : Traceable(functionName).printDummy())
#define TRACE_WARN_STATIC(functionName) ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::WARN)) ? Traceable(functionName).printWarn(F(__FILE__), __LINE__) : Traceable(functionName).printDummy())
#define TRACE_INFO_STATIC(functionName) ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::INFO)) ? Traceable(functionName).printInfo(F(__FILE__), __LINE__) : Traceable(functionName).printDummy())
#define TRACE_DEBUG_STATIC(functionName) ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::DEBUG)) ? Traceable(functionName).printDebug(F(__FILE__), __LINE__) : Traceable(functionName).printDummy())
#define TRACE_TRACE_STATIC(functionName) ((static_cast<uint8_t>(CLASS_TRACE_LEVEL) >= static_cast<uint8_t>(Traceable::Level::TRACE)) ? Traceable(functionName).printTrace(F(__FILE__), __LINE__) : Traceable(functionName).printDummy())

#endif // TRACEABLE_H
