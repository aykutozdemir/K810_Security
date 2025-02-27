#include "HC05.h"
#include <Arduino.h>

HC05::HC05(Stream &stream,
           const uint8_t keyPin,
           const uint8_t statePin,
           const uint8_t resetPin)
    : m_stream(stream),
      m_keyPin(keyPin),
      m_statePin(statePin),
      m_resetPin(resetPin),
      m_status{INITIALIZING, true, false},
      m_stateStartTime(0),
      m_dataReceivedCallback(nullptr)
{
}

void HC05::begin()
{
  pinMode(m_statePin, INPUT);
  pinMode(m_resetPin, OUTPUT);
  pinMode(m_keyPin, OUTPUT);

  digitalWrite(m_keyPin, HIGH);
  digitalWrite(m_resetPin, HIGH);

  setState(INITIALIZING);
}

void HC05::sendCommand(const Command &command)
{
  if (m_commandQueue.isFull())
  {
    Serial.println(F("Error: Command queue is full!"));
    return;
  }

  const Command *newCommand = new Command(command);
  m_commandQueue.enqueue(newCommand);
}

void HC05::clearCommandQueue()
{
  while (!m_commandQueue.isEmpty())
  {
    const Command *const command = m_commandQueue.dequeue();
    delete command;
  }
}

void HC05::sendData(const String &data)
{
  if (m_status.inCommandMode)
  {
    Serial.println(F("Error: Cannot send data in command mode!"));
    return;
  }
  m_stream.print(data);
}

void HC05::sendData(const char data)
{
  if (m_status.inCommandMode)
  {
    Serial.println(F("Error: Cannot send data in command mode!"));
    return;
  }
  m_stream.print(data);
}

void HC05::onDataReceived(const DataCallback callback)
{
  m_dataReceivedCallback = callback;
}

bool HC05::isConnected()
{
  return m_status.connected;
}

bool HC05::isDataMode()
{
  return m_status.currentState == DATA_MODE;
}

//---------------- Helper Sub-Methods ----------------//
void HC05::appendStreamData()
{
  while (m_stream.available())
  {
    char c = m_stream.read();
    m_responseBuffer.append(c);
  }
}

void HC05::clearResponseBuffer()
{
  while (m_stream.available())
  {
    m_stream.read();
  }
  m_responseBuffer.clear();
}

bool HC05::isStateTimeElapsed(const uint16_t timeMs)
{
  return ((millis() - m_stateStartTime) > timeMs);
}

bool HC05::processResponseBufferForCommand()
{
  bool success = false;
  bool errorDetected = false;

  if (m_responseBuffer.endsWith(F("OK\r\n")))
  {
    success = true;
  }
  else if (m_responseBuffer.indexOf(F("ERROR:")) != -1 || m_responseBuffer.indexOf(F("FAIL")) != -1)
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

        if (success && (m_status.currentState == WAITING_FOR_RESPONSE))
        {
          m_commandDelayTimer.setInterval(command->delayMs);
          m_commandDelayTimer.reset();
          setState(WAITING_FOR_COMMAND_DELAY);
        }
        else
        {
          setState(IDLE);
        }

        delete command;
      }
    }
    return true;
  }

  return false;
}

//---------------- State Handler Methods ----------------//

void HC05::handleInitializing()
{
  Serial.println(F("Initializing HC-05..."));
  reset();
}

void HC05::handleResetting()
{
  if (isStateTimeElapsed(RESET_DELAY_MS))
  {
    digitalWrite(m_keyPin, HIGH);
    digitalWrite(m_resetPin, HIGH);
    setState(INITIALIZING_WAIT);
  }
}

void HC05::handleResettingPermanently()
{
  // Additional permanent reset handling can be added here.
}

void HC05::handleInitializingWait()
{
  if (isStateTimeElapsed(INIT_WAIT_DELAY_MS))
  {
    setState(CHECKING_AT_MODE);
  }
}

void HC05::handleCheckingATMode()
{
  clearResponseBuffer();
  m_stream.println(F("AT"));
  setState(WAITING_FOR_AT_RESPONSE);
}

