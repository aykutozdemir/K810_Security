#include "WatchdogController.h"
#include <SafeInterrupts.h>
#include <USBAPI.h>
#include <avr/wdt.h>

constexpr uint16_t BOOT_KEY_VALUE = 0x7777;
volatile uint16_t *const __attribute__((section(".noinit"))) bootKeyPtr = (volatile uint16_t *)0x0800;

WatchdogController::WatchdogController() {
  // Constructor can remain empty or initialize variables if needed
}  // end WatchdogController

void WatchdogController::enable(const uint8_t timeout) {
  wdt_disable();
  wdt_enable(timeout);
}  // end enable

void WatchdogController::disable() {
  wdt_disable();
}  // end disable

void WatchdogController::resetMCU() {
  SafeInterrupts::disable();

  wdt_enable(WDTO_15MS);

  while (1)
    ;
}

void WatchdogController::resetMCUForSelfProgramming() {
  *bootKeyPtr = BOOT_KEY_VALUE;
  USBDevice.detach();
  resetMCU();
}

void WatchdogController::loop() {
  wdt_reset();
}  // end loop