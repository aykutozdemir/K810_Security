//
// Created by kiryanenko on 05.10.19.
//

#include "SimpleTimer.h"

SimpleTimer::SimpleTimer(const unsigned long interval) : _interval(interval)
{
    _start = millis();
}

bool SimpleTimer::isReady()
{
    return (millis() - _start) >= _interval;
}

void SimpleTimer::setInterval(unsigned long interval)
{
    _interval = interval;
}

void SimpleTimer::reset()
{
    _start = millis();
}
