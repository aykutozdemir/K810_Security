/**
 * @file K810Security.cpp
 * @brief Implementation of the K810 Security device main class
 *
 * This file implements the core functionality of the K810 Security device,
 * including Bluetooth communication, button handling, LED control, and business logic.
 */

#include "Globals.h"
#include "K810Security.h"

#include "TraceLevel.h"
#undef CLASS_TRACE_LEVEL
#define CLASS_TRACE_LEVEL DEBUG_K810_SECURITY
#include "TraceHelper.h"

/**
 * @brief Name of the class
 */
const char PROGMEM K810Security::CLASS_NAME[] = "K810Security";

// Bluetooth AT command constants stored in program memory
const char PROGMEM K810Security::CMD_AT[] = "AT";                  ///< AT command
const char PROGMEM K810Security::CMD_RMAAD[] = "AT+RMAAD";         ///< Factory reset command
const char PROGMEM K810Security::CMD_ROLE[] = "AT+ROLE=0";         ///< Set role command (slave)
const char PROGMEM K810Security::CMD_CMODE[] = "AT+CMODE=1";       ///< Set connection mode command (any address)
const char PROGMEM K810Security::CMD_NAME[] = "AT+NAME=K810";      ///< Set device name command
const char PROGMEM K810Security::CMD_PSWD[] = "AT+PSWD=1588";      ///< Set pairing password command
const char PROGMEM K810Security::CMD_UART[] = "AT+UART=38400,1,0"; ///< Set UART parameters command
const char PROGMEM K810Security::CMD_INIT[] = "AT+INIT";           ///< Initialize command
const char PROGMEM K810Security::CMD_RESET[] = "AT+RESET";         ///< Reset command

constexpr uint16_t BLUETOOTH_OPERATION_TIMEOUT = 60000;
constexpr uint16_t FORMAT_OPERATION_TIMEOUT = 30000;

/**
 * @brief Constructor implementation
 * Initializes the device in IDLE state and sets up Bluetooth connection timeout
 */
K810Security::K810Security() : Traceable(PGMT(CLASS_NAME), static_cast<Level>(DEBUG_K810_SECURITY)), state(IDLE) {}

//================ Bluetooth Methods ==================

/**
 * @brief Handles incoming Bluetooth data
 * Routes the data to the appropriate stream based on the current mode
 * @param data The received data byte
 * @param context The context pointer
 */
void K810Security::bluetoothDataCallback(const char data)
{
    PipedStream &activeStream = hc05.isDataMode() ? streamBluetoothData : streamBluetoothCommand;
    activeStream.write(data);
}

/**
 * @brief Handles Bluetooth command responses
 * Logs success or failure of Bluetooth commands
 * @param command The command that was executed
 * @param result Success status of the command
 * @param response Response text from the device
 */
void K810Security::bluetoothCallback(const __FlashStringHelper *command, const bool result, const String &response)
{
    if (result)
    {
        TRACE_INFO_STATIC(PGMT(CLASS_NAME)) << F("Bluetooth OK: ") << command << endl;
    }
    else
    {
        TRACE_ERROR_STATIC(PGMT(CLASS_NAME)) << F("Bluetooth ERROR: ") << command << F(": ") << response << '#' << endl;
    }
}

/**
 * @brief Handles Bluetooth reset command responses
 * Forces data mode on successful reset
 * @param command The command that was executed
 * @param result Success status of the command
 * @param response Response text from the device
 */
void K810Security::bluetoothResetCallback(const __FlashStringHelper *command, const bool result, const String &response)
{
    if (result)
    {
        hc05.forceDataMode();
    }
    bluetoothCallback(command, result, response);
}

/**
 * @brief Sends a Bluetooth command with callback
 * @param cmd_progmem Command text stored in program memory
 * @param callback Function to call when command completes
 * @param delayMs Delay before next command
 */
void K810Security::sendBluetoothCommand(const char *cmd_progmem, HC05::CommandCallback callback, uint16_t delayMs)
{
    HC05::Command cmd;
    cmd.commandText = PGMT(cmd_progmem);
    cmd.callback = callback;
    cmd.delayMs = delayMs;
    hc05.sendCommand(cmd);
}

/**
 * @brief Executes the Bluetooth reset sequence
 * Resets the device to factory settings and configures it with default parameters
 */
