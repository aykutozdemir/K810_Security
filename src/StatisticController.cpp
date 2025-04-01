// Arduino core
#include <MemoryUsage.h>

// Project headers
#include "StatisticController.h"
#include "Utilities.h"

void StatisticController::setup()
{
  MemoryUsage::stackPaint();
} // end setup

void StatisticController::loop(Print &print)
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
  Utilities::printStars(print);
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
  Utilities::printStars(print);
}

void StatisticController::printRam(Print &print) const
{
  Utilities::printStars(print);
  MemoryUsage::ramDisplay(print);
  Utilities::printStars(print);
}
