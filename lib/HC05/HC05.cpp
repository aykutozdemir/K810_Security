/**
 * @file HC05.cpp
 * @brief Implementation of the HC05 Bluetooth module driver.
 *
 * This file contains the implementation of the HC05 class methods for communication
 * with HC-05 Bluetooth modules, supporting both AT command mode and data mode.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#include "HC05.h"
#include <Arduino.h>
#include "../../include/TraceLevel.h"

#undef CLASS_TRACE_LEVEL
#define CLASS_TRACE_LEVEL DEBUG_HC05

// Define common PROGMEM strings for repeated messages
const char HC05::QUEUE_FULL_STR[] PROGMEM = "Queue full";
const char HC05::CMD_MODE_NO_DATA_STR[] PROGMEM = "Command mode - no data";
const char HC05::INIT_STR[] PROGMEM = "Init...";
const char HC05::OK_STR[] PROGMEM = "OK";
const char HC05::AT_FAIL_STR[] PROGMEM = "AT fail: ";
const char HC05::CMD_MODE_STR[] PROGMEM = "Command mode";
const char HC05::DATA_MODE_STR[] PROGMEM = "Data mode";
const char HC05::CMD_TIMEOUT_STR[] PROGMEM = "Command timeout: ";
const char HC05::CONN_STR[] PROGMEM = "Connected";
const char HC05::DISC_STR[] PROGMEM = "Disconnected";
const char HC05::CMD_STR[] PROGMEM = "Command: ";
const char HC05::ERROR_STR[] PROGMEM = "ERROR:";
const char HC05::FAIL_STR[] PROGMEM = "FAIL";

// Define a PROGMEM variable for the OK response string
const char HC05::OK_RESPONSE[] PROGMEM = "OK\r\n";

/**
 * @brief Constructor for the HC05 class
 *
 * @param stream Serial stream for communication with the HC-05 module
 * @param keyPin Pin connected to the KEY/EN pin of the HC-05 module
 * @param statePin Pin connected to the STATE pin of the HC-05 module
 * @param resetPin Pin connected to the RESET pin of the HC-05 module
 */
HC05::HC05(Stream &stream,
           const uint8_t keyPin,
           const uint8_t statePin,
           const uint8_t resetPin)
    : DriverBase(F("HC05")), // Call the base class constructor
      p_stream(&stream),
      m_keyPin(keyPin),
      m_statePin(statePin),
      m_resetPin(resetPin),
      m_status{true, false},
      m_stateManager(INITIALIZING),
      m_dataReceivedCallback(nullptr)
{
}

/**
 * @brief Initialize the HC-05 module
 *
 * Sets up pins and begins initialization sequence
 */
void HC05::begin()
{
  pinMode(m_statePin, INPUT);
  pinMode(m_resetPin, OUTPUT);
  pinMode(m_keyPin, OUTPUT);

  digitalWrite(m_keyPin, HIGH);
  digitalWrite(m_resetPin, HIGH);

  m_stateManager.setState(INITIALIZING);
}

/**
 * @brief Send a command to the HC-05 module
 *
 * @param command The command to send
 */
void HC05::sendCommand(const Command &command)
{
  if (m_commandQueue.isFull())
  {
    TRACE_ERROR()
        << PGMT(QUEUE_FULL_STR)
        << endl;

    return;
  }

  const Command *newCommand = new Command(command);
  m_commandQueue.enqueue(newCommand);
}

/**
 * @brief Clear the command queue
 *
 * Removes all pending commands from the queue
 */
void HC05::clearCommandQueue()
{
  while (!m_commandQueue.isEmpty())
  {
    const Command *const command = m_commandQueue.dequeue();
    delete command;
  }
}

/**
 * @brief Send string data over Bluetooth
 *
 * @param data The string to send
 */
void HC05::sendData(const String &data)
{
  if (m_status.inCommandMode)
  {
    TRACE_ERROR()
        << PGMT(CMD_MODE_NO_DATA_STR)
        << endl;

    return;
  }
  p_stream->print(data);
}

/**
 * @brief Send a single character over Bluetooth
 *
 * @param data The character to send
 */
void HC05::sendData(const char data)
{
  if (m_status.inCommandMode)
  {
    TRACE_ERROR()
        << PGMT(CMD_MODE_NO_DATA_STR)
        << endl;

    return;
  }
  p_stream->print(data);
}

/**
 * @brief Set callback for received data
 *
 * @param callback Function to call when data is received
 */
void HC05::onDataReceived(const DataCallback callback)
{
  m_dataReceivedCallback = callback;
}

/**
 * @brief Check if the module is connected
 *
 * @return true if connected to another Bluetooth device
 */
bool HC05::isConnected()
{
  return m_status.connected;
}

/**
 * @brief Check if the module is in data mode
 *
 * @return true if in data mode
 */
bool HC05::isDataMode()
{
  return m_stateManager.state() == DATA_MODE;
}

//---------------- Helper Sub-Methods ----------------//

