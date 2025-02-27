#ifndef FASTPIN_H
#define FASTPIN_H

#include <Arduino.h>

class FastPin
{
public:
  FastPin(const uint8_t pin, const bool isOutput, const bool pullup = false);

  // Make these static inline to reduce code size
  static inline void high(volatile uint8_t *port, const uint8_t bitMask)
  {
    *port |= bitMask;
  }

  static inline void low(volatile uint8_t *port, const uint8_t bitMask)
  {
    *port &= ~bitMask;
  }

  static inline void toggle(volatile uint8_t *port, const uint8_t bitMask)
  {
    *port ^= bitMask;
  }

  // Use direct port manipulation for fastest possible read
  static inline uint8_t read(volatile uint8_t *pinReg, const uint8_t bitMask)
  {
    return (*pinReg & bitMask) ? 1 : 0;
  }

  // Make set static and use direct port manipulation
  static inline void set(volatile uint8_t *port, const uint8_t bitMask, const uint8_t value)
  {
    if (value)
      high(port, bitMask);
    else
      low(port, bitMask);
  }

  // Wrapper methods that use the instance variables
  inline void high() const { high(port, bitMask); }
  inline void low() const { low(port, bitMask); }
  inline void toggle() const { toggle(port, bitMask); }
  inline void set(const uint8_t value) const { set(port, bitMask, value); }
  inline uint8_t read() const { return read(pinReg, bitMask); }

private:
  volatile uint8_t *port;
  volatile uint8_t *pinReg;
  uint8_t bitMask;
};

#endif // FASTPIN_H
