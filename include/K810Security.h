/**
 * @file K810Security.h
 * @brief Main application class for the K810 Security device
 *
 * This class encapsulates the core functionality of the K810 Security device,
 * including Bluetooth communication, button handling, LED control, and business logic.
 */

#ifndef K810_SECURITY_H
#define K810_SECURITY_H

#include "Globals.h"
#include "Traceable.h"

class K810Security : public Traceable
{
public:
    /**
     * @brief Constructor for K810Security
     * Initializes the device in IDLE state and sets up Bluetooth connection timeout
     */
    K810Security();

    /**
     * @brief Initializes the device and all its components
     * Sets up serial communication, Bluetooth, I2C, and other peripherals
     */
    void setup();

    /**
     * @brief Main application loop
     * Handles all periodic tasks including system monitoring, peripheral updates,
     * communication processing, and business logic
     */
    void loop();

private:
    /**
     * @brief Name of the class
     */
    static const char PROGMEM CLASS_NAME[];

    // Bluetooth AT command constants stored in program memory
    static const char PROGMEM CMD_AT[];    ///< AT command
    static const char PROGMEM CMD_RMAAD[]; ///< Factory reset command
    static const char PROGMEM CMD_ROLE[];  ///< Set role command (slave)
    static const char PROGMEM CMD_CMODE[]; ///< Set connection mode command (any address)
    static const char PROGMEM CMD_NAME[];  ///< Set device name command
    static const char PROGMEM CMD_PSWD[];  ///< Set pairing password command
    static const char PROGMEM CMD_UART[];  ///< Set UART parameters command
    static const char PROGMEM CMD_INIT[];  ///< Initialize command
    static const char PROGMEM CMD_RESET[]; ///< Reset command

    // Command execution delays in milliseconds
    static constexpr uint16_t DELAY_FACTORY_RESET = 1500; ///< Delay after factory reset
    static constexpr uint16_t DELAY_BASIC_CMD = 300;      ///< Delay for basic commands
    static constexpr uint16_t DELAY_UART_CMD = 500;       ///< Delay for UART configuration
    static constexpr uint16_t DELAY_INIT_CMD = 2000;      ///< Delay after initialization
    static constexpr uint16_t DELAY_RESET_CMD = 3000;     ///< Delay after reset
    static constexpr uint16_t DELAY_FINAL_RESET = 1500;   ///< Delay after final reset

    /**
     * @brief Application state enumeration
     */
    enum State
    {
        IDLE,       ///< Normal operation state
        CONNECTING, ///< Bluetooth connection in progress
        FORMATTING  ///< Device formatting in progress
    };

    // Member variables
    State state;                            ///< Current application state
    SimpleTimer<uint16_t> operationTimeout; ///< Bluetooth connection timeout timer

    // Private methods
    /**
     * @brief Handles incoming Bluetooth data
     * @param data The received data byte
     */
    static void bluetoothDataCallback(const char data);

    /**
     * @brief Handles Bluetooth command responses
     * @param command The command that was executed
     * @param result Success status of the command
     * @param response Response text from the device
     */
    static void bluetoothCallback(const __FlashStringHelper *command, const bool result, const String &response);

    /**
     * @brief Handles Bluetooth reset command responses
     * @param command The command that was executed
     * @param result Success status of the command
     * @param response Response text from the device
     */
    static void bluetoothResetCallback(const __FlashStringHelper *command, const bool result, const String &response);

    /**
     * @brief Sends a Bluetooth command with callback
     * @param cmd_progmem Command text stored in program memory
     * @param callback Function to call when command completes
     * @param delayMs Delay before next command
     */
    void sendBluetoothCommand(const char *cmd_progmem, HC05::CommandCallback callback, uint16_t delayMs);

    /**
     * @brief Executes the Bluetooth reset sequence
     * Resets the device to factory settings and configures it
     */
    void bluetoothResetSequence();

    /**
     * @brief Executes the Bluetooth initialization sequence
     * Configures the device for normal operation
     */
    void bluetoothInitSequence();

    /**
     * @brief Handles the main business logic
     * Processes button presses and manages device states
     */
    void handleBusinessLogic();

    /**
     * @brief Sets up Timer1 for software serial communication
     * @param oversampleBitPeriod Timer period for bit sampling
     */
    static void timer1Setup(const unsigned long oversampleBitPeriod);
};

#endif // K810_SECURITY_H