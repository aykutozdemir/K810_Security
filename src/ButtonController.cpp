/**
 * @file ButtonController.cpp
 * @brief Implementation of the button input handling class.
 *
 * This file contains the implementation of the ButtonController class methods,
 * which handle button input with duration-based detection of different press types.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

// Project headers
#include "ButtonController.h"

/**
 * @brief Constructor for the ButtonController class.
 *
 * @param buttonPin The pin connected to the button.
 *
 * Initializes the button controller with the specified pin,
 * configures debounce time, and sets initial state.
 */
ButtonController::ButtonController(const uint8_t buttonPin)
    : m_button(buttonPin), m_pressedTime(0), m_state(NO_PRESS)
{
  m_button.setDebounceTime(DEBOUNCE_TIME);
} // end ButtonController

/**
 * @brief Get the current state of the button press.
 *
 * @return Current state (NO_PRESS, SHORT_PRESS, LONG_PRESS, or VERY_LONG_PRESS).
 *
 * Returns the current button press state, which indicates the type of press detected.
 */
ButtonController::State ButtonController::state() const
{
  return m_state;
} // end state

/**
 * @brief Check if the button is currently being pressed.
 *
 * @return True if the button is pressed, false otherwise.
 *
 * Returns the debounced state of the button, indicating whether it is currently pressed.
 */
bool ButtonController::isPressing() const
{
  return m_button.getState() == LOW;
}

/**
 * @brief Get the raw button state without debouncing.
 *
 * @return True if the button is pressed, false otherwise.
 *
 * Returns the raw (non-debounced) state of the button for time-sensitive operations.
 */
bool ButtonController::isPressingRaw() const
{
  return m_button.getStateRaw() == LOW;
}

/**
 * @brief Update button state and detect press durations.
 *
 * This method should be called regularly in the main program loop to update
 * the button state and detect the type of press based on its duration.
 * It handles the logic for categorizing presses as short, long, or very long.
 */
void ButtonController::loop()
{
  m_button.loop();

  if (m_button.isPressed())
  {
    // Button was just pressed, record the time and reset state
    m_pressedTime = millis() & 0xFFFF;
    m_state = NO_PRESS;
  }
  else if (m_button.isReleased())
  {
    // Button was just released, calculate the press duration and determine type
    const uint16_t currentTime = millis() & 0xFFFF;
    const uint16_t pressedDuration = currentTime - m_pressedTime;

    m_state = pressedDuration >= VERY_LONG_PRESS_DURATION ? VERY_LONG_PRESS
              : pressedDuration >= LONG_PRESS_DURATION    ? LONG_PRESS
                                                          : SHORT_PRESS;
  }
  else
  {
    // No change in button state
    m_state = NO_PRESS;
  }
} // end loop