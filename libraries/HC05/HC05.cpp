#include "HC05.h"
#include <Arduino.h>

HC05::HC05(
  Stream& stream,
  const uint8_t keyPin,
  const uint8_t statePin,
  const uint8_t resetPin)
  : m_stream(stream), m_keyPin(keyPin), m_statePin(statePin), m_resetPin(resetPin), m_currentState(INITIALIZING),
    m_inCommandMode(true), m_connected(false), m_stateStartTime(0), m_dataReceivedCallback(nullptr) {
}

void HC05::begin() {
  pinMode(m_statePin, INPUT);
  pinMode(m_resetPin, OUTPUT);
  pinMode(m_keyPin, OUTPUT);

  digitalWrite(m_resetPin, LOW);
  digitalWrite(m_keyPin, HIGH);

  setState(INITIALIZING);
}

void HC05::sendCommand(const String& command, const CommandCallback callback) {
  if (m_commandQueue.isFull()) {
    Serial.println(F("Error: Command queue is full!"));
    return;
  }

  const Command* newCommand = new Command({ command, callback });
  m_commandQueue.enqueue(newCommand);
}

void HC05::sendData(const String& data) {
  if (m_inCommandMode) {
    Serial.println(F("Error: Cannot send data in command mode!"));
    return;
  }
  m_stream.print(data);
}

void HC05::sendData(const char data) {
  if (m_inCommandMode) {
    Serial.println(F("Error: Cannot send data in command mode!"));
    return;
  }
  m_stream.print(data);
}

void HC05::onDataReceived(const DataCallback callback) {
  m_dataReceivedCallback = callback;
}

bool HC05::isConnected() {
  return m_connected;
}

bool HC05::isDataMode() {
  return m_currentState == DATA_MODE;
}

void HC05::handleInitializing() {
  Serial.println(F("Initializing HC-05..."));
  reset();
}

void HC05::handleResetting() {
  if (millis() - m_stateStartTime > 250) {
    digitalWrite(m_resetPin, HIGH);
    digitalWrite(m_keyPin, HIGH);
    setState(INITIALIZING_WAIT);
  }
}

void HC05::handleResettingPermanently() {
}

void HC05::handleInitializingWait() {
  if (millis() - m_stateStartTime > 2500) {
    setState(CHECKING_AT_MODE);
  }
}

void HC05::handleCheckingATMode() {
  m_responseBuffer.clear();
  m_stream.print(F("AT\r\n"));
  setState(WAITING_FOR_AT_RESPONSE);
}

void HC05::handleWaitingForATResponse() {
  while (m_stream.available()) {
    const char c = m_stream.read();
    m_responseBuffer.append(c);

    if (c == '\n') {
      if (m_responseBuffer.endsWith(F("OK\r\n"))) {
        setState(IDLE);
        Serial.println(F("HC-05 is recognized."));
        return;
      }
    }
  }
  if (millis() - m_stateStartTime > 3000) {
    Serial.println(F("HC-05 AT mode check failed. Resetting..."));
    setState(RESETTING);
  }
}

void HC05::handleWaitingForCommandMode() {
  digitalWrite(m_keyPin, HIGH);
  if (millis() - m_stateStartTime > 100) {
    m_inCommandMode = true;
    setState(IDLE);
    Serial.println(F("HC-05 is in COMMAND mode"));
  }
}

void HC05::handleWaitingForDataMode() {
  digitalWrite(m_keyPin, LOW);
  if (millis() - m_stateStartTime > 150) {
    m_inCommandMode = false;
    setState(DATA_MODE);
    Serial.println(F("HC-05 is in DATA mode"));
  }
}

void HC05::handleWaitingForResponse() {
  while (m_stream.available()) {
    const char c = m_stream.read();
    m_responseBuffer.append(c);

    if (c == '\n') {
      if (m_responseBuffer.endsWith(F("OK\r\n"))) {
        const int okIndex = m_responseBuffer.indexOf(F("OK\r\n"));
        m_responseBuffer = m_responseBuffer.substring(0, okIndex);
        m_responseBuffer.trim();

        if (!m_commandQueue.isEmpty()) {
          const Command* const command = m_commandQueue.dequeue();
          if (command->callback != nullptr) {
            command->callback(command->commandText, true, m_responseBuffer.toString());
          }
          delete command;
        }

        setState(IDLE);

        return;
      }

      if (m_responseBuffer.indexOf(F("ERROR:")) != -1) {
        if (!m_commandQueue.isEmpty()) {
          const Command* const command = m_commandQueue.dequeue();
          if (command->callback != nullptr) {
            command->callback(command->commandText, false, m_responseBuffer.toString());
          }
          delete command;
        }

        setState(IDLE);

        return;
      }
    }
  }
  if (millis() - m_stateStartTime > 3000) {
    Serial.println(F("HC-05 command processing stucked. Resetting..."));
    setState(RESETTING);
  }
}

void HC05::handleDataMode() {
  while (m_stream.available()) {
    char c = m_stream.read();
    if (m_connected && m_dataReceivedCallback) {
      m_dataReceivedCallback(c);
    }
  }

  if (!m_commandQueue.isEmpty()) {
    setState(WAITING_FOR_COMMAND_MODE);
  }
}

void HC05::handleIdle() {
  if (!m_commandQueue.isEmpty()) {
    processNextCommand();
  } else {
    setState(WAITING_FOR_DATA_MODE);
  }
}

void HC05::loop() {
  updateConnectionState();

  switch (m_currentState) {
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

void HC05::reset(const bool permanent) {
  digitalWrite(m_resetPin, LOW);
  setState(permanent ? RESETTING_PERMANENTLY : RESETTING);
}

void HC05::setState(State newState) {
  m_currentState = newState;
  m_stateStartTime = millis();
}

void HC05::processNextCommand() {
  if (!m_commandQueue.isEmpty()) {
    const Command* const nextCommand = m_commandQueue.getHead();
    m_responseBuffer.clear();
    m_stream.print(nextCommand->commandText);
    m_stream.print(F("\r\n"));
    setState(WAITING_FOR_RESPONSE);
  }
}

void HC05::updateConnectionState() {
  const bool connectionStatus = digitalRead(m_statePin) == HIGH;
  if (connectionStatus != m_connected) {
    m_connected = connectionStatus;

    if (m_connected) {
      Serial.println(F("Bluetooth device connected."));
    } else {
      Serial.println(F("Bluetooth device disconnected."));
    }
  }
}
