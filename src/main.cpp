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

static void printCallback(const __FlashStringHelper *msgProgmem,
                          const char *msg)
{
  if (msgProgmem == nullptr && msg == nullptr)
  {
    Serial.println();
  }
  else
  {
    if (msgProgmem != nullptr)
    {
      Serial.print(msgProgmem);
    }
    if (msg != nullptr)
    {
      Serial.print(msg);
    }
  }
}

static void printCallback(const __FlashStringHelper *msgProgmem,
                          const __FlashStringHelper *msg)
{
  if (msgProgmem != nullptr)
  {
    Serial.print(msgProgmem);
  }
  if (msg != nullptr)
  {
    Serial.print(msg);
  }
  Serial.println();
}

static void bluetoothDataCallback(const char data)
{
  PipedStream &activeStream = hc05.isDataMode() ? streamBluetoothData : streamBluetoothCommand;
  activeStream.write(data);
}

static void bluetoothCallback(const __FlashStringHelper *command, const bool result, const String &response)
{
  if (result)
  {
    Serial.println(F("BT ok"));
  }
  else
  {
    Serial.print(F("BT err: "));
    Serial.print(response);
    Serial.println('#');
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

static void sendBluetoothCommand(const char *cmd_progmem, HC05::CommandCallback callback, uint16_t delayMs)
{
  HC05::Command cmd;
  cmd.commandText = PGMT(cmd_progmem);
  cmd.callback = callback;
  cmd.delayMs = delayMs;
  hc05.sendCommand(cmd);
}

static void bluetoothResetSequence()
{
  hc05.clearCommandQueue();

  // Factory reset
  sendBluetoothCommand(CMD_RMAAD, bluetoothCallback, DELAY_FACTORY_RESET);

  // Basic setup
  sendBluetoothCommand(CMD_ROLE, bluetoothCallback, DELAY_BASIC_CMD);
  sendBluetoothCommand(CMD_CMODE, bluetoothCallback, DELAY_BASIC_CMD);

  // Device specific setup
  sendBluetoothCommand(CMD_NAME, bluetoothCallback, DELAY_BASIC_CMD);
  sendBluetoothCommand(CMD_PSWD, bluetoothCallback, DELAY_BASIC_CMD);
  sendBluetoothCommand(CMD_UART, bluetoothCallback, DELAY_UART_CMD);

  // Final reset
  sendBluetoothCommand(CMD_RESET, bluetoothResetCallback, DELAY_RESET_CMD);

  if (hc05.isResettingPermanently())
  {
    hc05.reset();
  }
}

static void bluetoothInitSequence()
{
  hc05.clearCommandQueue();

  // Basic setup
  sendBluetoothCommand(CMD_ROLE, bluetoothCallback, DELAY_BASIC_CMD);
  sendBluetoothCommand(CMD_CMODE, bluetoothCallback, DELAY_BASIC_CMD);

  // Initialize and reset
  sendBluetoothCommand(CMD_INIT, bluetoothCallback, DELAY_INIT_CMD);
  sendBluetoothCommand(CMD_RESET, bluetoothCallback, DELAY_FINAL_RESET);
}

//================ Business Logic ==================

static void handleBusinessLogic()
{
  static State state = IDLE;
  static SimpleTimer<uint32_t> bluetoothConnectionTimeout(120000);
  const bool checked = keyboardController.isSeedChecked();

  if (state == CONNECTING)
  {
    const bool currentDataMode = hc05.isDataMode();
    const bool currentConnectionState = hc05.isConnected();

    if (currentDataMode)
    {
      ledController.setState(LEDController::CONNECTING);
    }

    if (currentConnectionState)
    {
      state = IDLE;
    }
    else if (bluetoothConnectionTimeout.isReady())
    {
      hc05.reset(true);
      state = IDLE;
    }
    return;
  }

  if (state == FORMATTING)
  {
    if (eepromController.state() == EEPROMController::IDLE)
    {
      Serial.println(F("Fmt done, rst..."));
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
    Serial.println(F("BT rst..."));
    state = CONNECTING;
    ledController.setState(LEDController::RESETTING_BLUETOOTH);
    bluetoothConnectionTimeout.reset();
    bluetoothResetSequence();
    break;

  case ButtonController::VERY_LONG_PRESS:
    Serial.println(F("Fmt..."));
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

  softwareSerial.setPrintCallback(printCallback);
  softwareSerial.begin(timer1Setup, BAUD_38400);

  crcPackageInterface.setErrorCallback(printCallback);

  I2c.begin();
  I2c.setSpeed(true);

  // watchdogController.enable(WDTO_500MS);
  statisticController.setup();

  rxLED.blink(1000, 1000);
  txLED.blink(1000, 1000, 1000);

  watchdogController.loop();

  const bool checked = KeyboardController::isSeedChecked();
  hc05.setPrintCallback(printCallback);
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

  watchdogController.loop();

  // Set statistic names.
  systemStatistic.setName(F("System"));
  peripheralStatistic.setName(F("Peripheral"));
  communicationStatistic.setName(F("Communication"));
  applicationStatistic.setName(F("Application"));

  Serial.print(F("K810 start: "));
  Serial.println(checked ? F("chk") : F("unchk"));
  Serial.print(F("Ver: "));
  Serial.println(KeyboardController::getVersion());
}

//================ Loop ==================

void loop()
{
  MEASURE_TIME(applicationStatistic)
  {
    MEASURE_TIME(systemStatistic)
    {
      watchdogController.loop();
      statisticController.loop(Serial, statistics, lengthOfStatistics);
    }

    MEASURE_TIME(peripheralStatistic)
    {
      ledController.loop();
      rxLED.loop();
      txLED.loop();
      buttonController.loop();
      keyboardController.loop();
    }

    MEASURE_TIME(communicationStatistic)
    {
      softwareSerial.loop();
      hc05.loop();

      if (hc05.isDataMode())
      {
        crcPackageInterface.loop();
        if (streamBluetoothData.available())
        {
          hc05.sendData(streamBluetoothData.read());
        }
      }
      else
      {
        defaultPackageInterface.loop();
        if (streamBluetoothCommand.available())
        {
          hc05.sendData(streamBluetoothCommand.read());
        }
      }
    }

    MEASURE_TIME(applicationStatistic)
    {
      serialCommands.readSerial();
      bluetoothCommands.readSerial();

      eepromController.loop();

      handleBusinessLogic();
    }
  }
}
