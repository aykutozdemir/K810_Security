/**
 * @file LEDController.h
 * @brief LED indicator management for system status display.
 *
 * This file defines the LEDController class, which provides functionality for
 * controlling LED indicators to display various system states through different
 * blinking patterns.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef LEDCONTROLLER_H
#define LEDCONTROLLER_H

// Third-party libraries
#include <ezLED.h>

/// Duration in milliseconds for fast LED blinking
#ifndef LED_FAST_BLINK_DURATION
#define LED_FAST_BLINK_DURATION 250
#endif

/// Duration in milliseconds for slow LED blinking
#ifndef LED_SLOW_BLINK_DURATION
#define LED_SLOW_BLINK_DURATION 500
#endif

/**
 * @brief Class for managing LED indicators to show system state.
 *
 * This class controls green and red LEDs to indicate various system states
 * through different blinking patterns and colors. It uses the ezLED library
 * for efficient LED control.
 */
class LEDController final
{
public:
  /**
   * @brief Enumeration of possible system states to display.
   */
  enum State : uint_fast8_t
  {
    LOCKED,              ///< System is locked - typically solid red
    FORMATTING,          ///< EEPROM formatting in progress - typically blinking red
    RESETTING_BLUETOOTH, ///< Bluetooth reset in progress - typically alternating pattern
    CONNECTING,          ///< Connecting to a device - typically blinking green
    PRESSING,            ///< Button press detected - typically solid green
    UNLOCKED             ///< System is unlocked - typically solid green
  };

  /**
   * @brief Constructor that initializes the LED controller.
   * @param greenLEDPin The pin connected to the green LED.
   * @param redLEDPin The pin connected to the red LED.
   */
  LEDController(const uint8_t greenLEDPin,
                const uint8_t redLEDPin);

  /**
   * @brief Get the current state being displayed by the LEDs.
   * @return Current state enum value.
   */
  State state() const;

  /**
   * @brief Set a new state to be displayed by the LEDs.
   * @param state The new state to display.
   */
  void setState(const State state);

  /**
   * @brief Update LED patterns based on the current state.
   *
   * This should be called regularly in the main program loop to
   * maintain LED blinking patterns.
   */
  void loop();

private:
  ezLED m_greenLED; ///< Green LED controller
  ezLED m_redLED;   ///< Red LED controller
  State m_state;    ///< Current display state
}; // end LEDController class

#endif