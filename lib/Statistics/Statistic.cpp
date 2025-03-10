#include "Statistic.h"
#include <limits.h>

Statistic::Statistic()
{
    reset();
}

void Statistic::reset()
{
    name = nullptr;
    startTime = 0;
    minTime = UINT16_MAX;
    maxTime = 0;
    average = 0;
}

void Statistic::setName(const __FlashStringHelper *n)
{
    name = n;
}

void Statistic::start()
{
    startTime = (uint16_t)micros(); // Store lower 16 bits
}

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

void Statistic::print(Print &print) const
{
    print.print(F("Statistic: "));
    print.println(name ? name : F("(Unnamed)"));

    print.print(F("Min: "));
    print.print(minTime);

    print.print(F("us Max: "));
    print.print(maxTime);

    print.print(F("us Avg: "));
    print.print(average);
    print.println(F("us"));
}
