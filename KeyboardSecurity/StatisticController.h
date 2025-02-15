#include "Print.h"
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
                           const uint8_t statisticSize);

  void printRam(Print &print);

  void printInterruptTable(Print &print);
}; // end StatisticController class

#endif