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
#include <StaticSerialCommands.h>
#include <PipedStream.h>
#include <Wire.h>
#include <util/atomic.h>

#define LED_BUILTIN_RX_PIN LED_BUILTIN_RX
#define LED_BUILTIN_TX_PIN LED_BUILTIN_TX
#define GREEN_LED_PIN 8
#define RED_LED_PIN 9
#define BUTTON_PIN 10
#define KEYBOARD_POWER_PIN 19
#define HC05_RX 6
#define HC05_TX 7
#define HC05_RESET 16
#define HC05_STATE 1
#define HC05_KEY 0

#define EEPROM_SALT_ADDRESS 0
#define EEPROM_SEED_CHECKED_ADDRESS 1
#define EEPROM_SEED_ADDRESS 2
#define EEPROM_RESET_REASON_ADDRESS 18

enum State : uint_fast8_t {
  IDLE,
  CONNECTING,
  FORMATTING
};

extern StatisticController statisticController;
extern LEDController ledController;
extern ezLED rxLED;
extern ezLED txLED;
extern ButtonController buttonController;
extern KeyboardController keyboardController;
extern FastCircularQueue<uint8_t, 32> rxQueue;
extern FastCircularQueue<uint8_t, 32> txQueue;
extern SoftSerial<32, 32> softwareSerial;
extern HC05 hc05;
extern EEPROMController eepromController;

extern PipedStreamPair commandPipes;
extern PipedStream &streamBluetooth;
extern PipedStream &streamCommander;

extern Statistic watchdogControllerStatistic;
extern Statistic statisticControllerStatistic;
extern Statistic ledControllerStatistic;
extern Statistic rxTxLedStatistic;
extern Statistic buttonControllerStatistic;
extern Statistic keyboardControllerStatistic;
extern Statistic serialCommandsStatistic;
extern Statistic hc05Statistic;
extern Statistic bluetoothCommandsStatistic;
extern Statistic eepromControllerStatistic;
extern Statistic businessLogicStatistic;
extern Statistic loopStatistic;

extern const Statistic *statistics[];
extern const uint8_t lengthOfStatistics;

extern SerialCommands serialCommands;
extern SerialCommands bluetoothCommands;

#endif  // GLOBALS_H
