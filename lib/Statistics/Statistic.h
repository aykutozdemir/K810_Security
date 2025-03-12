/**
 * @file Statistic.h
 * @brief Simple statistics collection utility for timing measurements.
 *
 * This file defines the Statistic class, which provides functionality for
 * measuring and tracking execution times in Arduino applications. It can be
 * used for performance profiling, benchmarking, and optimization.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef STATISTIC_H
#define STATISTIC_H

#include <Arduino.h>

/**
 * @brief Class for collecting timing statistics.
 *
 * This class provides functionality to measure execution times and track
 * minimum, maximum, and average times. It uses an exponential moving average
 * for the average calculation to minimize memory usage.
 */
class Statistic
{
public:
  /**
   * @brief Constructor that initializes the statistics object.
   */
  Statistic();

  /**
   * @brief Sets a name for this statistic.
   *
   * @param n The name stored in program memory.
   */
  void setName(const __FlashStringHelper *n);

  /**
   * @brief Resets all collected statistics.
   */
  void reset();

  /**
   * @brief Marks the start of a timing measurement.
   */
  void start();

  /**
   * @brief Marks the end of a timing measurement and updates statistics.
   */
  void end();

  /**
   * @brief Prints collected statistics to the specified output.
   *
   * @param print The Print object to use for output (e.g., Serial).
   */
  void print(Print &print) const;

private:
  const __FlashStringHelper *name; ///< Name of this statistic
  uint16_t startTime;              ///< Start time in microseconds (lower 16 bits of micros())
  uint16_t minTime;                ///< Minimum measured time in microseconds
  uint16_t maxTime;                ///< Maximum measured time in microseconds
  uint16_t average;                ///< Exponential moving average in microseconds
  static const uint8_t ALPHA = 4;  ///< Weight for new samples (1/16) in EMA calculation
};

/**
 * @brief Macro for measuring execution time of a code block.
 *
 * This macro creates a scope where the execution time is measured using
 * the provided Statistic object. It's designed to be used in a for-loop pattern.
 *
 * @param obj The Statistic object to use for measurement.
 */
#define MEASURE_TIME(obj) for (bool _run = (obj.start(), true); _run; _run = false, obj.end())

#endif // STATISTIC_H
