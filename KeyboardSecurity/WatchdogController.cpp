#include "WatchdogController.h"

WatchdogController::WatchdogController()
{

} // end WatchdogController

void WatchdogController::enable(const uint8_t timeout)
{
  wdt_disable();
  wdt_enable(timeout);
} // end enable

void WatchdogController::disable()
{
  wdt_disable();
} // end disable

void WatchdogController::loop()
{
  wdt_reset();
} // end loop