#ifndef HC05_H
#define HC05_H

#include <StringBuffer.h>
#include <ArduinoQueue.h>
#include <Stream.h>
#include <SimpleTimer.h>
class HC05
{
public:
  typedef void (*CommandCallback)(const __FlashStringHelper *, bool, const String &);
  typedef void (*DataCallback)(const char);

  struct Command
  {
    const __FlashStringHelper *commandText;
    CommandCallback callback;
    uint16_t delayMs;
  };

  HC05(
      Stream &stream,
      const uint8_t keyPin,
      const uint8_t statePin,
      const uint8_t resetPin);

  void begin();

  void sendCommand(const Command &command);
  void clearCommandQueue();
  void sendData(const String &data);
  void sendData(const char data);
  void onDataReceived(const DataCallback callback);

  void reset(const bool permanent = false);
  bool isResettingPermanently() const;
  void forceDataMode();
  bool isConnected();
  bool isDataMode();

  void loop();

private:
  // Add timing constants
  static constexpr uint16_t RESET_DELAY_MS = 500;
  static constexpr uint16_t INIT_WAIT_DELAY_MS = 3000;
  static constexpr uint16_t AT_RESPONSE_TIMEOUT_MS = 4000;
  static constexpr uint16_t COMMAND_MODE_DELAY_MS = 1000;
  static constexpr uint16_t DATA_MODE_DELAY_MS = 500;
  static constexpr uint16_t COMMAND_RESPONSE_TIMEOUT_MS = 4000;
  static constexpr uint16_t DEFAULT_COMMAND_DELAY_MS = 200;
  
  // Add buffer size constants
  static constexpr uint8_t RESPONSE_BUFFER_SIZE = 64;

  enum State : uint8_t
  {
    IDLE = 0,
    WAITING_FOR_RESPONSE,
    WAITING_FOR_COMMAND_DELAY,
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

  struct Status
  {
    uint8_t currentState : 4;
    uint8_t inCommandMode : 1;
    uint8_t connected : 1;
    uint8_t unused : 2;
  };

  void setState(const State newState);
  void processNextCommand();
  void updateConnectionState();
  void appendStreamData();
  void clearResponseBuffer();
  bool isStateTimeElapsed(const uint16_t timeMs);
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
  void handleWaitingForCommandDelay();
  void handleDataMode();
  void handleIdle();

  Stream &m_stream;
  const uint8_t m_keyPin;
  const uint8_t m_statePin;
  const uint8_t m_resetPin;

  ArduinoQueue<const Command *> m_commandQueue;
  StringBuffer<RESPONSE_BUFFER_SIZE> m_responseBuffer;
  Status m_status;
  unsigned long m_stateStartTime;
  DataCallback m_dataReceivedCallback;
  SimpleTimer<uint16_t> m_commandDelayTimer;
};

#endif
