/**
 * @file Traceable.cpp
 * @brief Implementation of the Traceable class for Arduino projects.
 *
 * This file contains the implementation of the Traceable class methods,
 * providing a debug and tracing utility optimized for Arduino.
 * It includes dummy and print wrappers for efficient logging
 * based on configurable debug levels.
 */

#include "Traceable.h"
#include "Utilities.h"
#include <Arduino.h>

// Debug level names stored in PROGMEM to save SRAM
static const char LEVEL_0[] PROGMEM = "OFF";
static const char LEVEL_1[] PROGMEM = "ERROR";
static const char LEVEL_2[] PROGMEM = "WARN";
static const char LEVEL_3[] PROGMEM = "INFO";
static const char LEVEL_4[] PROGMEM = "DEBUG";
static const char LEVEL_5[] PROGMEM = "TRACE";

static const char *const LEVEL_NAMES[] PROGMEM = {
    LEVEL_0, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5};

// -------------------------
// Settings implementation
// -------------------------

Traceable::Settings::Settings(Print *const printer, const Level level)
    : printer(printer), level(level) {}

Print *const Traceable::Settings::getPrinter() const
{
    return printer;
}

void Traceable::Settings::setPrinter(Print *printer)
{
    this->printer = printer;
}

Traceable::Level Traceable::Settings::getLevel() const
{
    return level;
}

void Traceable::Settings::setLevel(const Level level)
{
    this->level = level;
}

// -------------------------
// DummyPrintWrapper implementation
// -------------------------

/**
 * @brief Returns the singleton instance of DummyPrintWrapper.
 *
 * This instance is used to provide a no-operation print wrapper
 * when debug output is disabled.
 */
typename Traceable::DummyPrintWrapper &Traceable::DummyPrintWrapper::instance()
{
    static DummyPrintWrapper instance;
    return instance;
}

/**
 * @brief No-op write for single byte.
 */
size_t Traceable::DummyPrintWrapper::write(uint8_t)
{
    return 0;
}

/**
 * @brief No-op write for buffer.
 */
size_t Traceable::DummyPrintWrapper::write(const uint8_t *, size_t)
{
    return 0;
}

// -------------------------
// PrintWrapper implementation
// -------------------------

/**
 * @brief Returns the singleton instance of PrintWrapper.
 *
 * NOTE: This returns a single static instance, which may not be safe
 * for concurrent usage across multiple Traceable instances.
 */
Traceable::PrintWrapper &Traceable::PrintWrapper::instance(
    Traceable &traceable, const Level level,
    const __FlashStringHelper *const file, const int line)
{
    static PrintWrapper instance(traceable, level, file, line);
    return instance;
}

/**
 * @brief Constructs a PrintWrapper that logs file/line and level info.
 */
Traceable::PrintWrapper::PrintWrapper(Traceable &traceable, const Level level,
                                      const __FlashStringHelper *const file, const int line)
    : traceable(&traceable), level(level)
{
    traceable.print(level, file, line);
}

/**
 * @brief Write a byte to output device if level is enabled.
 */
size_t Traceable::PrintWrapper::write(uint8_t c)
{
    if (traceable->isEnabled(level))
    {
        return traceable->settings->getPrinter()->write(c);
    }
    return 0;
}

/**
 * @brief Write buffer to output device if level is enabled.
 */
size_t Traceable::PrintWrapper::write(const uint8_t *buffer, size_t size)
{
    if (traceable->isEnabled(level))
    {
        return traceable->settings->getPrinter()->write(buffer, size);
    }
    return 0;
}

// -------------------------
// Traceable implementation
// -------------------------

/**
 * @brief Map of function names to their corresponding Traceable settings.
 *
 * ArduinoMap is assumed to be a custom lightweight implementation.
 * The function name pointers are stored in flash (PROGMEM) for efficiency.
 */
ArduinoMap<const __FlashStringHelper *, Traceable::Settings *> Traceable::settingsMap;

/**
 * @brief Constructs a Traceable instance with a function name.
 *
 * If the function hasn't been registered before, a default Settings
 * object is created and added to the map.
 */
Traceable::Traceable(const __FlashStringHelper *const functionName)
{
    settings = *settingsMap.get(functionName);
    if (settings == nullptr)
    {
        settings = new Traceable::Settings(&Serial, Traceable::Level::INFO);
        settingsMap.insert(functionName, settings);
    }
}

/**
 * @brief Set the logging level.
 */
void Traceable::setLevel(const Level level)
{
    settings->setLevel(level);
}

/**
 * @brief Get the current logging level.
 */
typename Traceable::Level Traceable::getLevel() const
{
    return settings->getLevel();
}

/**
 * @brief Check whether a given level is currently enabled.
 */
bool Traceable::isEnabled(const Level level) const
{
    return static_cast<uint8_t>(level) <= static_cast<uint8_t>(settings->getLevel());
}

/**
 * @brief Set the output device (e.g., Serial, SoftwareSerial).
 */
void Traceable::setOutput(Print &output)
{
    settings->setPrinter(&output);
}

/**
 * @brief Get the current output device.
 */
Print *Traceable::getOutput() const
{
    return settings->getPrinter();
}

// -------------------------
// Logging Methods
// -------------------------

Print &Traceable::printError(const __FlashStringHelper *const file, const int line)
{
    return PrintWrapper::instance(*this, Level::ERROR, file, line);
}

Print &Traceable::printWarn(const __FlashStringHelper *const file, const int line)
{
    return PrintWrapper::instance(*this, Level::WARN, file, line);
}

Print &Traceable::printInfo(const __FlashStringHelper *const file, const int line)
{
    return PrintWrapper::instance(*this, Level::INFO, file, line);
}

Print &Traceable::printDebug(const __FlashStringHelper *const file, const int line)
{
    return PrintWrapper::instance(*this, Level::DEBUG, file, line);
}

Print &Traceable::printTrace(const __FlashStringHelper *const file, const int line)
{
    return PrintWrapper::instance(*this, Level::TRACE, file, line);
}

/**
 * @brief Return dummy writer for disabled logs.
 */
Print &Traceable::printDummy()
{
    return DummyPrintWrapper::instance();
}

/**
 * @brief Output formatted log header with timestamp, level, file, and line.
 *
 * This method is called before every log message to write structured headers.
 */
void Traceable::print(const Level level,
                      const __FlashStringHelper *const file,
                      const int line)
{
    if (!isEnabled(level))
        return;

    Print *printer = settings->getPrinter();

    // Timestamp
    printer->print('[');
    printer->print(millis());
    printer->print(']');

    // Debug Level
    printer->print('[');
    printer->print(reinterpret_cast<const __FlashStringHelper *>(
        pgm_read_word(&(LEVEL_NAMES[static_cast<uint8_t>(level)]))));
    printer->print(']');

    // Source Location
    printer->print('(');
    printer->print(file);
    printer->print(':');
    printer->print(line);
    printer->print(')');

    // Separator
    printer->print(F(": "));
}
