#ifndef HC05_H
#define HC05_H

#include <StringBuffer.h>
#include <ArduinoQueue.h>
#include <Stream.h>

class HC05
{
public:
  typedef void (*CommandCallback)(const String &, bool, const String &);
  typedef void (*DataCallback)(const char);

  HC05(
      Stream &stream,
      const uint8_t keyPin,
      const uint8_t statePin,
      const uint8_t resetPin);

  void begin();
  void sendCommand(const String &command, const CommandCallback callback);
  void sendData(const String &data);
  void sendData(const char data);
  void onDataReceived(const DataCallback callback);
  void reset(const bool permanent = false);
  bool isConnected();
  bool isDataMode();

  void loop();

private:
  enum State : uint8_t
  {
    IDLE,
    WAITING_FOR_RESPONSE,
    DATA_MODE,
    RESETTING,
    RESETTING_PERMANENTLY,
    INITIALIZING,
    INITIALIZING_WAIT,
    CHECKING_AT_MODE,
    WAITING_FOR_AT_RESPONSE,
    WAITING_FOR_COMMAND_MODE,
    WAITING_FOR_DATA_MODE
  };

  struct Command
  {
    String commandText;
    CommandCallback callback;
  };

  void setState(const State newState);
  void processNextCommand();
  void updateConnectionState();
  void appendStreamData();
  bool processResponseBufferForCommand();

  void handleInitializing();
  void handleResetting();
  void handleResettingPermanently();
  void handleInitializingWait();
  void handleCheckingATMode();
  void handleWaitingForATResponse();
  void handleWaitingForCommandMode();
  void handleWaitingForDataMode();
  void handleWaitingForResponse();
  void handleDataMode();
  void handleIdle();

  Stream &m_stream;
  const uint8_t m_keyPin;
  const uint8_t m_statePin;
  const uint8_t m_resetPin;

  ArduinoQueue<const Command *> m_commandQueue;
  StringBuffer<32> m_responseBuffer;
  State m_currentState;
  bool m_inCommandMode;
  bool m_connected;
  unsigned long m_stateStartTime;
  DataCallback m_dataReceivedCallback;
};

#endif
