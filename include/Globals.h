/**
 * @file Globals.h
 * @brief Global definitions and external references for the system.
 *
 * This file contains global constants, pin definitions, and external references
 * to objects used throughout the system. It serves as a central point for system
 * configuration and object sharing between modules.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef GLOBALS_H
#define GLOBALS_H

#include "StatisticController.h"
#include "WatchdogController.h"
#include "LEDController.h"
#include "ButtonController.h"
#include "KeyboardController.h"
#include "HC05.h"
#include "SoftSerial.h"
#include "EEPROMController.h"
#include "CRCPackageInterface.h"
#include "DefaultPackageInterface.h"
#include "Utilities.h"
#include "I2C.h"
#include <StaticSerialCommands.h>
#include <PipedStream.h>
#include <util/atomic.h>

/// Built-in RX LED pin
#define LED_BUILTIN_RX_PIN LED_BUILTIN_RX
/// Built-in TX LED pin
#define LED_BUILTIN_TX_PIN LED_BUILTIN_TX
/// Green status LED pin
#define GREEN_LED_PIN 8
/// Red status LED pin
#define RED_LED_PIN 9
/// User input button pin
#define BUTTON_PIN 10
/// Pin controlling power to the keyboard
#define KEYBOARD_POWER_PIN 19
/// HC05 Bluetooth module RX pin
#define HC05_RX 6
/// HC05 Bluetooth module TX pin
#define HC05_TX 7
/// HC05 Bluetooth module reset pin
#define HC05_RESET 16
/// HC05 Bluetooth module state pin
#define HC05_STATE 1
/// HC05 Bluetooth module key pin
#define HC05_KEY 0

/// EEPROM address for storing the encryption salt
#define EEPROM_SALT_ADDRESS 0
/// EEPROM address for storing seed verification flag
#define EEPROM_SEED_CHECKED_ADDRESS 1
/// EEPROM address for storing the encryption seed
#define EEPROM_SEED_ADDRESS 2
/// EEPROM address for storing the last reset reason
#define EEPROM_RESET_REASON_ADDRESS 18

/// Size of software serial RX buffer
constexpr uint8_t SOFTWARE_SERIAL_RX_BUFFER = 32;
/// Size of software serial TX buffer
constexpr uint8_t SOFTWARE_SERIAL_TX_BUFFER = 32;

/**
 * @brief Enumeration of possible system states.
 */
enum State : uint_fast8_t
{
  IDLE,       ///< System is idle
  CONNECTING, ///< System is establishing connection
  FORMATTING  ///< System is formatting EEPROM
};

/// Global statistics controller
extern StatisticController statisticController;
/// Global LED status controller
extern LEDController ledController;
/// RX activity indicator LED
extern ezLED rxLED;
/// TX activity indicator LED
extern ezLED txLED;
/// User input button controller
extern ButtonController buttonController;
/// Keyboard security controller
extern KeyboardController keyboardController;
/// Software serial interface for auxiliary communication
extern SoftSerial<SOFTWARE_SERIAL_RX_BUFFER, SOFTWARE_SERIAL_TX_BUFFER> softwareSerial;
/// HC05 Bluetooth module controller
extern HC05 hc05;
/// EEPROM operations controller
extern EEPROMController eepromController;

/// Piped stream pair for command routing
extern PipedStreamPair commandPipes;
/// Stream for Bluetooth data communication
extern PipedStream &streamBluetoothData;
/// Stream for Bluetooth command communication
extern PipedStream &streamBluetoothCommand;
/// Stream for command interpretation
extern PipedStream &streamCommander;

/// CRC-based package interface for secure communication
extern CRCPackageInterface crcPackageInterface;
/// Default package interface for standard communication
extern DefaultPackageInterface defaultPackageInterface;

/// Performance statistics for system operations
extern Statistic systemStatistic;
/// Performance statistics for peripheral operations
extern Statistic peripheralStatistic;
/// Performance statistics for communication operations
extern Statistic communicationStatistic;
/// Performance statistics for application-specific operations
extern Statistic applicationStatistic;

/// Array of all statistics objects for reporting
extern const Statistic *statistics[];
/// Number of statistics objects in the array
extern const uint8_t lengthOfStatistics;

/// Serial command parser for USB/serial communication
extern SerialCommands serialCommands;
/// Serial command parser for Bluetooth communication
extern SerialCommands bluetoothCommands;

#endif // GLOBALS_H
