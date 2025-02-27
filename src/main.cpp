#include "Globals.h"

// Common BT commands stored in flash
static const char PROGMEM CMD_RMAAD[] = "AT+RMAAD";
static const char PROGMEM CMD_ROLE[] = "AT+ROLE=0";
static const char PROGMEM CMD_CMODE[] = "AT+CMODE=1";
static const char PROGMEM CMD_NAME[] = "AT+NAME=K810";
static const char PROGMEM CMD_PSWD[] = "AT+PSWD=1588";
static const char PROGMEM CMD_UART[] = "AT+UART=38400,1,0";
static const char PROGMEM CMD_INIT[] = "AT+INIT";
static const char PROGMEM CMD_RESET[] = "AT+RESET";

// Command delays in milliseconds
static constexpr uint16_t DELAY_FACTORY_RESET = 1500;
static constexpr uint16_t DELAY_BASIC_CMD = 300;
static constexpr uint16_t DELAY_UART_CMD = 500;
static constexpr uint16_t DELAY_INIT_CMD = 2000;
static constexpr uint16_t DELAY_RESET_CMD = 3000;
static constexpr uint16_t DELAY_FINAL_RESET = 1500;

//================ Bluetooth Methods ==================

static void bluetoothDataCallback(const char data)
{
  streamBluetooth.write(data);
}

static void bluetoothCallback(const __FlashStringHelper *command, const bool result, const String &response)
{
  if (result)
  {
    Serial.print(F("BT successfully "));
    Serial.print(command);
    Serial.println(F("."));
  }
  else
  {
    Serial.print(F("BT error "));
    Serial.print(command);
    Serial.print(F(": "));
    Serial.print(response);
    Serial.println(F("."));
  }
}

static void bluetoothResetCallback(const __FlashStringHelper *command, const bool result, const String &response)
{
  if (result)
  {
    hc05.forceDataMode();
  }
  bluetoothCallback(command, result, response);
}

static void sendBTCommand(const char *cmd_progmem, HC05::CommandCallback callback, uint16_t delayMs)
{
  HC05::Command cmd;
  cmd.commandText = reinterpret_cast<const __FlashStringHelper *>(cmd_progmem);
  cmd.callback = callback;
  cmd.delayMs = delayMs;
  hc05.sendCommand(cmd);
}

static void bluetoothResetSequence()
{
  hc05.clearCommandQueue();

  // Factory reset
  sendBTCommand(CMD_RMAAD, bluetoothCallback, DELAY_FACTORY_RESET);

  // Basic setup
  sendBTCommand(CMD_ROLE, bluetoothCallback, DELAY_BASIC_CMD);
  sendBTCommand(CMD_CMODE, bluetoothCallback, DELAY_BASIC_CMD);

  // Device specific setup
  sendBTCommand(CMD_NAME, bluetoothCallback, DELAY_BASIC_CMD);
  sendBTCommand(CMD_PSWD, bluetoothCallback, DELAY_BASIC_CMD);
  sendBTCommand(CMD_UART, bluetoothCallback, DELAY_UART_CMD);

  // Final reset
  sendBTCommand(CMD_RESET, bluetoothResetCallback, DELAY_RESET_CMD);

  if (hc05.isResettingPermanently())
  {
    hc05.reset();
  }
}

static void bluetoothInitSequence()
{
  hc05.clearCommandQueue();

  // Basic setup
  sendBTCommand(CMD_ROLE, bluetoothCallback, DELAY_BASIC_CMD);
  sendBTCommand(CMD_CMODE, bluetoothCallback, DELAY_BASIC_CMD);

  // Initialize and reset
  sendBTCommand(CMD_INIT, bluetoothCallback, DELAY_INIT_CMD);
  sendBTCommand(CMD_RESET, bluetoothCallback, DELAY_FINAL_RESET);
}

//================ Business Logic ==================

