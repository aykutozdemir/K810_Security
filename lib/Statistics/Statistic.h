#ifndef STATISTIC_H
#define STATISTIC_H

#include <Arduino.h>

class Statistic
{
public:
  Statistic();
  
  void setName(const __FlashStringHelper *n);
  void reset();
  void start();
  void end();
  void print(Print &print) const;

private:
  const __FlashStringHelper *name;
  uint16_t startTime;   // 2 bytes - stores lower 16 bits of micros()
  uint16_t minTime;     // 2 bytes
  uint16_t maxTime;     // 2 bytes
  uint16_t average;     // 2 bytes - EMA
  static const uint8_t ALPHA = 4;  // Weight for new samples (1/16)
};

#define MEASURE_TIME(obj) for (bool _run = (obj.start(), true); _run; _run = false, obj.end())

#endif // STATISTIC_H
