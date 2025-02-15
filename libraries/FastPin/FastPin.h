#ifndef FASTPIN_H
#define FASTPIN_H

#include <Arduino.h>

class FastPin {
public:
  FastPin(const uint8_t pin, const bool isOutput, const bool pullup = false);

  inline void high() {
    *port |= bitMask;
  }

  inline void low() {
    *port &= ~bitMask;
  }

  inline void toggle() {
    *port ^= bitMask;
  }

  inline void set(const uint8_t value) {
    if (value) {
      high();
    } else {
      low();
    }
  }

  inline uint8_t read() {
    return (*pinReg & bitMask) ? 1 : 0;
  }

private:
  volatile uint8_t *port;
  volatile uint8_t *pinReg;
  uint8_t bitMask;
};

#endif  // FASTPIN_H
