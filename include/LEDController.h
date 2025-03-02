#ifndef LEDCONTROLLER_H
#define LEDCONTROLLER_H

// Third-party libraries
#include <ezLED.h>

// LED timing constants - can be configured at compile time
#ifndef LED_FAST_BLINK_DURATION
#define LED_FAST_BLINK_DURATION 250
#endif

#ifndef LED_SLOW_BLINK_DURATION
#define LED_SLOW_BLINK_DURATION 500
#endif

class LEDController final
{
public:
  enum State : uint_fast8_t
  {
    LOCKED,
    FORMATTING,
    RESETTING_BLUETOOTH,
    CONNECTING,
    PRESSING,
    UNLOCKED
  };

  LEDController(const uint8_t greenLEDPin,
                const uint8_t redLEDPin);

  State state() const;

  void setState(const State state);

  void loop();

private:
  ezLED m_greenLED;

  ezLED m_redLED;

  State m_state;
}; // end LEDController class

#endif