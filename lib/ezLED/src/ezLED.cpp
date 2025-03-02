/*
 * Copyright (c) 2021, ArduinoGetStarted.com. All rights reserved.
 * ... existing copyright header ...
 */

#include <ezLED.h>

ezLED::ezLED(int pin, int mode)
{
    _ledPin = pin;
    flags._ctrlMode = mode;
    flags._ledMode = LED_MODE_OFF;
    flags._ledState = LED_STATE_IDLE;
    flags._outputState = LED_OFF;
    _brightness = 0;

    // Initialize fade struct
    _fade = {0, 0, 0};

    // Initialize blink struct
    _blink = {0, 0, 0, 0, 0, 0};

    _delayTime = _lastTime = 0;

    pinMode(_ledPin, OUTPUT);
}

void ezLED::setBlink(unsigned long onTime, unsigned long offTime, unsigned long delayTime)
{
    _blink.onTime = onTime;
    _blink.offTime = offTime;
    _delayTime = delayTime;
    _lastTime = millis();
}

void ezLED::updateAnalog()
{
    analogWrite(_ledPin, flags._ctrlMode ? (255 - _brightness) : _brightness);
}

void ezLED::updateDigital()
{
    digitalWrite(_ledPin, flags._ctrlMode ? !flags._outputState : flags._outputState);
}

void ezLED::turnON(unsigned long delayTime)
{
    _delayTime = delayTime;
    flags._ledMode = LED_MODE_ON;

    if (delayTime > 0)
    {
        flags._ledState = LED_STATE_DELAY;
        _lastTime = millis();
    }
    else
    {
        flags._ledState = LED_STATE_ON_OFF;
    }

    loop();
}

void ezLED::turnOFF(unsigned long delayTime)
{
    _delayTime = delayTime;
    flags._ledMode = LED_MODE_OFF;

    if (delayTime > 0)
    {
        flags._ledState = LED_STATE_DELAY;
        _lastTime = millis();
    }
    else
    {
        flags._ledState = LED_STATE_ON_OFF;
    }

    loop();
}

void ezLED::toggle(unsigned long delayTime)
{
    _delayTime = delayTime;
    flags._ledMode = LED_MODE_TOGGLE;

    if (delayTime > 0)
    {
        flags._ledState = LED_STATE_DELAY;
        _lastTime = millis();
    }
    else
    {
        flags._ledState = LED_STATE_ON_OFF;
    }

    loop();
}

void ezLED::fade(int fadeFrom, int fadeTo, unsigned long fadeTime, unsigned long delayTime)
{
    _fade.from = fadeFrom;
    _fade.to = fadeTo;
    _fade.time = fadeTime;
    _delayTime = delayTime;
    flags._ledMode = LED_MODE_FADE;
    _lastTime = millis();

    if (delayTime > 0)
        flags._ledState = LED_STATE_DELAY;
    else
        flags._ledState = LED_STATE_FADE;

    loop();
}

void ezLED::blink(unsigned long onTime, unsigned long offTime, unsigned long delayTime)
{
    setBlink(onTime, offTime, delayTime);
    flags._ledMode = LED_MODE_BLINK_FOREVER;

    if (flags._ledState == LED_STATE_IDLE)
    {
        if (delayTime > 0)
            flags._ledState = LED_STATE_DELAY;
        else
        {
            flags._ledState = LED_STATE_BLINK;
            flags._outputState = LED_ON;
            _lastTime = millis();
        }
    }

    loop();
}

void ezLED::blinkInPeriod(unsigned long onTime, unsigned long offTime, unsigned long blinkTime, unsigned long delayTime)
{
    setBlink(onTime, offTime, delayTime);
    _blink.period = blinkTime;
    flags._ledMode = LED_MODE_BLINK_PERIOD;

    if (flags._ledState == LED_STATE_IDLE)
    {
        if (delayTime > 0)
            flags._ledState = LED_STATE_DELAY;
        else
        {
            flags._ledState = LED_STATE_BLINK;
            flags._outputState = LED_ON;
            _lastTime = millis();
            _blink.timer = millis();
        }
    }

    loop();
}

