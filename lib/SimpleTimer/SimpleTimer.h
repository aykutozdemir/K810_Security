/**
 * @file SimpleTimer.h
 * @brief A simple timer utility for Arduino.
 *
 * This file defines the SimpleTimer class, which provides a simple, efficient
 * way to manage timing operations in Arduino applications. It supports
 * customizable time intervals and various timer types.
 *
 * @author Kirill Yanenko (kiryanenko)
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef LED_LIGHTING_SIMPLETIMER_H
#define LED_LIGHTING_SIMPLETIMER_H

#include <Arduino.h>

/**
 * @brief Simple timer utility for managing timing operations.
 *
 * This class provides a lightweight timer implementation for Arduino,
 * allowing scheduled operations based on time intervals. The timer uses
 * the Arduino millis() function for timing calculations.
 *
 * @tparam TimeType The numeric type to use for time storage, defaults to unsigned long.
 */
template <typename TimeType = unsigned long>
class SimpleTimer
{
    TimeType _start;    ///< Start time of the timer in milliseconds
    TimeType _interval; ///< Timer interval in milliseconds

public:
    /**
     * @brief Constructor that initializes the timer.
     *
     * Creates a timer with the specified interval and starts it immediately.
     *
     * @param interval Timer interval in milliseconds, defaults to 0.
     */
    explicit SimpleTimer(const TimeType interval = 0) : _start(millis()), _interval(interval) {}

    /**
     * @brief Checks if the timer is enabled.
     *
     * @return true if the timer is enabled, false otherwise.
     */
    inline bool isEnabled() const { return _interval > 0; }

    /**
     * @brief Checks if the timer interval has elapsed.
     *
     * @return true if the timer interval has elapsed, false otherwise.
     */
    inline bool isReady() const { return (TimeType)(millis() - _start) >= _interval; }

    /**
     * @brief Sets a new time interval.
     *
     * @param interval New timer interval in milliseconds.
     */
    inline void setInterval(const TimeType interval) { _interval = interval; }

    /**
     * @brief Gets the current time interval.
     *
     * @return The current timer interval in milliseconds.
     */
    inline TimeType getInterval() const { return _interval; }

    /**
     * @brief Resets the timer.
     *
     * Resets the start time to the current time, effectively restarting the timer.
     */
    inline void reset() { _start = millis(); }
};

#endif // LED_LIGHTING_SIMPLETIMER_H
