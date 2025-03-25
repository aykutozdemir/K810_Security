/**
 * @file HC05.h
 * @brief Bluetooth HC-05 module driver.
 *
 * This file contains the HC05 class which provides an interface for communicating with
 * HC-05 Bluetooth modules. It supports both AT command mode for configuration and
 * data mode for communication with paired devices.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef HC05_H
#define HC05_H

#include <StringBuffer.h>
#include <ArduinoQueue.h>
#include <Stream.h>
#include <SimpleTimer.h>
#include <Utilities.h>
#include "DriverBase.h"

/**
 * @brief HC-05 Bluetooth module driver class
 *
 * This class provides functions to communicate with and control HC-05 Bluetooth modules,
 * supporting both AT command mode for configuration and data mode for communication.
 */
class HC05 : public DriverBase
{
public:
  /**
   * @brief Callback function type for command responses
   * @param command The command that was sent
   * @param success Whether the command was successful
   * @param response The response received from the module
   */
  typedef void (*CommandCallback)(const __FlashStringHelper *, bool, const String &);

  /**
   * @brief Callback function type for received data
   * @param data The character received
   */
  typedef void (*DataCallback)(const char);

  /**
   * @brief HC05 module states
   */
  enum State : uint8_t
  {
    IDLE = 0,                  ///< Module is idle
    WAITING_FOR_RESPONSE,      ///< Waiting for response to a command
    WAITING_FOR_COMMAND_DELAY, ///< Waiting for delay between commands
    DATA_MODE,                 ///< Module is in data mode
    RESETTING,                 ///< Module is resetting
    RESETTING_PERMANENTLY,     ///< Module is performing a permanent reset
    INITIALIZING,              ///< Module is initializing
    INITIALIZING_WAIT,         ///< Waiting after initialization
    CHECKING_AT_MODE,          ///< Checking if AT mode is accessible
    WAITING_FOR_AT_RESPONSE,   ///< Waiting for response to AT command
    WAITING_FOR_COMMAND_MODE,  ///< Waiting for command mode to be activated
    WAITING_FOR_DATA_MODE      ///< Waiting for data mode to be activated
  };

  /**
   * @brief Command structure
   */
  struct Command
  {
    const __FlashStringHelper *commandText; ///< The command text to send
    CommandCallback callback;               ///< Callback to execute when response is received
    uint16_t delayMs;                       ///< Delay after command execution (ms)
  };

  /**
   * @brief Constructor
   *
   * @param stream Serial stream for communication with HC-05
   * @param keyPin Pin connected to KEY/EN pin of HC-05
   * @param statePin Pin connected to STATE pin of HC-05
   * @param resetPin Pin connected to RESET pin of HC-05
   */
  HC05(
      Stream &stream,
      const uint8_t keyPin,
      const uint8_t statePin,
      const uint8_t resetPin);

  /**
   * @brief Initialize the HC-05 module
   */
  void begin();

  /**
   * @brief Send a command to the HC-05 module
   *
   * @param command Command structure with command text, callback, and delay
   */
  void sendCommand(const Command &command);

  /**
   * @brief Clear all pending commands from the queue
   */
  void clearCommandQueue();

  /**
   * @brief Send data string to connected device
   *
   * @param data String data to send
   */
  void sendData(const String &data);

  /**
   * @brief Send a single character to connected device
   *
   * @param data Character to send
   */
  void sendData(const char data);

  /**
   * @brief Set callback for received data
   *
   * @param callback Function to call when data is received
   */
  void onDataReceived(const DataCallback callback);

  /**
   * @brief Reset the HC-05 module
   *
   * @param permanent If true, perform a more thorough reset
   */
  void reset(const bool permanent = false);

  /**
   * @brief Check if module is performing a permanent reset
   *
   * @return true if module is in permanent reset state
   */
  bool isResettingPermanently() const;

  /**
   * @brief Force the module into data mode
   */
  void forceDataMode();

  /**
   * @brief Check if module is connected to another device
   *
   * @return true if connected
   */
  bool isConnected();

  /**
   * @brief Check if module is in data mode
   *
   * @return true if in data mode
   */
  bool isDataMode();

  /**
   * @brief Process module state machine
   *
   * Should be called regularly in the main loop
   */
  void loop();

private:
  // Declare a static PROGMEM variable for the OK response string
  static const char OK_RESPONSE[] PROGMEM; ///< OK response pattern

