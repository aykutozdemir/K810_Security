#ifndef WATCHDOGCONTROLLER_H
#define WATCHDOGCONTROLLER_H

#include <avr/wdt.h>

class WatchdogController final
{
public:
  void enable(const uint8_t timeout);

  void disable();

  void resetMCU();

  void resetMCUForSelfProgramming();

  void printResetReason(Stream &stream);

  void loop();
}; // end WatchdogController class

#endif