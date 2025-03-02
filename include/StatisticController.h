#ifndef STATISTICCONTROLLER_H
#define STATISTICCONTROLLER_H

#include <Arduino.h>
#include <SimpleTimer.h>
#include <Statistic.h>

class StatisticController final
{
public:
  void setup();

  void loop(Print &print,
            const Statistic *statistics[],
            const uint8_t statisticSize);

  void printStatisticTable(Print &print,
                           const Statistic *statistics[],
                           const uint8_t statisticSize) const;

  void printRam(Print &print) const;
}; // end StatisticController class

#endif