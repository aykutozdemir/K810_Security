#include "Globals.h"
#include "CommandCallbacks.h"

//================ Global Objects Initialization ==================

WatchdogController watchdogController;
StatisticController statisticController;
LEDController ledController(GREEN_LED_PIN, RED_LED_PIN);
ezLED rxLED(LED_BUILTIN_RX_PIN);
ezLED txLED(LED_BUILTIN_TX_PIN);
ButtonController buttonController(BUTTON_PIN);
KeyboardController keyboardController(KEYBOARD_POWER_PIN);

FastCircularQueue<uint8_t, 32> rxQueue;
FastCircularQueue<uint8_t, 32> txQueue;

// Use a single buffer size constant
constexpr uint8_t SOFTWARE_SERIAL_RX_BUFFER = 32;
constexpr uint8_t SOFTWARE_SERIAL_TX_BUFFER = 32;

SoftSerial<SOFTWARE_SERIAL_RX_BUFFER, SOFTWARE_SERIAL_TX_BUFFER> softwareSerial(HC05_RX, HC05_TX, rxQueue, txQueue);
HC05 hc05(softwareSerial, HC05_KEY, HC05_STATE, HC05_RESET);
EEPROMController eepromController(Wire);

constexpr size_t COMMAND_PIPES_BUFFER_SIZE = 256;
PipedStreamPair commandPipes(COMMAND_PIPES_BUFFER_SIZE);
PipedStream &streamBluetooth = commandPipes.first;
PipedStream &streamCommander = commandPipes.second;

//================ Statistic Objects ==================

Statistic watchdogControllerStatistic;
Statistic statisticControllerStatistic;
Statistic ledControllerStatistic;
Statistic rxTxLedStatistic;
Statistic buttonControllerStatistic;
Statistic keyboardControllerStatistic;
Statistic serialCommandsStatistic;
Statistic hc05Statistic;
Statistic bluetoothCommandsStatistic;
Statistic eepromControllerStatistic;
Statistic businessLogicStatistic;
Statistic loopStatistic;

const Statistic *statistics[] = {
  &watchdogControllerStatistic,
  &statisticControllerStatistic,
  &ledControllerStatistic,
  &rxTxLedStatistic,
  &buttonControllerStatistic,
  &keyboardControllerStatistic,
  &serialCommandsStatistic,
  &hc05Statistic,
  &bluetoothCommandsStatistic,
  &eepromControllerStatistic,
  &businessLogicStatistic,
  &loopStatistic
};
const uint8_t lengthOfStatistics = sizeof(statistics) / sizeof(statistics[0]);

//================ Serial Commands ==================

const Command serCommands[] = {
  COMMAND(commandHelp, "help", NULL, "list commands"),
  COMMAND(commandPing, "ping", NULL, "ping"),
  COMMAND(commandIrq, "irq", NULL, "list irq registers"),
  COMMAND(commandRam, "ram", NULL, "display ram usage"),
  COMMAND(commandStatistics, "statistics", NULL, "list statistics")
};

char serialCommandBuffer[16];
SerialCommands serialCommands(
  Serial,
  serCommands,
  sizeof(serCommands) / sizeof(Command),
  serialCommandBuffer,
  sizeof(serialCommandBuffer) / sizeof(char),
  3000
);

//================ Bluetooth Commands ==================

const Command btCommands[] = {
  COMMAND(commandHelp, "help", NULL, "list commands"),
  COMMAND(commandPing, "ping", NULL, "ping"),
  COMMAND(commandGenSalt, "genSalt", NULL, "generate salt"),
  COMMAND(commandGenSeed, "genSeed", NULL, "generate seed"),
  COMMAND(commandCheck, "check", NULL, "check"),
  COMMAND(commandState, "state", NULL, "get state of the keypad"),
  COMMAND(commandLock, "lock", ARG(ArgType::String), NULL, "lock the keypad"),
  COMMAND(commandUnlock, "unlock", ARG(ArgType::String), NULL, "unlock the keypad")
};

char bluetoothCommandBuffer[48];
SerialCommands bluetoothCommands(
  streamCommander,
  btCommands,
  sizeof(btCommands) / sizeof(Command),
  bluetoothCommandBuffer,
  sizeof(bluetoothCommandBuffer) / sizeof(char),
  1000
);

