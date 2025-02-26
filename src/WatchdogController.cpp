// Arduino core
#include <USBAPI.h>

// Third-party libraries
#include <SafeInterrupts.h>

// Project headers
#include "WatchdogController.h"
#include "MemoryUsage.h"
#include "Globals.h"

// Make these static since they're only used internally
static constexpr uint16_t BOOT_KEY_VALUE = 0x7777;
static constexpr uint8_t WDT_RESET_REASON_VALUE = 0x88;
static constexpr uint8_t EXTERNAL_RESET_REASON_VALUE = 0x44;

volatile uint16_t *const bootKeyPtr = (volatile uint16_t *)0x0800;
volatile uint8_t resetReason __attribute__((section(".noinit")));

WatchdogController::WatchdogController()
    : m_resetReason(ResetReason::POWER_ON_RESET)
{
  setup();
}

void WatchdogController::setup()
{
  const uint8_t currentReason = resetReason;

  resetReason = EXTERNAL_RESET_REASON_VALUE;

  if (currentReason == WDT_RESET_REASON_VALUE)
  {
    m_resetReason = ResetReason::WATCHDOG_RESET;
  }
  else if (currentReason == EXTERNAL_RESET_REASON_VALUE)
  {
    m_resetReason = ResetReason::EXTERNAL_RESET;
  }
  else
  {
    m_resetReason = ResetReason::POWER_ON_RESET;
  }
}

void WatchdogController::enable(const uint8_t timeout)
{
  SafeInterrupts::ScopedDisable scopedDisable;

  wdt_reset();

  const volatile uint8_t firstValue = WDTCSR | (1 << WDCE) | (1 << WDE);
  const volatile uint8_t secondValue = (1 << WDIE) | (1 << WDE) | timeout;

  WDTCSR = firstValue;
  WDTCSR = secondValue;
}

void WatchdogController::disable()
{
  SafeInterrupts::ScopedDisable scopedDisable;

  wdt_disable();
}

void WatchdogController::resetMCU()
{
  enable(WDTO_15MS);

  while (1)
    ;
}

void WatchdogController::resetMCUForSelfProgramming()
{
  *bootKeyPtr = BOOT_KEY_VALUE;
  USBDevice.detach();
  resetMCU();
}

void WatchdogController::printResetReason(Stream &stream) const
{
  MemoryUsage::printStars(stream);

  stream.print(F("Reset Reason: "));
  switch (m_resetReason)
  {
  case ResetReason::POWER_ON_RESET:
    stream.println(F("Power-on Reset"));
    break;
  case ResetReason::EXTERNAL_RESET:
    stream.println(F("External Reset"));
    break;
  case ResetReason::WATCHDOG_RESET:
    stream.println(F("Watchdog Reset"));
    break;
  }

  MemoryUsage::printStars(stream);
}

void WatchdogController::loop()
{
  wdt_reset();
}

ISR(WDT_vect)
{
  wdt_reset();
  resetReason = WDT_RESET_REASON_VALUE;
}