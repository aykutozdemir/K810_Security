#include "Globals.h"
#include "CommandCallbacks.h"
#include "DefaultPackageInterface.h"
#include "CRCPackageInterface.h"

//================ Global Objects Initialization ==================

StatisticController statisticController;
LEDController ledController(GREEN_LED_PIN, RED_LED_PIN);
ezLED rxLED(LED_BUILTIN_RX_PIN);
ezLED txLED(LED_BUILTIN_TX_PIN);
ButtonController buttonController(BUTTON_PIN);
KeyboardController keyboardController(KEYBOARD_POWER_PIN);

// Use a single buffer size constant
constexpr uint8_t SOFTWARE_SERIAL_RX_BUFFER = 32;
constexpr uint8_t SOFTWARE_SERIAL_TX_BUFFER = 32;

SoftSerial<SOFTWARE_SERIAL_RX_BUFFER, SOFTWARE_SERIAL_TX_BUFFER> softwareSerial(HC05_RX, HC05_TX);
HC05 hc05(softwareSerial, HC05_KEY, HC05_STATE, HC05_RESET);
EEPROMController eepromController(Wire);

constexpr size_t COMMAND_PIPES_BUFFER_SIZE = 256;
PipedStreamPair commandPipes(COMMAND_PIPES_BUFFER_SIZE);
DefaultPackageInterface defaultPackageInterface(commandPipes.first);
CRCPackageInterface crcPackageInterface(commandPipes.first);
PipedStream &streamCommander = commandPipes.second;
PipedStream &streamBluetoothData = crcPackageInterface.getPackagedStream();
PipedStream &streamBluetoothCommand = defaultPackageInterface.getPackagedStream();

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
    &loopStatistic};
const uint8_t lengthOfStatistics = sizeof(statistics) / sizeof(statistics[0]);

//================ Serial Commands ==================

const Command serCommands[] = {
    COMMAND(commandHelp, "help", NULL, "list commands"),
    COMMAND(commandPing, "ping", NULL, "ping"),
    COMMAND(commandRam, "ram", NULL, "display ram usage"),
    COMMAND(commandStatistics, "statistics", NULL, "list statistics"),
    COMMAND(commandReset, "reset", NULL, "reset the keypad"),
    COMMAND(commandResetForProgramming, "resetfp", NULL, "reset the keypad for self programming"),
    COMMAND(commandVersion, "version", NULL, "display the version")};

char serialCommandBuffer[16];
SerialCommands serialCommands(
    Serial,
    serCommands,
    sizeof(serCommands) / sizeof(Command),
    serialCommandBuffer,
    sizeof(serialCommandBuffer) / sizeof(char),
    3000);

//================ Bluetooth Commands ==================

const Command btCommands[] = {
    COMMAND(commandHelp, "help", NULL, "list commands"),
    COMMAND(commandPing, "ping", NULL, "ping the keypad"),
    COMMAND(commandGenSalt, "genSalt", NULL, "generate salt"),
    COMMAND(commandGenSeed, "genSeed", NULL, "generate seed"),
    COMMAND(commandCheck, "check", NULL, "check the seed"),
    COMMAND(commandState, "state", NULL, "state of the keypad"),
    COMMAND(commandLock, "lock", ARG(ArgType::String), NULL, "lock the keypad"),
    COMMAND(commandUnlock, "unlock", ARG(ArgType::String), NULL, "unlock the keypad"),
    COMMAND(commandVersion, "version", NULL, "display the version")};

char bluetoothCommandBuffer[48];
SerialCommands bluetoothCommands(
    streamCommander,
    btCommands,
    sizeof(btCommands) / sizeof(Command),
    bluetoothCommandBuffer,
    sizeof(bluetoothCommandBuffer) / sizeof(char),
    1000);