void K810Security::bluetoothResetSequence()
{
    hc05.clearCommandQueue();
    
    // Check if the device is in command mode
    sendBluetoothCommand(CMD_AT, bluetoothCallback, DELAY_BASIC_CMD);

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

/**
 * @brief Executes the Bluetooth initialization sequence
 * Configures the device for normal operation with basic settings
 */
void K810Security::bluetoothInitSequence()
{
    hc05.clearCommandQueue();

    // Check if the device is in command mode
    sendBluetoothCommand(CMD_AT, bluetoothCallback, DELAY_BASIC_CMD);

    // Reset the device
    sendBluetoothCommand(CMD_RESET, bluetoothResetCallback, DELAY_FINAL_RESET);
}

//================ Business Logic ==================

/**
 * @brief Handles the main business logic
 * Processes button presses and manages device states including:
 * - Bluetooth connection state
 * - Device formatting state
 * - Button press handling
 * - LED state management
 */
void K810Security::handleBusinessLogic()
{
    const bool checked = keyboardController.isSeedChecked();

    // Handle CONNECTING state
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
        else if (operationTimeout.isReady())
        {
            TRACE_ERROR() << F("Connection timeout") << endl;
            hc05.reset(true);
            state = IDLE;
        }
        return;
    }

    // Handle FORMATTING state
    if (state == FORMATTING)
    {
        if (eepromController.state() == EEPROMController::IDLE)
        {            
            TRACE_INFO() << F("Formatting done") << endl;
            watchdogController.resetMCU();
        }
        else if (operationTimeout.isReady())
        {
            TRACE_ERROR() << F("Formatting timeout") << endl;
            watchdogController.resetMCU();
        }
        return;
    }

    // Handle button press states
    if (buttonController.isPressing())
    {
        ledController.setState(LEDController::PRESSING);
        return;
    }

    // Process different button press types
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
        TRACE_INFO() << F("Bluetooth resetting...") << endl;
        state = CONNECTING;
        ledController.setState(LEDController::RESETTING_BLUETOOTH);
        operationTimeout.setInterval(BLUETOOTH_OPERATION_TIMEOUT);
        operationTimeout.reset();
        bluetoothResetSequence();
        break;

    case ButtonController::VERY_LONG_PRESS:
        TRACE_INFO() << F("Formatting...") << endl;
        keyboardController.unlock();
        state = FORMATTING;
        ledController.setState(LEDController::FORMATTING);
        operationTimeout.setInterval(FORMAT_OPERATION_TIMEOUT);
        operationTimeout.reset();
        eepromController.format();
        break;

    case ButtonController::NO_PRESS:
        ledController.setState(
            (keyboardController.state() == KeyboardController::LOCKED) ? LEDController::LOCKED : LEDController::UNLOCKED);
        break;
    }
}

//================ Timer and ISR ==================

/**
 * @brief Sets up Timer1 for software serial communication
 * Configures the timer in CTC mode for bit sampling
 * @param oversampleBitPeriod Timer period for bit sampling
 */
void K810Security::timer1Setup(const unsigned long oversampleBitPeriod)
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

//================ Setup ==================

/**
 * @brief Initializes the device and all its components
 * Sets up:
 * - Serial communication
 * - Watchdog timer
 * - Software serial
 * - I2C interface
 * - Statistics controller
 * - LED indicators
 * - Bluetooth module
 * - EEPROM controller
 */
void K810Security::setup()
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
    watchdogController.enable(WDTO_500MS);

    softwareSerial.begin(timer1Setup, BaudRate::BAUD_38400);

    I2c.begin();
    I2c.timeOut(80);

    statisticController.setup();

    rxLED.blink(1000, 1000);
    txLED.blink(1000, 1000, 1000);

    watchdogController.loop();

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

    watchdogController.loop();

    // Set statistic names
    systemStatistic.setName(F("System"));
    peripheralStatistic.setName(F("Peripheral"));
    communicationStatistic.setName(F("Communication"));
    applicationStatistic.setName(F("Application"));

    Serial << F("K810 started, seed: ")
        << (checked ? F("checked") : F("unchecked"))
        << F(", version: ")
        << KeyboardController::getVersion()
        << endl;
}

//================ Loop ==================

/**
 * @brief Main application loop
 * Handles all periodic tasks including:
 * - System monitoring (watchdog, statistics)
 * - Peripheral updates (LEDs, buttons, keyboard)
 * - Communication processing (Bluetooth, serial)
 * - Application logic
 */
void K810Security::loop()
{
    MEASURE_TIME(applicationStatistic)
    {
        // System monitoring
        MEASURE_TIME(systemStatistic)
        {
            watchdogController.loop();
            statisticController.loop(Serial);
        }

        // Peripheral updates
        MEASURE_TIME(peripheralStatistic)
        {
            ledController.loop();
            rxLED.loop();
            txLED.loop();
            buttonController.loop();
            keyboardController.loop();
        }

        // Communication processing
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

            if (!hc05.isConnected() && keyboardController.isSeedChecked())
            {
                keyboardController.lock();
            } 
        }

        // Application logic
        MEASURE_TIME(applicationStatistic)
        {
            serialCommands.readSerial();
            bluetoothCommands.readSerial();

            eepromController.loop();

            handleBusinessLogic();
        }
    }
}

// ISR needs to be outside the class
ISR(TIMER1_COMPA_vect)
{
    softwareSerial.processISR();
}