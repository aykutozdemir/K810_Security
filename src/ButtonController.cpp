// Project headers
#include "ButtonController.h"

ButtonController::ButtonController(const uint8_t buttonPin)
    : m_button(buttonPin), m_pressedTime(0), m_state(NO_PRESS)
{
  m_button.setDebounceTime(30);
} // end ButtonController

ButtonController::State ButtonController::state() const
{
  return m_state;
} // end state

bool ButtonController::isPressing() const
{
  return m_button.getState() == LOW;
}

bool ButtonController::isPressingRaw() const
{
  return m_button.getStateRaw() == LOW;
}

void ButtonController::loop()
{
  m_button.loop();

  if (m_button.isPressed())
  {
    m_pressedTime = millis() & 0xFFFF;
    m_state = NO_PRESS;
  }
  else if (m_button.isReleased())
  {
    uint16_t currentTime = millis() & 0xFFFF;
    uint16_t pressedDuration = currentTime - m_pressedTime;

    m_state = pressedDuration >= 10000 ? VERY_LONG_PRESS : pressedDuration >= 3000 ? LONG_PRESS
                                                                                   : SHORT_PRESS;
  }
  else
  {
    m_state = NO_PRESS;
  }
} // end loop