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

  digitalWrite(m_resetPin, LOW);
  digitalWrite(m_keyPin, HIGH);

  setState(INITIALIZING);
}

void HC05::sendCommand(const String &command, const CommandCallback callback)
{
  if (m_commandQueue.isFull())
  {
    Serial.println(F("Error: Command queue is full!"));
    return;
  }
  // Allocate a new command and enqueue it.
  const Command *newCommand = new Command({command, callback});
  m_commandQueue.enqueue(newCommand);
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

bool HC05::processResponseBufferForCommand()
{
  if (m_responseBuffer.endsWith(F("OK\r\n")))
  {
    int okIndex = m_responseBuffer.indexOf(F("OK\r\n"));
    m_responseBuffer = m_responseBuffer.substring(0, okIndex);
    m_responseBuffer.trim();
    if (!m_commandQueue.isEmpty())
    {
      const Command *command = m_commandQueue.dequeue();
      if (command->callback != nullptr)
      {
        command->callback(command->commandText, true, m_responseBuffer.toString());
      }
      delete command;
    }
    setState(IDLE);
    return true;
  }
  if (m_responseBuffer.indexOf(F("ERROR:")) != -1)
  {
    if (!m_commandQueue.isEmpty())
    {
      const Command *command = m_commandQueue.dequeue();
      if (command->callback != nullptr)
      {
        command->callback(command->commandText, false, m_responseBuffer.toString());
      }
      delete command;
    }
    setState(IDLE);
    return true;
  }
  return false;
}

//---------------- State Handler Methods ----------------//

void HC05::handleInitializing()
{
  Serial.println(F("Initializing HC-05..."));
  reset(); // Uses the default (non-permanent) reset.
}

void HC05::handleResetting()
{
  if (millis() - m_stateStartTime > 500)
  {
    digitalWrite(m_resetPin, HIGH);
    digitalWrite(m_keyPin, HIGH);
    setState(INITIALIZING_WAIT);
  }
}

void HC05::handleResettingPermanently()
{
  // Additional permanent reset handling can be added here.
}

void HC05::handleInitializingWait()
{
  if (millis() - m_stateStartTime > 3000)
  {
    setState(CHECKING_AT_MODE);
  }
}

void HC05::handleCheckingATMode()
{
  m_responseBuffer.clear();
  m_stream.print(F("AT\r\n"));
  setState(WAITING_FOR_AT_RESPONSE);
}

void HC05::handleWaitingForATResponse()
{
  appendStreamData();
  if (m_responseBuffer.endsWith(F("OK\r\n")))
  {
    setState(IDLE);
    Serial.println(F("HC-05 is recognized."));
    return;
  }
  if (millis() - m_stateStartTime > 4000)
  {
    Serial.println(F("HC-05 AT mode check failed. Resetting..."));
    setState(RESETTING);
  }
}

void HC05::handleWaitingForCommandMode()
{
  digitalWrite(m_keyPin, HIGH);
  if (millis() - m_stateStartTime > 250)
  {
    m_status.inCommandMode = true;
    setState(IDLE);
    Serial.println(F("HC-05 is in COMMAND mode"));
  }
}

void HC05::handleWaitingForDataMode()
{
  digitalWrite(m_keyPin, LOW);
  if (millis() - m_stateStartTime > 250)
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
  if (millis() - m_stateStartTime > 4000)
  {
    Serial.println(F("HC-05 command processing stuck. Resetting..."));
    setState(RESETTING);
  }
}

void HC05::handleDataMode()
{
  // In data mode, process incoming data by invoking the callback.
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

void HC05::setState(State newState)
{
  m_status.currentState = newState;
  m_stateStartTime = millis();
}

void HC05::processNextCommand()
{
  static unsigned long lastCommandTime = 0;

  if (!m_commandQueue.isEmpty())
  {
    if ((millis() - lastCommandTime) < 500)
    {
      return;
    }

    const Command *nextCommand = m_commandQueue.getHead();
    m_responseBuffer.clear();
    m_stream.print(nextCommand->commandText);
    m_stream.print(F("\r\n"));
    setState(WAITING_FOR_RESPONSE);
    lastCommandTime = millis();
  }
}

void HC05::updateConnectionState()
{
  bool connectionStatus = (digitalRead(m_statePin) == HIGH);
  if (connectionStatus != m_status.connected)
  {
    m_status.connected = connectionStatus;
    Serial.println(m_status.connected ? F("BT device connected.") : F("BT device disconnected."));
  }
}
