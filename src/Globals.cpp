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
KeyboardController keyboardController(KEYBOARD_POWER_PIN, KEYBOARD_DP_PIN, KEYBOARD_DM_PIN);

SoftSerial<SOFTWARE_SERIAL_RX_BUFFER, SOFTWARE_SERIAL_TX_BUFFER> softwareSerial(HC05_RX, HC05_TX);
HC05 hc05(softwareSerial, HC05_KEY, HC05_STATE, HC05_RESET);
EEPROMController eepromController(I2c);

constexpr size_t COMMAND_PIPES_BUFFER_SIZE = 256;

PipedStreamPair commandPipes(COMMAND_PIPES_BUFFER_SIZE);
DefaultPackageInterface defaultPackageInterface(commandPipes);
CRCPackageInterface crcPackageInterface(commandPipes);

PipedStream &streamCommander = defaultPackageInterface.getPlainStream();
PipedStream &streamBluetoothData = crcPackageInterface.getEncodedStream();
PipedStream &streamBluetoothCommand = defaultPackageInterface.getEncodedStream();

//================ Statistic Objects ==================

Statistic systemStatistic;
Statistic peripheralStatistic;
Statistic communicationStatistic;
Statistic applicationStatistic;

const Statistic *statistics[] = {
    &systemStatistic,
    &peripheralStatistic,
    &communicationStatistic,
    &applicationStatistic};
const uint8_t lengthOfStatistics = sizeof(statistics) / sizeof(statistics[0]);

//================ Serial Commands ==================

const Command serCommands[] = {
    COMMAND(commandHelp, "help", NULL, "list commands"),
    COMMAND(commandPing, "ping", NULL, "ping"),
    COMMAND(commandRam, "ram", NULL, "display ram usage"),
    COMMAND(commandStatistics, "stats", NULL, "list statistics"),
    COMMAND(commandReset, "reset", NULL, "reset the keypad"),
    COMMAND(commandResetForProgramming, "resetfp", NULL, "reset the keypad for self programming"),
    COMMAND(commandVersion, "version", NULL, "display the version"),
    COMMAND(commandListTraceables, "listtrace", NULL, "list traceable function names with levels"),
    COMMAND(commandSetTraceLevel, "settrace", ARG(ArgType::String), ARG(ArgType::Int), NULL, "set trace level for a component")};

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
    COMMAND(commandGenSalt, "salt", NULL, "generate salt"),
    COMMAND(commandGenSeed, "seed", NULL, "generate seed"),
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
