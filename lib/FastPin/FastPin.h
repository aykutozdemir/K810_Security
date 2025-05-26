/**
 * @file FastPin.h
 * @brief Fast digital pin manipulation for Arduino.
 *
 * This file defines the FastPin class, which provides high-performance digital pin
 * operations for Arduino. It uses direct port manipulation for faster read/write
 * operations compared to standard Arduino digital I/O functions.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef FASTPIN_H
#define FASTPIN_H

#include <Arduino.h>

/**
 * @brief Class for fast digital pin operations using direct port manipulation
 *
 * FastPin provides high-performance pin operations by using direct port register access
 * instead of the standard Arduino digitalWrite/digitalRead functions.
 */
class FastPin
{
public:
  /**
   * @brief Constructs a FastPin object
   *
   * @param pin Arduino pin number
   * @param isOutput Whether the pin should be configured as output
   * @param pullup Whether to enable internal pull-up resistor (for input pins)
   */
  FastPin(const uint8_t pin, const bool isOutput, const bool pullup = false);

  /**
   * @brief Sets a pin to HIGH state using direct port manipulation
   *
   * @param port Pointer to the port output register
   * @param bitMask Bit mask for the specific pin
   */
  static inline void high(volatile uint8_t *const port, const uint8_t bitMask)
  {
    *port |= bitMask;
  }

  /**
   * @brief Sets a pin to LOW state using direct port manipulation
   *
   * @param port Pointer to the port output register
   * @param bitMask Bit mask for the specific pin
   */
  static inline void low(volatile uint8_t *const port, const uint8_t bitMask)
  {
    *port &= ~bitMask;
  }

  /**
   * @brief Toggles a pin's state using direct port manipulation
   *
   * @param port Pointer to the port output register
   * @param bitMask Bit mask for the specific pin
   */
  static inline void toggle(volatile uint8_t *const port, const uint8_t bitMask)
  {
    *port ^= bitMask;
  }

  /**
   * @brief Reads a pin's state using direct port manipulation
   *
   * @param pinReg Pointer to the port input register
   * @param bitMask Bit mask for the specific pin
   * @return uint8_t 1 if the pin is HIGH, 0 if the pin is LOW
   */
  static inline uint8_t read(volatile const uint8_t *const pinReg, const uint8_t bitMask)
  {
    return (*pinReg & bitMask) ? 1 : 0;
  }

  /**
   * @brief Sets a pin to a specific state using direct port manipulation
   *
   * @param port Pointer to the port output register
   * @param bitMask Bit mask for the specific pin
   * @param value The value to set (0 for LOW, non-zero for HIGH)
   */
  static inline void set(volatile uint8_t *const port, const uint8_t bitMask, const uint8_t value)
  {
    if (value)
      high(port, bitMask);
    else
      low(port, bitMask);
  }

  /**
   * @brief Sets this pin to HIGH state
   */
  inline void high() const { high(port, bitMask); }

  /**
   * @brief Sets this pin to LOW state
   */
  inline void low() const { low(port, bitMask); }

  /**
   * @brief Toggles this pin's state
   */
  inline void toggle() const { toggle(port, bitMask); }

  /**
   * @brief Sets this pin to a specific state
   *
   * @param value The value to set (0 for LOW, non-zero for HIGH)
   */
  inline void set(const uint8_t value) const { set(port, bitMask, value); }

  /**
   * @brief Reads this pin's current state
   *
   * @return uint8_t 1 if the pin is HIGH, 0 if the pin is LOW
   */
  inline uint8_t read() const { return read(pinReg, bitMask); }

  /**
   * @brief Changes the pin mode (input/output) and optionally configures pull-up
   * 
   * @param isOutput Whether to set the pin as output (true) or input (false)
   * @param pullup Whether to enable internal pull-up resistor (for input pins)
   */
  void setMode(const bool isOutput, const bool pullup = false);

private:
  volatile uint8_t *port;   ///< Pointer to the port output register
  volatile uint8_t *pinReg; ///< Pointer to the port input register
  volatile uint8_t *ddr;    ///< Pointer to the port direction register
  uint8_t bitMask;          ///< Bit mask for this pin
};

#endif // FASTPIN_H
