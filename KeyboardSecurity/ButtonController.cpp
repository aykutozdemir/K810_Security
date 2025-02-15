#include "ButtonController.h"

ButtonController::ButtonController(const uint8_t buttonPin)
  : m_button(buttonPin), m_pressedTime(0L), m_state(NO_PRESS) {
  m_button.setDebounceTime(30);
}  // end ButtonController

ButtonController::State ButtonController::state() const {
  return m_state;
}  // end state

bool ButtonController::isPressing() const {
  return m_button.getState() == LOW;
}

void ButtonController::loop() {
  m_button.loop();

  if (m_button.isPressed()) {
    m_pressedTime = millis();
  }  // end if
  else if (m_button.isReleased()) {
    const unsigned long pressDuration = millis() - m_pressedTime;

    if (pressDuration >= 10000) {
      m_state = VERY_LONG_PRESS;
    }  // end if
    else if (pressDuration >= 3000) {
      m_state = LONG_PRESS;
    }  // end else
    else {
      m_state = SHORT_PRESS;
    }
  }  // end else if
  else {
    m_state = NO_PRESS;
  }  // end else
}  // end loop
