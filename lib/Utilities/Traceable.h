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
#include "../../include/TraceLevel.h"
#include "../ArduinoMap/ArduinoMap.h"

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
        OFF = TRACE_LEVEL_OFF,
        ERROR = TRACE_LEVEL_ERROR,
        WARN = TRACE_LEVEL_WARN,
        INFO = TRACE_LEVEL_INFO,
        DEBUG = TRACE_LEVEL_DEBUG,
        TRACE = TRACE_LEVEL_TRACE
    };

    /**
     * @brief Constructs a Traceable instance with a function name.
     *
     * Each function name will have a unique settings entry
     * for output device and debug level.
     *
     * @param functionName The name of the function for tracing.
     */
    explicit Traceable(const __FlashStringHelper *const functionName);

    // Debug level setters and getters

    void setLevel(const Level level) { settings->setLevel(level); }
    Level getLevel() const { return settings->getLevel(); }
    bool isEnabled(const Level level) const { return static_cast<uint8_t>(level) <= static_cast<uint8_t>(settings->getLevel()); }

    // Output redirection

    void setOutput(Print &output) { settings->setPrinter(&output); }
    Print *getOutput() { return settings->getPrinter(); }

    // Logging methods for each level

    Print &printError(const int line) { return PrintWrapper::instance(*this, Level::ERROR, line); }
    Print &printWarn(const int line) { return PrintWrapper::instance(*this, Level::WARN, line); }
    Print &printInfo(const int line) { return PrintWrapper::instance(*this, Level::INFO, line); }
    Print &printDebug(const int line) { return PrintWrapper::instance(*this, Level::DEBUG, line); }
    Print &printTrace(const int line) { return PrintWrapper::instance(*this, Level::TRACE, line); }

    /**
     * @class DummyPrintWrapper
     * @brief Dummy writer that outputs nothing.
     *
     * Used to eliminate logging overhead when disabled.
     */
    class DummyPrintWrapper : public Print
    {
    public:
        DummyPrintWrapper() = default;
        size_t write(uint8_t) override __attribute__((always_inline)) { return 0; }
        size_t write(const uint8_t *, size_t) override __attribute__((always_inline)) { return 0; }

    private:
        DummyPrintWrapper(const DummyPrintWrapper &) = delete;
        DummyPrintWrapper &operator=(const DummyPrintWrapper &) = delete;
    };

    /**
     * @class Settings
     * @brief Stores configuration for each Traceable instance.
     *
     * Each function has its own settings (printer and level).
     */
    class Settings
    {
    public:
        Settings(const __FlashStringHelper *const functionName, Print *const printer, const Level level)
            : functionName(functionName), printer(printer), level(level) {}

        const __FlashStringHelper *getFunctionName() const { return functionName; }
        Print *getPrinter() const { return printer; }
        void setPrinter(Print *p) { printer = p; }
        Level getLevel() const { return level; }
        void setLevel(const Level l) { level = l; }

    private:
        const __FlashStringHelper *functionName;
        Print *printer;
        Level level;
    };

    /**
     * @brief Get the settings map.
     * @return The settings map.
     */
    static const ArduinoMap<const __FlashStringHelper *, Settings *> &getSettingsMap() { return settingsMap; }
    
private:
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
        static PrintWrapper &instance(Traceable &traceable, const Level level, const int line);
        size_t write(uint8_t c) override;
        size_t write(const uint8_t *buffer, size_t size) override;

    private:
        PrintWrapper(Traceable &traceable, const Level level, const int line);
        Traceable *const traceable;
        const Level level;
    };

    // Internal method for printing timestamp, file, and line headers
    void print(const Level level, const int line);

    // Map holding settings per function name
    static ArduinoMap<const __FlashStringHelper *, Traceable::Settings *> settingsMap;

    // Pointer to this instance's settings
    Settings *settings;
};

/**
 * @brief Global dummy printer instance for disabled logging.
 */
extern Traceable::DummyPrintWrapper dummyPrinter;

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

#endif // TRACEABLE_H
