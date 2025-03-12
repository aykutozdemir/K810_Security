/**
 * @file WatchdogController.cpp
 * @brief Implementation of the watchdog timer management class.
 *
 * This file contains the implementation of the WatchdogController class methods,
 * which manage the AVR watchdog timer for system monitoring and recovery.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

// Arduino core
#include <USBAPI.h>

// Third-party libraries
#include <SafeInterrupts.h>

// Project headers
#include "WatchdogController.h"
#include "Utilities.h"
#include "Globals.h"

// Make these static since they're only used internally
/// Magic value written to the boot key memory location to identify a software reset
static constexpr uint16_t BOOT_KEY_VALUE = 0x7777;
/// Value stored in resetReason to identify a watchdog reset
static constexpr uint8_t WDT_RESET_REASON_VALUE = 0x88;
/// Value stored in resetReason to identify an external reset
static constexpr uint8_t EXTERNAL_RESET_REASON_VALUE = 0x44;
/// Value stored in resetReason to identify a software reset
static constexpr uint8_t SOFT_RESET_REASON_VALUE = 0x22;
/// Pointer to a memory location used to detect software resets
volatile uint16_t *const bootKeyPtr = (volatile uint16_t *)0x0800;
/// Variable to store the reset reason across resets (placed in non-initialized memory)
volatile uint8_t resetReason __attribute__((section(".noinit")));

/**
 * @brief Constructor for the WatchdogController class.
 *
 * Initializes the controller with a default reset reason of POWER_ON_RESET
 * and calls setup() to determine the actual reset reason.
 */
WatchdogController::WatchdogController()
    : m_resetReason(ResetReason::POWER_ON_RESET)
{
  setup();
}

/**
 * @brief Initialize the watchdog controller and determine the reset reason.
 *
 * Reads the resetReason value from non-initialized memory to determine why
 * the microcontroller was reset, and sets the internal state accordingly.
 * Also initializes resetReason for the next reset detection.
 */
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
  else if (currentReason == SOFT_RESET_REASON_VALUE)
  {
    m_resetReason = ResetReason::SOFT_RESET;
  }
  else
  {
    m_resetReason = ResetReason::POWER_ON_RESET;
  }
}

/**
 * @brief Enable the watchdog timer with the specified timeout.
 *
 * @param timeout The watchdog timeout value (from predefined AVR WDT values).
 *
 * Configures the watchdog timer with the specified timeout value.
 * The watchdog will reset the microcontroller if not serviced within
 * the specified timeout period.
 */
void WatchdogController::enable(const uint8_t timeout)
{
  SafeInterrupts::ScopedDisable scopedDisable;

  wdt_reset();

  const volatile uint8_t firstValue = WDTCSR | (1 << WDCE) | (1 << WDE);
  const volatile uint8_t secondValue = (1 << WDIE) | (1 << WDE) | timeout;

  WDTCSR = firstValue;
  WDTCSR = secondValue;
}

/**
 * @brief Disable the watchdog timer.
 *
 * Disables the watchdog timer to prevent it from resetting the microcontroller.
 */
void WatchdogController::disable()
{
  SafeInterrupts::ScopedDisable scopedDisable;

  wdt_disable();
}

/**
 * @brief Reset the microcontroller using the watchdog timer.
 *
 * Sets up for a watchdog-triggered reset by setting the appropriate
 * reset reason value, enabling the watchdog with a short timeout,
 * and then enters an infinite loop to wait for the reset.
 */
void WatchdogController::resetMCU()
{
  disable();

  resetReason = SOFT_RESET_REASON_VALUE;

  enable(WDTO_15MS);
  while (1)
    ;
}

/**
 * @brief Reset the microcontroller for self-programming operations.
 *
 * Sets up for a special reset that's recognized by the bootloader for
 * self-programming operations. Sets the boot key value and the reset reason,
 * then triggers a watchdog reset.
 */
void WatchdogController::resetMCUForSelfProgramming()
{
  disable();

  *bootKeyPtr = BOOT_KEY_VALUE;
  resetReason = SOFT_RESET_REASON_VALUE;

  USBDevice.detach();
  resetMCU();
}

/**
 * @brief Print the last reset reason to the provided stream.
 *
 * @param stream The stream to output the reset reason to.
 *
 * Outputs a human-readable description of the last reset reason
 * to the provided stream.
 */
void WatchdogController::printResetReason(Stream &stream) const
{
  Utilities::printStars(stream);

  stream.print(F("Reset: "));
  switch (m_resetReason)
  {
  case ResetReason::POWER_ON_RESET:
    stream.println(F("Power-on"));
    break;
  case ResetReason::EXTERNAL_RESET:
    stream.println(F("External"));
    break;
  case ResetReason::WATCHDOG_RESET:
    stream.println(F("WDT"));
    break;
  case ResetReason::SOFT_RESET:
    stream.println(F("Soft"));
    break;
  }

  Utilities::printStars(stream);
}

/**
 * @brief Service the watchdog timer to prevent system reset.
 *
 * This method should be called regularly in the main program loop
 * to prevent the watchdog from triggering a system reset.
 */
void WatchdogController::loop()
{
  wdt_reset();
}

/**
 * @brief Watchdog Timer Interrupt Service Routine.
 *
 * This ISR is called when the watchdog timer triggers an interrupt.
 * It resets the watchdog counter and sets the reset reason to indicate
 * that a watchdog reset occurred.
 */
ISR(WDT_vect)
{
  wdt_reset();
  resetReason = WDT_RESET_REASON_VALUE;
}