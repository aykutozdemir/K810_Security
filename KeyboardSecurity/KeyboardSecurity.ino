#include "StatisticController.h"
#include "WatchdogController.h"
#include "LEDController.h"
#include "ButtonController.h"
#include "KeyboardController.h"
#include "HC05.h"
#include "SoftSerial.h"
#include "EEPROMController.h"
#include <FastCircularQueue.h>
#include <StaticSerialCommands.h>
#include <PipedStream.h>
#include <Wire.h>

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

#define SOFT_SERIAL_BUFFER_SIZE 32

enum State : uint8_t {
  IDLE,
  CONNECTING,
  FORMATTING
};

// Global Objects
WatchdogController watchdogController;
StatisticController statisticController;
LEDController ledController(GREEN_LED_PIN, RED_LED_PIN);
ezLED rxLED(LED_BUILTIN_RX_PIN);
ezLED txLED(LED_BUILTIN_TX_PIN);
ButtonController buttonController(BUTTON_PIN);
KeyboardController keyboardController(KEYBOARD_POWER_PIN);
FastCircularQueue<uint8_t, SOFT_SERIAL_BUFFER_SIZE> rxQueue;
FastCircularQueue<uint8_t, SOFT_SERIAL_BUFFER_SIZE> txQueue;
SoftSerial<SOFT_SERIAL_BUFFER_SIZE, SOFT_SERIAL_BUFFER_SIZE> softwareSerial(HC05_RX, HC05_TX, rxQueue, txQueue);
HC05 hc05(softwareSerial, HC05_KEY, HC05_STATE, HC05_RESET);
EEPROMController eepromController(Wire);

PipedStreamPair commandPipes(192);
PipedStream& streamBluetooth = commandPipes.first;
PipedStream& streamCommander = commandPipes.second;

// Statistic objects
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

