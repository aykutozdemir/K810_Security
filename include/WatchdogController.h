/**
 * @file WatchdogController.h
 * @brief Watchdog timer management for system monitoring and recovery.
 *
 * This file defines the WatchdogController class, which provides functionality for
 * controlling the AVR watchdog timer to detect and recover from system hangs,
 * as well as tracking reset reasons.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#pragma once

#include <Arduino.h>
#include <avr/wdt.h>

/**
 * @brief Singleton class to manage the microcontroller's watchdog timer.
 *
 * This class provides a safe interface to enable, disable, and interact with
 * the AVR watchdog timer. It also tracks the reason for the last microcontroller
 * reset and provides functionality for controlled resets.
 */
class WatchdogController
{
public:
  /**
   * @brief Enumeration of possible microcontroller reset reasons.
   */
  enum ResetReason : uint_fast8_t
  {
    POWER_ON_RESET, ///< Reset caused by power-on
    EXTERNAL_RESET, ///< Reset triggered by the external reset pin
    WATCHDOG_RESET, ///< Reset triggered by watchdog timeout
    SOFT_RESET      ///< Reset triggered by software
  };

  // Delete copy constructor and assignment operator to ensure singleton pattern
  WatchdogController(const WatchdogController &) = delete;
  WatchdogController &operator=(const WatchdogController &) = delete;

  /**
   * @brief Get the singleton instance of the WatchdogController.
   * @return Reference to the singleton WatchdogController instance.
   */
  static WatchdogController &getInstance()
  {
    static WatchdogController instance;
    return instance;
  }

  /**
   * @brief Enable the watchdog timer with a specified timeout.
   * @param timeout The watchdog timeout value (from predefined AVR WDT values).
   */
  void enable(const uint8_t timeout);

  /**
   * @brief Disable the watchdog timer.
   */
  void disable();

  /**
   * @brief Trigger a microcontroller reset via the watchdog.
   */
  void resetMCU();

  /**
   * @brief Reset the microcontroller for self-programming operations.
   */
  void resetMCUForSelfProgramming();

  /**
   * @brief Output the last reset reason to a stream.
   * @param stream The stream to output the reset reason to.
   */
  void printResetReason(Stream &stream) const;

  /**
   * @brief Periodically service the watchdog timer.
   *
   * This should be called regularly in the main program loop.
   */
  void loop();

private:
  /**
   * @brief Private constructor to enforce singleton pattern.
   */
  WatchdogController();

  /**
   * @brief Initialize the watchdog controller and determine reset reason.
   */
  void setup();

  ResetReason m_resetReason; ///< Stores the reason for the last reset
};

/**
 * @brief Global access to the WatchdogController singleton instance.
 */
#define watchdogController WatchdogController::getInstance()