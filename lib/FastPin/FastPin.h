#ifndef FASTPIN_H
#define FASTPIN_H

#include <Arduino.h>

class FastPin
{
public:
  FastPin(const uint8_t pin, const bool isOutput, const bool pullup = false);

  // Make these static inline to reduce code size
  static inline void high(volatile uint8_t* port, const uint8_t bitMask)
  {
    *port |= bitMask;
  }

  static inline void low(volatile uint8_t* port, const uint8_t bitMask)
  {
    *port &= ~bitMask;
  }

  static inline void toggle(volatile uint8_t* port, const uint8_t bitMask)
  {
    *port ^= bitMask;
  }

  // Wrapper methods that use the instance variables
  inline void high() const { high(port, bitMask); }
  inline void low() const { low(port, bitMask); }
  inline void toggle() const { toggle(port, bitMask); }

  inline void set(const uint8_t value) const
  {
    if (value)
      high();
    else
      low();
  }

  inline uint8_t read() const
  {
    return (*pinReg & bitMask) ? 1 : 0;
  }

private:
  volatile uint8_t *port;
  volatile uint8_t *pinReg;
  uint8_t bitMask;
};

#endif // FASTPIN_H
