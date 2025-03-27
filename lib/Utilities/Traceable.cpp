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
    
// Define the global dummy printer instance
Traceable::DummyPrintWrapper dummyPrinter;

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
    Traceable &traceable, const Level level, const int line)
{
    static PrintWrapper instance(traceable, level, line);
    return instance;
}

/**
 * @brief Constructs a PrintWrapper that logs file/line and level info.
 */
Traceable::PrintWrapper::PrintWrapper(Traceable &traceable, const Level level, const int line)
    : traceable(&traceable), level(level)
{
    traceable.print(level, line);
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
        settings = new Traceable::Settings(functionName, &Serial, Traceable::Level::INFO);
        settingsMap.insert(functionName, settings);
    }
}

// -------------------------
// Logging Methods
// -------------------------

/**
 * @brief Output formatted log header with timestamp, level, file, and line.
 *
 * This method is called before every log message to write structured headers.
 */
void Traceable::print(const Level level, const int line)
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
    printer->print(PGMT(pgm_read_word(&(LEVEL_NAMES[static_cast<uint8_t>(level)]))));
    printer->print(']');

    // Source Location
    printer->print('(');
    printer->print(settings->getFunctionName());
    printer->print(':');
    printer->print(line);
    printer->print(')');

    // Separator
    printer->print(F(": "));
}
