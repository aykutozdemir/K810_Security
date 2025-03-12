/**
 * @file Statistic.cpp
 * @brief Implementation of the Statistic class.
 *
 * This file contains the implementation of the Statistic class methods for
 * measuring and tracking execution times in Arduino applications.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "Statistic.h"
#include <limits.h>

/**
 * @brief Constructor that initializes the statistics object.
 *
 * Initializes the object by calling reset() to set all statistics to their
 * initial values.
 */
Statistic::Statistic()
{
    reset();
}

/**
 * @brief Resets all collected statistics.
 *
 * Sets name to nullptr, startTime to 0, minTime to maximum possible value,
 * maxTime to 0, and average to 0.
 */
void Statistic::reset()
{
    name = nullptr;
    startTime = 0;
    minTime = UINT16_MAX;
    maxTime = 0;
    average = 0;
}

/**
 * @brief Sets a name for this statistic.
 *
 * @param n The name stored in program memory.
 */
void Statistic::setName(const __FlashStringHelper *n)
{
    name = n;
}

/**
 * @brief Marks the start of a timing measurement.
 *
 * Records the current time (lower 16 bits of micros()) as the start time.
 */
void Statistic::start()
{
    startTime = (uint16_t)micros(); // Store lower 16 bits
}

/**
 * @brief Marks the end of a timing measurement and updates statistics.
 *
 * Calculates the elapsed time, handles timer wraparound, and updates the
 * minimum, maximum, and average statistics.
 */
void Statistic::end()
{
    uint16_t currentTime = (uint16_t)micros();
    uint16_t elapsed;

    // Handle timer wraparound
    if (currentTime >= startTime)
    {
        elapsed = currentTime - startTime;
    }
    else
    {
        elapsed = UINT16_MAX - startTime + currentTime + 1;
    }

    // Update statistics
    if (elapsed < minTime)
        minTime = elapsed;
    if (elapsed > maxTime)
        maxTime = elapsed;

    // Exponential moving average calculation
    average = average - (average >> ALPHA) + (elapsed >> ALPHA);
}

/**
 * @brief Prints collected statistics to the specified output.
 *
 * Outputs the name (or "?" if not set) followed by the minimum, average,
 * and maximum times in microseconds.
 *
 * @param print The Print object to use for output (e.g., Serial).
 */
void Statistic::print(Print &print) const
{
    print.print(name ? name : F("?"));
    print.print(':');
    print.print(minTime);
    print.print('/');
    print.print(average);
    print.print('/');
    print.print(maxTime);
    print.println(F(" us"));
}
