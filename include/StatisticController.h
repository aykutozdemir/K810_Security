/**
 * @file StatisticController.h
 * @brief Performance statistics management for monitoring.
 *
 * This file defines the StatisticController class, which provides functionality for
 * collecting, managing, and displaying performance statistics and memory usage information.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef STATISTICCONTROLLER_H
#define STATISTICCONTROLLER_H

#include <Arduino.h>
#include <SimpleTimer.h>
#include <Statistic.h>

/**
 * @brief Class for managing and displaying performance statistics.
 *
 * This class provides functionality for collecting, managing, and displaying
 * performance statistics and memory usage information at regular intervals.
 */
class StatisticController final
{
public:
  /**
   * @brief Initialize the statistics controller.
   */
  void setup();

  /**
   * @brief Periodically update and display statistics.
   *
   * This method should be called regularly in the main program loop to
   * update statistics and display them at defined intervals.
   *
   * @param print The output stream to display statistics on.
   */
  void loop(Print &print);

  /**
   * @brief Display a formatted table of statistics.
   *
   * @param print The output stream to display the table on.
   * @param statistics Array of Statistic pointers to display.
   * @param statisticSize Number of statistics in the array.
   */
  void printStatisticTable(Print &print,
                           const Statistic *statistics[],
                           const uint8_t statisticSize) const;

  /**
   * @brief Display RAM usage information.
   *
   * @param print The output stream to display RAM information on.
   */
  void printRam(Print &print) const;
}; // end StatisticController class

#endif