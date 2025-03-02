// Arduino core
#include <MemoryUsage.h>

// Project headers
#include "StatisticController.h"

void StatisticController::setup()
{
  MemoryUsage::stackPaint();
} // end setup

void StatisticController::loop(Print &print,
                               const Statistic *statistics[],
                               const uint8_t statisticSize)
{
  static bool firstRun = true;

  if (firstRun)
  {
    firstRun = false;

    printRam(print);
  }
} // end loop

void StatisticController::printStatisticTable(Print &print,
                                              const Statistic *statistics[],
                                              const uint8_t statisticSize) const
{
  MemoryUsage::printStars(print);
  for (uint8_t i = 0; i < statisticSize; ++i)
  {
    if (statistics[i] != nullptr)
    {
      statistics[i]->print(print);
      if ((i + 1) < statisticSize)
      {
        print.println(F("--------------------"));
      }
    }
  }
  MemoryUsage::printStars(print);
}

void StatisticController::printRam(Print &print) const
{
  MemoryUsage::ramDisplay(print);
}
