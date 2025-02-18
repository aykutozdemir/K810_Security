//
// Created by kiryanenko on 05.10.19.
//

#ifndef LED_LIGHTING_SIMPLETIMER_H
#define LED_LIGHTING_SIMPLETIMER_H

#include <Arduino.h>

template<typename TimeType = unsigned long>
class SimpleTimer
{
    TimeType _start;
    TimeType _interval;

public:
    /// Constructor, that initialize timer
    /// \param interval An interval in msec
    explicit SimpleTimer(const TimeType interval = 0);

    /// Check is timer is ready
    /// \return True if is timer is ready
    bool isReady();

    /// Set the time interval
    /// \param interval An interval in msec
    void setInterval(const TimeType interval);

    /// Reset a timer
    void reset();
};

// Implementation must be in header for templates
template<typename TimeType>
SimpleTimer<TimeType>::SimpleTimer(const TimeType interval) : _interval(interval)
{
    _start = millis();
}

template<typename TimeType>
bool SimpleTimer<TimeType>::isReady()
{
    return (TimeType)(millis() - _start) >= _interval;
}

template<typename TimeType>
void SimpleTimer<TimeType>::setInterval(TimeType interval)
{
    _interval = interval;
}

template<typename TimeType>
void SimpleTimer<TimeType>::reset()
{
    _start = millis();
}

#endif // LED_LIGHTING_SIMPLETIMER_H