  // Declare common PROGMEM strings for repeated messages
  static const char QUEUE_FULL_STR[] PROGMEM;       ///< Queue full message
  static const char CMD_MODE_NO_DATA_STR[] PROGMEM; ///< Command mode - no data message
  static const char INIT_STR[] PROGMEM;             ///< Initializing message
  static const char OK_STR[] PROGMEM;               ///< OK message
  static const char AT_FAIL_STR[] PROGMEM;          ///< AT command failed message
  static const char CMD_MODE_STR[] PROGMEM;         ///< Command mode message
  static const char DATA_MODE_STR[] PROGMEM;        ///< Data mode message
  static const char CMD_TIMEOUT_STR[] PROGMEM;      ///< Command timeout message
  static const char CONN_STR[] PROGMEM;             ///< Connected message
  static const char DISC_STR[] PROGMEM;             ///< Disconnected message
  static const char CMD_STR[] PROGMEM;              ///< Command message
  static const char ERROR_STR[] PROGMEM;            ///< Error message
  static const char FAIL_STR[] PROGMEM;             ///< Fail message

  // Add timing constants
  /// Reset delay in milliseconds
  static constexpr uint16_t RESET_DELAY_MS = 500;
  /// Initialization wait delay in milliseconds
  static constexpr uint16_t INIT_WAIT_DELAY_MS = 3000;
  /// AT response timeout in milliseconds
  static constexpr uint16_t AT_RESPONSE_TIMEOUT_MS = 4000;
  /// Command mode delay in milliseconds
  static constexpr uint16_t COMMAND_MODE_DELAY_MS = 1000;
  /// Data mode delay in milliseconds
  static constexpr uint16_t DATA_MODE_DELAY_MS = 500;
  /// Command response timeout in milliseconds
  static constexpr uint16_t COMMAND_RESPONSE_TIMEOUT_MS = 4000;
  /// Default command delay in milliseconds
  static constexpr uint16_t DEFAULT_COMMAND_DELAY_MS = 200;
  // Add buffer size constants
  /// Response buffer size
  static constexpr uint8_t RESPONSE_BUFFER_SIZE = 64;

  /**
   * @brief Status flags struct
   */
  struct Status
  {
    uint8_t inCommandMode : 1; ///< Whether module is in command mode
    uint8_t connected : 1;     ///< Whether module is connected to another device
    uint8_t unused : 6;        ///< Unused bits
  };

  /**
   * @brief Process next command in queue
   */
  void processNextCommand();

  /**
   * @brief Update connection state based on STATE pin
   */
  void updateConnectionState();

  /**
   * @brief Append data from stream to response buffer
   */
  void appendStreamData();

  /**
   * @brief Clear response buffer
   */
  void clearResponseBuffer();

  /**
   * @brief Process response buffer for command
   *
   * @return true if response complete
   */
  bool processResponseBufferForCommand();

  // State handler methods

  /**
   * @brief Handle initializing state
   */
  void handleInitializing();

  /**
   * @brief Handle resetting state
   */
  void handleResetting();

  /**
   * @brief Handle permanent reset state
   */
  void handleResettingPermanently();

  /**
   * @brief Handle initialization wait state
   */
  void handleInitializingWait();

  /**
   * @brief Handle checking AT mode state
   */
  void handleCheckingATMode();

  /**
   * @brief Handle waiting for AT response state
   */
  void handleWaitingForATResponse();

  /**
   * @brief Handle waiting for command mode state
   */
  void handleWaitingForCommandMode();

  /**
   * @brief Handle waiting for data mode state
   */
  void handleWaitingForDataMode();

  /**
   * @brief Handle waiting for response state
   */
  void handleWaitingForResponse();

  /**
   * @brief Handle waiting for command delay state
   */
  void handleWaitingForCommandDelay();

  /**
   * @brief Handle data mode state
   */
  void handleDataMode();

  /**
   * @brief Handle idle state
   */
  void handleIdle();

  Stream *const p_stream;   ///< Stream for communication with HC-05
  const uint8_t m_keyPin;   ///< Pin connected to KEY/EN pin of HC-05
  const uint8_t m_statePin; ///< Pin connected to STATE pin of HC-05
  const uint8_t m_resetPin; ///< Pin connected to RESET pin of HC-05

  ArduinoQueue<const Command *> m_commandQueue;        ///< Queue of commands to send
  StringBuffer<RESPONSE_BUFFER_SIZE> m_responseBuffer; ///< Buffer for responses
  Status m_status;                                     ///< Current status flags
  StateManager<State> m_stateManager{INITIALIZING};    ///< State manager
  DataCallback m_dataReceivedCallback;                 ///< Callback for received data
  SimpleTimer<uint16_t> m_commandDelayTimer;           ///< Timer for command delays
};

#endif
