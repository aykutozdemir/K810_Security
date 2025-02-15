#ifndef STATISTIC_H
#define STATISTIC_H

#include <Arduino.h>

class Statistic
{
public:
  Statistic();

  void setName(const __FlashStringHelper *n);

  void start();
  void end();
  void print(Print &print) const;

private:
  const __FlashStringHelper *name;
  unsigned long startTime;
  unsigned long minTime;
  unsigned long maxTime;
  unsigned long totalTime;
  unsigned long count;
};

#define MEASURE_TIME(obj) \
  for (bool _run = (obj.start(), true); _run; obj.end(), _run = false)

#endif // STATISTIC_H