static void handleBusinessLogic()
{
  static State state = IDLE;
  static SimpleTimer<uint32_t> bluetoothConnectionTimeout(120000);
  const bool checked = keyboardController.isSeedChecked();

  if (state == CONNECTING)
  {
    static bool lastConnectionState = false;
    const bool currentConnectionState = hc05.isConnected();

    if (currentConnectionState)
    {
      lastConnectionState = true;
      state = IDLE;
    }
    else if (bluetoothConnectionTimeout.isReady() && !lastConnectionState)
    {
      hc05.reset(true);
      lastConnectionState = false;
      state = IDLE;
    }
    return;
  }

  if (state == FORMATTING)
  {
    if (eepromController.state() == EEPROMController::IDLE)
    {
      Serial.println(F("Formatting completed, resetting..."));
      Serial.flush();
      watchdogController.resetMCU();
    }
    return;
  }

  // Handle IDLE state
  if (buttonController.isPressing())
  {
    ledController.setState(LEDController::PRESSING);
    return;
  }

  // Handle different button press states
  switch (buttonController.state())
  {
  case ButtonController::SHORT_PRESS:
    if (checked)
    {
      keyboardController.lock();
      ledController.setState(LEDController::LOCKED);
      return;
    }
    // Toggle lock state
    if (keyboardController.state() == KeyboardController::LOCKED)
    {
      keyboardController.unlock();
      ledController.setState(LEDController::UNLOCKED);
    }
    else
    {
      keyboardController.lock();
      ledController.setState(LEDController::LOCKED);
    }
    break;

  case ButtonController::LONG_PRESS:
    Serial.println(F("BT module resetting..."));
    state = CONNECTING;
    ledController.setState(LEDController::CONNECTING);
    bluetoothConnectionTimeout.reset();
    bluetoothResetSequence();
    break;

  case ButtonController::VERY_LONG_PRESS:
    Serial.println(F("Keypad formatting..."));
    keyboardController.unlock();
    state = FORMATTING;
    ledController.setState(LEDController::FORMATTING);
    eepromController.format();
    break;

  case ButtonController::NO_PRESS:
    ledController.setState(
        (keyboardController.state() == KeyboardController::LOCKED) ? LEDController::LOCKED : LEDController::UNLOCKED);
    break;
  }
}

//================ Timer and ISR ==================

void timer1Setup(const unsigned long oversampleBitPeriod)
{
  SafeInterrupts::ScopedDisable guard;

  TCCR1A = 0;
  TCCR1B = 0;
  TCCR1C = 0;
  TIMSK1 = 0;

  // Set Timer1 to CTC mode (WGM12 = 1, others = 0)
  TCCR1B |= (1 << WGM12);

  // Select best prescaler (Prescaler = 1)
  TCCR1B |= (1 << CS10);

  // Set OCR1A to the oversampleBitPeriod
  OCR1A = oversampleBitPeriod;
  TCNT1 = 0;

  // Enable Compare Match Interrupt for OCR1A
  TIMSK1 |= (1 << OCIE1A);
}

ISR(TIMER1_COMPA_vect)
{
  softwareSerial.processISR();
}

//================ Setup ==================

void setup()
{
  SimpleTimer<uint16_t> serialWaitTimeout(2000);
  serialWaitTimeout.setInterval(2000);

  Serial.begin(9600);
  while (!Serial && !serialWaitTimeout.isReady())
    ;

  watchdogController.printResetReason(Serial);
  if (buttonController.isPressingRaw())
  {
    watchdogController.resetMCUForSelfProgramming();
  }

  softwareSerial.setErrorCallback([](const __FlashStringHelper *errorMessage)
                                  { Serial.println(errorMessage); });
  softwareSerial.begin(38400, timer1Setup);

  Wire.begin();
  Wire.setClock(400000);

  watchdogController.enable(WDTO_500MS);
  statisticController.setup();

  rxLED.blink(1000, 1000);
  txLED.blink(1000, 1000, 1000);

  const bool checked = KeyboardController::isSeedChecked();
  hc05.begin();
  hc05.onDataReceived(bluetoothDataCallback);
  if (!checked)
  {
    hc05.reset(true);
    keyboardController.unlock();
    ledController.setState(LEDController::UNLOCKED);
  }
  else
  {
    bluetoothInitSequence();
  }

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

  Serial.print(F("K810 Security started: "));
  Serial.println(checked ? F("checked") : F("unchecked"));
  Serial.print(F("Version: "));
  Serial.println(KeyboardController::getVersion());
}

//================ Main Loop ==================

void loop()
{
  MEASURE_TIME(loopStatistic)
  {
    MEASURE_TIME(watchdogControllerStatistic)
    {
      watchdogController.loop();
    }
    MEASURE_TIME(statisticControllerStatistic)
    {
      statisticController.loop(Serial, statistics, lengthOfStatistics);
    }
    MEASURE_TIME(ledControllerStatistic)
    {
      ledController.loop();
    }
    MEASURE_TIME(rxTxLedStatistic)
    {
      rxLED.loop();
      txLED.loop();
    }
    MEASURE_TIME(buttonControllerStatistic)
    {
      buttonController.loop();
    }
    MEASURE_TIME(keyboardControllerStatistic)
    {
      keyboardController.loop();
    }
    MEASURE_TIME(serialCommandsStatistic)
    {
      serialCommands.readSerial();
    }
    MEASURE_TIME(hc05Statistic)
    {
      softwareSerial.loop();
      hc05.loop();
      if (hc05.isDataMode() && streamBluetooth.available())
      {
        hc05.sendData(streamBluetooth.read());
      }
    }
    MEASURE_TIME(bluetoothCommandsStatistic)
    {
      bluetoothCommands.readSerial();
    }
    MEASURE_TIME(eepromControllerStatistic)
    {
      eepromController.loop();
    }
    MEASURE_TIME(businessLogicStatistic)
    {
      handleBusinessLogic();
    }
  }
}
