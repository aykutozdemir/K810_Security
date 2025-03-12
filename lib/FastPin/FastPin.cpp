/**
 * @file FastPin.cpp
 * @brief Implementation of the FastPin class.
 *
 * This file contains the implementation of the FastPin class methods for high-performance
 * digital pin operations. It provides optimized read/write operations using direct port
 * manipulation.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#include "FastPin.h"

FastPin::FastPin(const uint8_t pin, const bool isOutput, const bool pullup)
{
  uint8_t portNum = digitalPinToPort(pin);
  bitMask = digitalPinToBitMask(pin);
  port = portOutputRegister(portNum);
  pinReg = portInputRegister(portNum);
  volatile uint8_t *ddr = portModeRegister(portNum);

  if (isOutput)
  {
    *ddr |= bitMask; // Set as output
  }
  else
  {
    *ddr &= ~bitMask;                                      // Set as input
    *port = (pullup ? *port | bitMask : *port & ~bitMask); // Set pullup in one operation
  }
}