const Statistic* statistics[] = {
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

bool previousLocked = true;
bool locked = true;
State state = IDLE;
SimpleTimer bluetoothConnectionTimeout;

//================ Helper Functions for Commands ==================

// Print the standard OK response.
static inline void printOK(SerialCommands& sender) {
  sender.getSerial().println(F("\r\nOK\r\n"));
}

// Print an error message stored in flash.
static inline void printError(SerialCommands& sender, const __FlashStringHelper* msg) {
  sender.getSerial().println(msg);
}

// Print a single byte in HEX with a leading zero if needed.
static inline void printHexByte(SerialCommands& sender, byte value) {
  if (value < 0x10) sender.getSerial().print('0');
  sender.getSerial().print(value, HEX);
}

// Helper to check that the seed has not been set already.
static inline bool requireSeedNotChecked(SerialCommands& sender) {
  if (keyboardController.isSeedChecked()) {
    printError(sender, F("ERROR: Already checked\r\n"));
    return false;
  }
  return true;
}

//================ Helper Functions for Seed Parsing ==================

// Converts a hex character to its numeric value.
static inline byte hexCharToByte(const char c) {
  if (c >= '0' && c <= '9') return c - '0';
  if (c >= 'A' && c <= 'F') return c - 'A' + 10;
  if (c >= 'a' && c <= 'f') return c - 'a' + 10;
  return 0;
}

// Parse a hexadecimal string into a seed array.
static void parseSeedString(const char* str, byte* seed, size_t length) {
  for (size_t i = 0; i < length; ++i) {
    seed[i] = (hexCharToByte(str[i * 2]) << 4) | hexCharToByte(str[i * 2 + 1]);
  }
}

//================ Business Logic Helpers ==================

// Reset the Bluetooth module by sending a group of commands.
static void resetBluetoothModule() {
  Serial.println(F("BT module resetting..."));
  state = CONNECTING;
  ledController.setState(LEDController::CONNECTING);
  hc05.sendCommand(F("AT+RMAAD"), bluetoothCallback);
  hc05.sendCommand(F("AT+NAME=K810"), bluetoothCallback);
  hc05.sendCommand(F("AT+PSWD=1588"), bluetoothCallback);
  hc05.sendCommand(F("AT+UART=38400,0,0"), bluetoothCallback);
  hc05.sendCommand(F("AT+RESET"), bluetoothCallback);
  hc05.reset(false);
  bluetoothConnectionTimeout.reset();
}

// Update LED and keyboard states based on the global "locked" flag.
static void updateLockState() {
  if (locked) {
    if (state == IDLE && !buttonController.isPressing()) {
      ledController.setState(LEDController::LOCKED);
    }
    keyboardController.lock();
  } else {
    if (state == IDLE && !buttonController.isPressing()) {
      ledController.setState(LEDController::UNLOCKED);
    }
    keyboardController.unlock();
  }
}

// Encapsulates the business logic that runs each loop iteration.
static void handleBusinessLogic() {
  const bool checked = keyboardController.isSeedChecked();

  switch (state) {
    case IDLE:
      if (buttonController.isPressing()) {
        ledController.setState(LEDController::PRESSING);
      } else {
        switch (buttonController.state()) {
          case ButtonController::SHORT_PRESS:
            if (!checked) {
              locked = !locked;
            }
            break;
          case ButtonController::LONG_PRESS:
            resetBluetoothModule();
            break;
          case ButtonController::VERY_LONG_PRESS:
            Serial.println(F("Keypad formatting..."));
            previousLocked = locked;
            locked = false;
            state = FORMATTING;
            ledController.setState(LEDController::FORMATTING);
            eepromController.format();
            break;
          case ButtonController::NO_PRESS:
            if (checked && !hc05.isConnected()) {
              locked = true;
            }
            break;
          default:
            break;
        }
      }
      break;

    case CONNECTING:
      if (hc05.isConnected()) {
        state = IDLE;
      } else if (bluetoothConnectionTimeout.isReady()) {
        hc05.reset(true);
        state = IDLE;
      }
      break;

    case FORMATTING:
      if (eepromController.state() == EEPROMController::IDLE) {
        state = IDLE;
        locked = previousLocked;
        Serial.println(F("Formatting completed."));
      }
      break;
  }

  updateLockState();
}

//================ Command Callbacks ==================

void commandHelp(SerialCommands& sender, Args& args) {
  sender.listCommands();
  printOK(sender);
}

void commandPing(SerialCommands& sender, Args& args) {
  sender.getSerial().println(F("pong"));
  printOK(sender);
}

void commandIrq(SerialCommands& sender, Args& args) {
  statisticController.printInterruptTable(sender.getSerial());
  printOK(sender);
}

void commandRam(SerialCommands& sender, Args& args) {
  statisticController.printRam(sender.getSerial());
  printOK(sender);
}

void commandStatistics(SerialCommands& sender, Args& args) {
  statisticController.printStatisticTable(sender.getSerial(),
                                          statistics,
                                          sizeof(statistics) / sizeof(statistics[0]));
  printOK(sender);
}

void commandGenSalt(SerialCommands& sender, Args& args) {
  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = keyboardController.generateSalt();
  printHexByte(sender, salt);
  printOK(sender);
}

void commandGenSeed(SerialCommands& sender, Args& args) {
  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = keyboardController.generateSalt();
  byte seed[SEED_LENGTH];
  keyboardController.generateSeed(seed, SEED_LENGTH);
  keyboardController.cypherEncryption(seed, SEED_LENGTH, salt);
  for (int i = 0; i < SEED_LENGTH; ++i) {
    printHexByte(sender, seed[i]);
    sender.getSerial().print(' ');
  }
  printOK(sender);
}

void commandCheck(SerialCommands& sender, Args& args) {
  if (keyboardController.isSeedChecked()) {
    printError(sender, F("ERROR: Already checked\r\n"));
    return;
  }
  keyboardController.seedChecked();
  printOK(sender);
}

// Check the provided seed argument against the generated seed.
bool seedCheck(SerialCommands& sender, Args& args) {
  if (!keyboardController.isSeedChecked()) {
    printError(sender, F("ERROR: Seed not checked\r\n"));
    return false;
  }
  byte seed[SEED_LENGTH];
  parseSeedString(args[0].getString(), seed, SEED_LENGTH);

  byte genSeed[SEED_LENGTH];
  keyboardController.generateSeed(genSeed, SEED_LENGTH);
  keyboardController.cypherDecryption(seed, SEED_LENGTH, genSeed, SEED_LENGTH);
  for (int i = 0; i < SEED_LENGTH; ++i) {
    if (seed[i] != genSeed[i]) {
      printError(sender, F("ERROR: Seed not matched\r\n"));
      return false;
    }
  }
  return true;
}

void commandLock(SerialCommands& sender, Args& args) {
  if (!seedCheck(sender, args)) return;
  locked = true;
  printOK(sender);
}

void commandUnlock(SerialCommands& sender, Args& args) {
  if (!seedCheck(sender, args)) return;
  locked = false;
  printOK(sender);
}

//================ Command Arrays ==================

Command serCommands[]{
  COMMAND(commandHelp, "help", NULL, "list commands"),
  COMMAND(commandPing, "ping", NULL, "ping"),
  COMMAND(commandIrq, "irq", NULL, "list irq registers"),
  COMMAND(commandRam, "ram", NULL, "display ram usage"),
  COMMAND(commandStatistics, "statistics", NULL, "list statistics")
};

char serialCommandBuffer[SOFT_SERIAL_BUFFER_SIZE];
SerialCommands serialCommands(Serial, serCommands, sizeof(serCommands) / sizeof(Command),
                              serialCommandBuffer, SOFT_SERIAL_BUFFER_SIZE);

Command btCommands[]{
  COMMAND(commandHelp, "help", NULL, "list commands"),
  COMMAND(commandPing, "ping", NULL, "ping"),
  COMMAND(commandGenSalt, "genSalt", NULL, "generate salt"),
  COMMAND(commandGenSeed, "genSeed", NULL, "generate seed"),
  COMMAND(commandCheck, "check", NULL, "check"),
  COMMAND(commandLock, "lock", NULL, "lock the keypad"),
  COMMAND(commandUnlock, "unlock", ARG(ArgType::String), NULL, "unlock the keypad")
};

char bluetoothCommandBuffer[SOFT_SERIAL_BUFFER_SIZE];
SerialCommands bluetoothCommands(streamCommander, btCommands, sizeof(btCommands) / sizeof(Command),
                                 bluetoothCommandBuffer, SOFT_SERIAL_BUFFER_SIZE);

//================ Timer and ISR ==================

void timer1Setup(const unsigned long period) {
  // Set Timer1 to CTC mode (WGM12 = 1, others = 0)
  TCCR1A = 0;
  TCCR1B = 0;
  TCCR1B |= (1 << WGM12);
  TCCR1B &= ~((1 << WGM13) | (1 << WGM11) | (1 << WGM10));

  // Select best prescaler (Prescaler = 1)
  TCCR1B &= ~((1 << CS12) | (1 << CS11) | (1 << CS10));
  TCCR1B |= (1 << CS10);
  OCR1A = period;

  // Enable Compare Match Interrupt for OCR1A
  TIMSK1 |= (1 << OCIE1A);
}

ISR(TIMER1_COMPA_vect) {
  softwareSerial.processISR();
}

//================ Bluetooth Callbacks ==================

void bluetoothCallback(const String& command, const bool result, const String& response) {
  if (result) {
    Serial.print(F("BT module successfully "));
    Serial.print(command);
    Serial.println(F("."));
  } else {
    Serial.print(F("BT module error "));
    Serial.print(command);
    Serial.print(F(": "));
    Serial.print(response);
    Serial.println(F("."));
  }
}

void bluetoothDataCallback(const char data) {
  streamBluetooth.write(data);
}

//================ Setup ==================

void setup() {
  SimpleTimer serialWaitTimeout;
  serialWaitTimeout.setInterval(2000);

  Serial.begin(9600);
  while (!Serial && !serialWaitTimeout.isReady())
    ;

  softwareSerial.begin(38400, timer1Setup);

  Wire.begin();
  Wire.setClock(400000);

  watchdogController.enable(WDTO_500MS);
  statisticController.setup();

  rxLED.blink(1000, 1000);
  txLED.blink(1000, 1000, 1000);

  const bool checked = keyboardController.isSeedChecked();
  hc05.begin();
  hc05.onDataReceived(bluetoothDataCallback);
  if (checked) {
    hc05.sendCommand(F("AT+ROLE=0"), bluetoothCallback);
  }
  hc05.sendCommand(F("AT+CMODE=1"), bluetoothCallback);
  hc05.sendCommand(F("AT+RESET"), bluetoothCallback);
  if (!checked) {
    hc05.reset(true);
    locked = false;
  }
  bluetoothConnectionTimeout.setInterval(40000);

  // Set statistic names.
  watchdogControllerStatistic.setName(F("Watchdog"));
  statisticControllerStatistic.setName(F("Statistic"));
  ledControllerStatistic.setName(F("Led"));
  rxTxLedStatistic.setName(F("Rx Tx Led"));
  buttonControllerStatistic.setName(F("Button"));
  keyboardControllerStatistic.setName(F("Keyboard"));
  serialCommandsStatistic.setName(F("Serial Cmds"));
  hc05Statistic.setName(F("HC-05"));
  eepromControllerStatistic.setName(F("EEPROM"));
  bluetoothCommandsStatistic.setName(F("BT Cmds"));
  businessLogicStatistic.setName(F("Business Logic"));
  loopStatistic.setName(F("Loop"));

  Serial.println(F("K810 Security started."));
}

//================ Main Loop ==================

void loop() {
  MEASURE_TIME(loopStatistic) {
    MEASURE_TIME(watchdogControllerStatistic) {
      watchdogController.loop();
    }
    MEASURE_TIME(statisticControllerStatistic) {
      statisticController.loop(Serial, statistics, sizeof(statistics) / sizeof(statistics[0]));
    }
    MEASURE_TIME(ledControllerStatistic) {
      ledController.loop();
    }
    MEASURE_TIME(rxTxLedStatistic) {
      rxLED.loop();
      txLED.loop();
    }
    MEASURE_TIME(buttonControllerStatistic) {
      buttonController.loop();
    }
    MEASURE_TIME(keyboardControllerStatistic) {
      keyboardController.loop();
    }
    MEASURE_TIME(serialCommandsStatistic) {
      serialCommands.readSerial();
    }
    MEASURE_TIME(hc05Statistic) {
      hc05.loop();
      if (hc05.isDataMode() && streamBluetooth.available()) {
        hc05.sendData(streamBluetooth.read());
      }
    }
    MEASURE_TIME(bluetoothCommandsStatistic) {
      bluetoothCommands.readSerial();
    }
    MEASURE_TIME(eepromControllerStatistic) {
      eepromController.loop();
    }
    MEASURE_TIME(businessLogicStatistic) {
      handleBusinessLogic();
    }
  }
}