void HC05::handleWaitingForATResponse()
{
  appendStreamData();
  if (m_responseBuffer.endsWith(F("OK\r\n")))
  {
    m_commandDelayTimer.setInterval(DEFAULT_COMMAND_DELAY_MS);
    setState(WAITING_FOR_COMMAND_DELAY);
    Serial.println(F("HC-05 is recognized."));
    return;
  }
  if (isStateTimeElapsed(AT_RESPONSE_TIMEOUT_MS))
  {
    Serial.print(F("HC-05 AT check failed. Resetting...: "));
    Serial.println(m_responseBuffer.toString());
    setState(RESETTING);
  }
}

void HC05::handleWaitingForCommandMode()
{
  digitalWrite(m_keyPin, HIGH);
  if (isStateTimeElapsed(COMMAND_MODE_DELAY_MS))
  {
    m_status.inCommandMode = true;
    setState(IDLE);
    Serial.println(F("HC-05 is in COMMAND mode"));
  }
}

void HC05::handleWaitingForDataMode()
{
  digitalWrite(m_keyPin, LOW);
  if (isStateTimeElapsed(DATA_MODE_DELAY_MS))
  {
    m_status.inCommandMode = false;
    setState(DATA_MODE);
    Serial.println(F("HC-05 is in DATA mode"));
  }
}

void HC05::handleWaitingForResponse()
{
  appendStreamData();
  if (m_responseBuffer.indexOf('\n') != -1)
  {
    if (processResponseBufferForCommand())
      return;
  }
  if (isStateTimeElapsed(COMMAND_RESPONSE_TIMEOUT_MS))
  {
    Serial.print(F("HC-05 command processing stuck. Resetting...: "));
    Serial.println(m_responseBuffer.toString());
    setState(RESETTING);
  }
}

void HC05::handleWaitingForCommandDelay()
{
  if (m_commandDelayTimer.isReady())
  {
    setState(IDLE);
  }
}

void HC05::handleDataMode()
{
  while (m_stream.available())
  {
    char c = m_stream.read();
    if (m_status.connected && m_dataReceivedCallback)
    {
      m_dataReceivedCallback(c);
    }
  }
  if (!m_commandQueue.isEmpty())
  {
    setState(WAITING_FOR_COMMAND_MODE);
  }
}

void HC05::handleIdle()
{
  if (!m_commandQueue.isEmpty())
  {
    processNextCommand();
  }
  else
  {
    setState(WAITING_FOR_DATA_MODE);
  }
}

//---------------- Main Loop and Utility Methods ----------------//

void HC05::loop()
{
  updateConnectionState();

  switch (m_status.currentState)
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

void HC05::reset(const bool permanent)
{
  digitalWrite(m_resetPin, LOW);

  setState(permanent ? RESETTING_PERMANENTLY : RESETTING);
}

bool HC05::isResettingPermanently() const
{
  return m_status.currentState == RESETTING_PERMANENTLY;
}

void HC05::forceDataMode()
{
  digitalWrite(m_keyPin, LOW);
  m_status.inCommandMode = false;
  setState(WAITING_FOR_DATA_MODE);
}

void HC05::setState(State newState)
{
  if (m_status.currentState != newState)
  {
    m_status.currentState = newState;
    m_stateStartTime = millis();
  }
}

void HC05::processNextCommand()
{
  if (!m_commandQueue.isEmpty())
  {
    const Command *const nextCommand = m_commandQueue.getHead();
    clearResponseBuffer();
    Serial.print(F("HC-05 sending command: "));
    Serial.println(nextCommand->commandText);
    m_stream.println(nextCommand->commandText);
    setState(WAITING_FOR_RESPONSE);
  }
}

void HC05::updateConnectionState()
{
  const bool connectionStatus = (digitalRead(m_statePin) == HIGH);
  if (connectionStatus != m_status.connected)
  {
    m_status.connected = connectionStatus;
    Serial.println(m_status.connected ? F("BT device connected.") : F("BT device disconnected."));
  }
}
