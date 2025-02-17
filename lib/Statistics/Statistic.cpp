#include "Statistic.h"
#include <limits.h>

Statistic::Statistic()
    : name(nullptr), startTime(0), minTime(ULONG_MAX), maxTime(0), totalTime(0), count(0) {}

void Statistic::setName(const __FlashStringHelper *n)
{
  name = n;
}

void Statistic::start()
{
  startTime = micros();
}

void Statistic::end()
{
  const unsigned long elapsed = micros() - startTime;
  if (elapsed < minTime)
    minTime = elapsed;
  if (elapsed > maxTime)
    maxTime = elapsed;
  totalTime += elapsed;
  count++;
}

void Statistic::print(Print &print) const
{
  print.print(F("Statistic: "));
  if (name)
  {
    Serial.println(name);
  }
  else
  {
    Serial.println(F("(Unnamed)"));
  }
  print.print(F("Min Time: "));
  print.print(minTime);
  print.println(F(" us"));
  print.print(F("Max Time: "));
  print.print(maxTime);
  print.println(F(" us"));
  print.print(F("Average Time: "));
  print.print(count > 0 ? totalTime / count : 0);
  print.println(F(" us"));
}