/**
 * @brief Append available data from stream to response buffer
 */
void HC05::appendStreamData()
{
  while (p_stream->available())
  {
    char c = p_stream->read();
    m_responseBuffer.append(c);
  }
}

/**
 * @brief Clear response buffer and flush stream
 */
void HC05::clearResponseBuffer()
{
  while (p_stream->available())
  {
    p_stream->read();
  }
  m_responseBuffer.clear();
}

/**
 * @brief Process response buffer for command completion
 *
 * @return true if command response was successfully processed
 */
bool HC05::processResponseBufferForCommand()
{
  bool success = false;
  bool errorDetected = false;

  if (m_responseBuffer.endsWith(PGMT(OK_RESPONSE)))
  {
    success = true;
  }
  else if (m_responseBuffer.indexOf(PGMT(ERROR_STR)) != -1 ||
           m_responseBuffer.indexOf(PGMT(FAIL_STR)) != -1)
  {
    errorDetected = true;
  }

  if (success || errorDetected)
  {
    if (!m_commandQueue.isEmpty())
    {
      const Command *const command = m_commandQueue.dequeue();
      if (command != nullptr)
      {
        if (command->callback != nullptr)
        {
          command->callback(command->commandText, success, m_responseBuffer.toString());
        }

        if (success && (m_stateManager.state() == WAITING_FOR_RESPONSE))
        {
          m_commandDelayTimer.setInterval(command->delayMs);
          m_commandDelayTimer.reset();
          m_stateManager.setState(WAITING_FOR_COMMAND_DELAY);
        }
        else
        {
          m_stateManager.setState(IDLE);
        }

        delete command;
      }
    }
    return true;
  }

  return false;
}

//---------------- State Handler Methods ----------------//

/**
 * @brief Handle initializing state
 *
 * Prints initialization message and resets the module
 */
void HC05::handleInitializing()
{
  TRACE_INFO()
      << PGMT(INIT_STR)
      << endl;

  reset();
}

/**
 * @brief Handle resetting state
 *
 * Waits for reset delay then transitions to initializing wait state
 */
void HC05::handleResetting()
{
  if (m_stateManager.isStateTimeElapsed(RESET_DELAY_MS))
  {
    digitalWrite(m_keyPin, HIGH);
    digitalWrite(m_resetPin, HIGH);
    m_stateManager.setState(INITIALIZING_WAIT);
  }
}

/**
 * @brief Handle permanent resetting state
 *
 * Additional handling for permanent reset operations
 */
void HC05::handleResettingPermanently()
{
  // Additional permanent reset handling can be added here.
}

/**
 * @brief Handle initializing wait state
 *
 * Waits for initialization delay then transitions to checking AT mode
 */
void HC05::handleInitializingWait()
{
  if (m_stateManager.isStateTimeElapsed(INIT_WAIT_DELAY_MS))
  {
    m_stateManager.setState(CHECKING_AT_MODE);
  }
}

/**
 * @brief Handle checking AT mode state
 *
 * Sends AT command to check if module is in command mode
 */
void HC05::handleCheckingATMode()
{
  clearResponseBuffer();
  p_stream->println(F("AT"));
  m_stateManager.setState(WAITING_FOR_AT_RESPONSE);
}

/**
 * @brief Handle waiting for AT response state
 *
 * Waits for response to AT command to verify command mode
 */
void HC05::handleWaitingForATResponse()
{
  appendStreamData();
  if (m_responseBuffer.endsWith(PGMT(OK_RESPONSE)))
  {
    m_commandDelayTimer.setInterval(DEFAULT_COMMAND_DELAY_MS);
    m_stateManager.setState(WAITING_FOR_COMMAND_DELAY);

    TRACE_INFO()
        << PGMT(OK_STR)
        << endl;

    return;
  }
  if (m_stateManager.isStateTimeElapsed(AT_RESPONSE_TIMEOUT_MS))
  {
    TRACE_ERROR()
        << PGMT(AT_FAIL_STR)
        << m_responseBuffer.toString().c_str()
        << endl;

    m_stateManager.setState(RESETTING);
  }
}

/**
 * @brief Handle waiting for command mode state
 *
 * Waits for command mode to be activated
 */
void HC05::handleWaitingForCommandMode()
{
  digitalWrite(m_keyPin, HIGH);
  if (m_stateManager.isStateTimeElapsed(COMMAND_MODE_DELAY_MS))
  {
    m_status.inCommandMode = true;
    m_stateManager.setState(IDLE);

    TRACE_INFO()
        << PGMT(CMD_MODE_STR)
        << endl;
  }
}

/**
 * @brief Handle waiting for data mode state
 *
 * Waits for data mode to be activated
 */
void HC05::handleWaitingForDataMode()
{
  digitalWrite(m_keyPin, LOW);
  if (m_stateManager.isStateTimeElapsed(DATA_MODE_DELAY_MS))
  {
    m_status.inCommandMode = false;
    m_stateManager.setState(DATA_MODE);

    TRACE_INFO()
        << PGMT(DATA_MODE_STR)
        << endl;
  }
}