void ezLED::blinkNumberOfTimes(unsigned long onTime, unsigned long offTime, unsigned int numberOfTimes, unsigned long delayTime)
{
    setBlink(onTime, offTime, delayTime);
    _blink.target = numberOfTimes;
    flags._ledMode = LED_MODE_BLINK_NUM_TIME;

    if (flags._ledState == LED_STATE_IDLE)
    {
        if (delayTime > 0)
            flags._ledState = LED_STATE_DELAY;
        else
        {
            flags._ledState = LED_STATE_BLINK;
            flags._outputState = LED_ON;
            _lastTime = millis();
            _blink.count = 1;
        }
    }

    loop();
}

void ezLED::cancel(void)
{
    turnOFF();
}

int ezLED::getOnOff(void)
{
    return flags._outputState;
}

int ezLED::getState(void)
{
    switch (flags._ledState)
    {
    case LED_STATE_DELAY:
        return LED_DELAY;

    case LED_STATE_FADE:
        return LED_FADING;

    case LED_STATE_BLINK:
        return LED_BLINKING;

    default:
        return LED_IDLE;
    }
}

void ezLED::loop(void)
{
    switch (flags._ledState)
    {
    case LED_STATE_IDLE:
        return;

    case LED_STATE_DELAY:
        if ((unsigned long)(millis() - _lastTime) >= _delayTime)
        {
            switch (flags._ledMode)
            {
            case LED_MODE_OFF:
            case LED_MODE_ON:
            case LED_MODE_TOGGLE:
                flags._ledState = LED_STATE_ON_OFF;
                break;

            case LED_MODE_FADE:
                flags._ledState = LED_STATE_FADE;
                break;

            case LED_MODE_BLINK_FOREVER:
            case LED_MODE_BLINK_PERIOD:
            case LED_MODE_BLINK_NUM_TIME:
                flags._ledState = LED_STATE_BLINK;
                flags._outputState = LED_ON;
                break;
            }

            _lastTime = millis();
        }
        break;

    case LED_STATE_ON_OFF:
        switch (flags._ledMode)
        {
        case LED_MODE_OFF:
            flags._outputState = LED_OFF;
            break;
        case LED_MODE_ON:
            flags._outputState = LED_ON;
            break;
        case LED_MODE_TOGGLE:
            flags._outputState = (flags._outputState == LED_ON) ? LED_OFF : LED_ON;
            break;
        }

        flags._ledState = LED_STATE_IDLE;
        break;

    case LED_STATE_FADE:
        if ((millis() - _lastTime) <= _fade.time)
        {
            unsigned long progress = millis() - _lastTime;
            _brightness = map(progress, 0, _fade.time, _fade.from, _fade.to);
        }
        else
        {
            flags._ledState = LED_STATE_IDLE;
            flags._outputState = LED_OFF;
        }
        break;

    case LED_STATE_BLINK:
        if (flags._outputState == LED_OFF && (unsigned long)(millis() - _lastTime) >= _blink.offTime)
        {
            flags._outputState = LED_ON;
            _lastTime = millis();
            _blink.count++;
        }
        else if (flags._outputState == LED_ON && (unsigned long)(millis() - _lastTime) >= _blink.onTime)
        {
            flags._outputState = LED_OFF;
            _lastTime = millis();
            _blink.count++;
        }

        switch (flags._ledMode)
        {
        case LED_MODE_BLINK_FOREVER:
            break;

        case LED_MODE_BLINK_PERIOD:
            if ((unsigned long)(millis() - _blink.timer) >= _blink.period)
            {
                flags._outputState = LED_OFF;
                flags._ledState = LED_STATE_IDLE;
            }
            break;

        case LED_MODE_BLINK_NUM_TIME:
            if (_blink.count >= (2 * _blink.target))
            {
                flags._outputState = LED_OFF;
                flags._ledState = LED_STATE_IDLE;
            }
            break;
        }
        break;
    }

    if (flags._ledState == LED_STATE_FADE)
        updateAnalog();
    else
        updateDigital();
}