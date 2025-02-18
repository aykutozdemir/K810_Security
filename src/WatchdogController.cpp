// Arduino core
#include <USBAPI.h>
#include <avr/wdt.h>

// Third-party libraries
#include <SafeInterrupts.h>

// Project headers
#include "WatchdogController.h"
#include "MemoryUsage.h"
constexpr uint16_t BOOT_KEY_VALUE = 0x7777;
volatile uint16_t *const __attribute__((section(".noinit"))) bootKeyPtr = (volatile uint16_t *)0x0800;

void WatchdogController::enable(const uint8_t timeout)
{
  wdt_disable();
  wdt_enable(timeout);
} // end enable

void WatchdogController::disable()
{
  wdt_disable();
} // end disable

void WatchdogController::resetMCU()
{
  SafeInterrupts::disable();

  wdt_enable(WDTO_15MS);

  while (1)
    ;
}

void WatchdogController::resetMCUForSelfProgramming()
{
  *bootKeyPtr = BOOT_KEY_VALUE;
  USBDevice.detach();
  resetMCU();
}

void WatchdogController::printResetReason(Stream &stream)
{
  uint8_t mcusr = MCUSR;
  MCUSR = 0;

	MemoryUsage::printStars(stream);
  stream.print(F("Reset Reason: "));
  if (mcusr & (1 << PORF))
  {
    stream.println(F("Power-on Reset"));
  }
  if (mcusr & (1 << EXTRF))
  {
    stream.println(F("External Reset"));
  }
  if (mcusr & (1 << BORF))
  {
    stream.println(F("Brown-out Reset"));
  }
  if (mcusr & (1 << WDRF))
  {
    stream.println(F("Watchdog Reset"));
  }
  if (mcusr & (1 << JTRF))
  {
    stream.println(F("JTAG Reset"));
  }
  if (mcusr == 0)
  {
    stream.println(F("Initial Power-on"));
  }
  MemoryUsage::printStars(stream);
}

void WatchdogController::loop()
{
  wdt_reset();
} // end loop