/**
 * @brief Handle waiting for response state
 *
 * Waits for response to a sent command
 */
void HC05::handleWaitingForResponse()
{
  appendStreamData();
  if (m_responseBuffer.indexOf('\n') != -1)
  {
    if (processResponseBufferForCommand())
      return;
  }
  if (m_stateManager.isStateTimeElapsed(COMMAND_RESPONSE_TIMEOUT_MS))
  {
    TRACE_ERROR()
        << PGMT(CMD_TIMEOUT_STR)
        << m_responseBuffer.toString().c_str()
        << endl;

    m_stateManager.setState(RESETTING);
  }
}

/**
 * @brief Handle waiting for command delay state
 *
 * Waits for delay between commands
 */
void HC05::handleWaitingForCommandDelay()
{
  if (m_commandDelayTimer.isReady())
  {
    m_stateManager.setState(IDLE);
  }
}

/**
 * @brief Handle data mode state
 *
 * Processes incoming data and checks if commands need to be sent
 */
void HC05::handleDataMode()
{
  while (p_stream->available())
  {
    char c = p_stream->read();
    if (m_status.connected && m_dataReceivedCallback)
    {
      m_dataReceivedCallback(c);
    }
  }
  if (!m_commandQueue.isEmpty())
  {
    m_stateManager.setState(WAITING_FOR_COMMAND_MODE);
  }
}

/**
 * @brief Handle idle state
 *
 * Processes any pending commands or transitions to data mode
 */
void HC05::handleIdle()
{
  if (!m_commandQueue.isEmpty())
  {
    processNextCommand();
  }
  else
  {
    m_stateManager.setState(WAITING_FOR_DATA_MODE);
  }
}

//---------------- Main Loop and Utility Methods ----------------//

/**
 * @brief Main loop function for the HC05 module
 *
 * Should be called regularly to handle state machine updates
 */
void HC05::loop()
{
  // Call the base class loop method
  DriverBase::loop();

  updateConnectionState();

  switch (m_stateManager.state())
  {
  case INITIALIZING:
    handleInitializing();
    break;
  case RESETTING:
    handleResetting();
    break;
  case RESETTING_PERMANENTLY:
    handleResettingPermanently();
    break;
  case INITIALIZING_WAIT:
    handleInitializingWait();
    break;
  case CHECKING_AT_MODE:
    handleCheckingATMode();
    break;
  case WAITING_FOR_AT_RESPONSE:
    handleWaitingForATResponse();
    break;
  case WAITING_FOR_COMMAND_MODE:
    handleWaitingForCommandMode();
    break;
  case WAITING_FOR_DATA_MODE:
    handleWaitingForDataMode();
    break;
  case WAITING_FOR_RESPONSE:
    handleWaitingForResponse();
    break;
  case WAITING_FOR_COMMAND_DELAY:
    handleWaitingForCommandDelay();
    break;
  case DATA_MODE:
    handleDataMode();
    break;
  case IDLE:
    handleIdle();
    break;
  }
}

/**
 * @brief Reset the HC-05 module
 *
 * @param permanent Whether to perform a permanent reset
 */
void HC05::reset(const bool permanent)
{
  digitalWrite(m_resetPin, LOW);

  m_stateManager.setState(permanent ? RESETTING_PERMANENTLY : RESETTING);
}

/**
 * @brief Check if the module is in permanent reset state
 *
 * @return true if permanent reset is in progress
 */
bool HC05::isResettingPermanently() const
{
  return m_stateManager.state() == RESETTING_PERMANENTLY;
}

/**
 * @brief Force the module into data mode
 *
 * Sets KEY pin LOW and transitions to data mode
 */
void HC05::forceDataMode()
{
  digitalWrite(m_keyPin, LOW);
  m_status.inCommandMode = false;
  m_stateManager.setState(WAITING_FOR_DATA_MODE);
}

/**
 * @brief Process the next command in the queue
 *
 * Sends the next command to the HC-05 module
 */
void HC05::processNextCommand()
{
  if (!m_commandQueue.isEmpty())
  {
    const Command *const nextCommand = m_commandQueue.getHead();
    clearResponseBuffer();
    TRACE_INFO()
        << PGMT(CMD_STR)
        << nextCommand->commandText
        << endl;
    p_stream->println(nextCommand->commandText);
    m_stateManager.setState(WAITING_FOR_RESPONSE);
  }
}

/**
 * @brief Update the connection state based on STATE pin
 *
 * Checks the STATE pin and updates connected status
 */
void HC05::updateConnectionState()
{
  const bool connectionStatus = (digitalRead(m_statePin) == HIGH);
  if (connectionStatus != m_status.connected)
  {
    m_status.connected = connectionStatus;
    TRACE_INFO()
        << (connectionStatus ? PGMT(CONN_STR) : PGMT(DISC_STR))
        << endl;
  }
}
