#ifndef LEDCONTROLLER_H
#define LEDCONTROLLER_H

// Third-party libraries
#include <ezLED.h>

class LEDController final
{
public:
  enum State : uint_fast8_t
  {
    LOCKED,
    FORMATTING,
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