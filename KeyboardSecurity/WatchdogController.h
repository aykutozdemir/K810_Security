#ifndef WATCHDOGCONTROLLER_H
#define WATCHDOGCONTROLLER_H

#include <avr/wdt.h>

class WatchdogController final
{
public:
  WatchdogController();

  void enable(const uint8_t timeout);

  void disable();

  void loop();
}; // end WatchdogController class

#endif