#include "Globals.h"

//================ Bluetooth Methods ==================

static void bluetoothDataCallback(const char data) {
  streamBluetooth.write(data);
}

static void bluetoothCallback(const String &command, const bool result, const String &response) {
  if (result) {
    Serial.print(F("BT successfully "));
    Serial.print(command);
    Serial.println(F("."));
  } else {
    Serial.print(F("BT error "));
    Serial.print(command);
    Serial.print(F(": "));
    Serial.print(response);
    Serial.println(F("."));
  }
}

static void bluetoothSendCommands(const __FlashStringHelper * commands[], const size_t numCommands)
{
  for (size_t i = 0; i < numCommands; ++i) {
    hc05.sendCommand(commands[i], bluetoothCallback);
  }
}

static void bluetoothResetSequence() {
  const __FlashStringHelper *commands[] PROGMEM = {
    F("AT+RMAAD"),
    F("AT+NAME=K810"),
    F("AT+PSWD=1588"),
    F("AT+UART=38400,0,0"),
    F("AT+RESET")
  };

  bluetoothSendCommands(commands, sizeof(commands) / sizeof(commands[0]));
  hc05.reset(false);
}

static void bluetoothInitSequence(const bool checked) {
  const __FlashStringHelper *commands[] PROGMEM = {
    F("AT+ROLE=0"),
    F("AT+CMODE=1"),
    F("AT+RESET")
  };

  const size_t numCommands = sizeof(commands) / sizeof(commands[0]);

  if (!checked) {
    bluetoothSendCommands(&commands[1], numCommands - 1);
  } else {
    bluetoothSendCommands(commands, numCommands);
  }
}

//================ Business Logic ==================

static void handleBusinessLogic() {
  static State state = IDLE;
  static SimpleTimer bluetoothConnectionTimeout(40000);
  const bool checked = keyboardController.isSeedChecked();

  // Handle non-IDLE states first
  if (state == CONNECTING) {
    if (hc05.isConnected() || bluetoothConnectionTimeout.isReady()) {
      if (bluetoothConnectionTimeout.isReady()) {
        hc05.reset(true);
      }
      state = IDLE;
    }
    return;
  }

  if (state == FORMATTING) {
    if (eepromController.state() == EEPROMController::IDLE) {
      Serial.println(F("Formatting completed, resetting..."));
      Serial.flush();
      watchdogController.resetMCU();
    }
    return;
  }

  // Handle IDLE state
  if (buttonController.isPressing()) {
    ledController.setState(LEDController::PRESSING);
    return;
  }

  // Handle different button press states
  switch (buttonController.state()) {
    case ButtonController::SHORT_PRESS:
      if (checked) {
        keyboardController.lock();
        ledController.setState(LEDController::LOCKED);
        return;
      }
      // Toggle lock state
      if (keyboardController.state() == KeyboardController::LOCKED) {
        keyboardController.unlock();
        ledController.setState(LEDController::UNLOCKED);
      } else {
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

//================ Setup ==================

void setup() {
  SimpleTimer serialWaitTimeout;
  serialWaitTimeout.setInterval(2000);

  Serial.begin(9600);
  while (!Serial && !serialWaitTimeout.isReady());

  if (buttonController.isPressingRaw()) {
    watchdogController.resetMCUForSelfProgramming();
  }

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
  bluetoothInitSequence(checked);  
  if (!checked) {
    hc05.reset(true);
    keyboardController.unlock();
    ledController.setState(LEDController::UNLOCKED);
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

  Serial.println(F("K810 Security started"));
}

//================ Main Loop ==================

void loop() {
  MEASURE_TIME(loopStatistic) {
    MEASURE_TIME(watchdogControllerStatistic) {
      watchdogController.loop();
    }
    MEASURE_TIME(statisticControllerStatistic) {
      statisticController.loop(Serial, statistics, lengthOfStatistics);
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
