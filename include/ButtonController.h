/**
 * @file ButtonController.h
 * @brief Button input handling with duration detection.
 *
 * This file defines the ButtonController class, which provides functionality for
 * detecting button presses and classifying them by duration (short, long, very long).
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef __BUTTONCONTROLLER_H__
#define __BUTTONCONTROLLER_H__

// Third-party libraries
#include <ezButton.h>

/// Duration in milliseconds for a very long button press
constexpr uint16_t VERY_LONG_PRESS_DURATION = 10000;
/// Duration in milliseconds for a long button press
constexpr uint16_t LONG_PRESS_DURATION = 3000;
/// Debounce time in milliseconds to eliminate button noise
constexpr uint8_t DEBOUNCE_TIME = 30;

/**
 * @brief Class for handling button input with duration detection.
 *
 * This class provides functionality to detect different types of button presses
 * based on their duration. It handles debouncing internally and categorizes
 * presses as short, long, or very long.
 */
class ButtonController final
{
public:
  /**
   * @brief Enumeration of possible button press states.
   */
  enum State : uint_fast8_t
  {
    NO_PRESS,       ///< No button press detected
    SHORT_PRESS,    ///< Short press detected (less than LONG_PRESS_DURATION)
    LONG_PRESS,     ///< Long press detected (more than LONG_PRESS_DURATION)
    VERY_LONG_PRESS ///< Very long press detected (more than VERY_LONG_PRESS_DURATION)
  };

  /**
   * @brief Constructor that initializes the button controller.
   * @param buttonPin The pin connected to the button.
   */
  explicit ButtonController(const uint8_t buttonPin);

  /**
   * @brief Check if the button is currently being pressed.
   * @return True if the button is pressed, false otherwise.
   */
  bool isPressing() const;

  /**
   * @brief Get the raw button state without debouncing.
   * @return True if the button is pressed, false otherwise.
   */
  bool isPressingRaw() const;

  /**
   * @brief Get the current state of the button press.
   * @return Current state (NO_PRESS, SHORT_PRESS, LONG_PRESS, or VERY_LONG_PRESS).
   */
  State state() const;

  /**
   * @brief Update button state and detect press durations.
   *
   * This should be called regularly in the main program loop.
   */
  void loop();

private:
  ezButton m_button;      ///< Button instance from ezButton library
  uint16_t m_pressedTime; ///< Duration of the current press in milliseconds
  State m_state;          ///< Current state of the button press
}; // end ButtonController class

#endif // __BUTTONCONTROLLER_H__