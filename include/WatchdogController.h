#pragma once

#include <Arduino.h>
#include <avr/wdt.h>

class WatchdogController
{
public:
  enum ResetReason : uint_fast8_t
  {
    POWER_ON_RESET,
    EXTERNAL_RESET,
    WATCHDOG_RESET
  };

  WatchdogController(const WatchdogController &) = delete;
  WatchdogController &operator=(const WatchdogController &) = delete;

  static WatchdogController &getInstance()
  {
    static WatchdogController instance;
    return instance;
  }

  void enable(const uint8_t timeout);
  void disable();
  void resetMCU();
  void resetMCUForSelfProgramming();
  void printResetReason(Stream &stream) const;
  void loop();

private:
  WatchdogController();
  void setup();

  ResetReason m_resetReason;
};

#define watchdogController WatchdogController::getInstance()