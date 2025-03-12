#include <Arduino.h>
#include <Utilities.h>
#include <ControllerBase.h>
#include <StaticSerialCommands.h>

// Example controller that uses the ControllerBase
class ExampleController : public ControllerBase
{
public:
  enum State
  {
    IDLE,
    ACTIVE,
    ERROR
  };

  ExampleController() : m_state(IDLE), m_counter(0) {}

  virtual void setup() override
  {
    debugPrint(F("ExampleController initialized"));
  }

  virtual void loop() override
  {
    m_counter++;

    // Change state every 1000 iterations
    if (m_counter % 1000 == 0)
    {
      switch (m_state)
      {
      case IDLE:
        setState(ACTIVE);
        break;
      case ACTIVE:
        setState(ERROR);
        break;
      case ERROR:
        setState(IDLE);
        break;
      }
    }
  }

  void setState(State newState)
  {
    if (changeState(m_state, newState))
    {
      debugPrint(F("State changed to:"), (int)newState);
    }
  }

  State getState() const
  {
    return m_state;
  }

private:
  State m_state;
  uint16_t m_counter;
};

// Example command callback
void commandExample(SerialCommands &sender, Args &args)
{
  // Use utility functions for consistent output
  Utilities::printOK(sender);
}

// Create controller instance
ExampleController controller;

// Setup serial commands
const Command commands[] = {
    COMMAND(commandExample, "example", NULL, "example command")};

char commandBuffer[32];
SerialCommands serialCommands(
    Serial,
    commands,
    sizeof(commands) / sizeof(Command),
    commandBuffer,
    sizeof(commandBuffer) / sizeof(char),
    1000);

void setup()
{
  Serial.begin(115200);
  while (!Serial)
  {
    ; // Wait for serial port to connect
  }

  // Print a separator
  Utilities::printStars(Serial);
  Serial.println(F("Utilities Library Example"));
  Utilities::printStars(Serial);

  // Initialize controller
  controller.setup();

  // Example of secure memory operations
  byte sensitiveData[16] = {0x01, 0x02, 0x03, 0x04};
  Serial.println(F("Cleaning sensitive data..."));
  Utilities::secureClean(sensitiveData, sizeof(sensitiveData));

  // Example of hex string conversion
  const char *hexString = "0123456789ABCDEF";
  byte hexData[8];
  if (Utilities::hexStringToBytes(hexString, hexData, 8))
  {
    Serial.print(F("Converted hex string: "));
    for (int i = 0; i < 8; i++)
    {
      Utilities::printHexByte(serialCommands, hexData[i]);
      Serial.print(' ');
    }
    Serial.println();
  }
}

void loop()
{
  // Process serial commands
  serialCommands.readSerial();

  // Update controller
  controller.loop();

  // Slow down the loop
  delay(10);
}