// Project headers
#include "LEDController.h"

LEDController::LEDController(const uint8_t greenLEDPin,
                             const uint8_t redLEDPin)
    : m_greenLED(greenLEDPin), m_redLED(redLEDPin), m_state(LOCKED)
{
  m_greenLED.turnOFF();
  m_redLED.turnON();
} // end LEDController

LEDController::State LEDController::state() const
{
  return m_state;
} // end state

void LEDController::setState(const State state)
{
  if (state != m_state)
  {
    m_state = state;

    switch (m_state)
    {
    case LOCKED:
    {
      m_greenLED.turnOFF();
      m_redLED.turnON();
    }
    break;

    case FORMATTING:
    {
      m_greenLED.turnOFF();
      m_redLED.blink(250, 250);
    }
    break;

    case CONNECTING:
    case PRESSING:
    {
      m_greenLED.turnOFF();
      m_redLED.blink(500, 500);
    }
    break;

    case UNLOCKED:
    {
      m_greenLED.turnON();
      m_redLED.turnOFF();
    }
    break;
    } // end switch
  } // end if
} // end setState

void LEDController::loop()
{
  m_greenLED.loop();
  m_redLED.loop();
} // end loop