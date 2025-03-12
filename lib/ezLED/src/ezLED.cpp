/*
 * Copyright (c) 2021, ArduinoGetStarted.com. All rights reserved.
 * ... existing copyright header ...
 */

/**
 * @file ezLED.cpp
 * @brief Implementation of the ezLED library.
 *
 * This file contains the implementation of the ezLED class which provides
 * non-blocking LED control including on/off, toggle, fade, and blink patterns.
 *
 * @author ArduinoGetStarted.com
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#include <ezLED.h>

/**
 * @brief Constructor for ezLED
 *
 * @param pin Arduino pin connected to the LED
 * @param mode Control mode: CTRL_ANODE (default) or CTRL_CATHODE
 */
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

/**
 * @brief Configure blink parameters
 *
 * @param onTime Time LED stays on during blink (ms)
 * @param offTime Time LED stays off during blink (ms)
 * @param delayTime Delay before blinking starts (ms)
 */
void ezLED::setBlink(uint16_t onTime, uint16_t offTime, uint16_t delayTime)
{
    _blink.onTime = onTime;
    _blink.offTime = offTime;
    _delayTime = delayTime;
    _lastTime = millis();
}

/**
 * @brief Update LED using analog write (for fading)
 *
 * Sets the LED brightness using analogWrite, taking into account
 * the control mode (anode or cathode).
 */
void ezLED::updateAnalog()
{
    analogWrite(_ledPin, flags._ctrlMode ? (255 - _brightness) : _brightness);
}

/**
 * @brief Update LED using digital write
 *
 * Sets the LED state using digitalWrite, taking into account
 * the control mode (anode or cathode).
 */
void ezLED::updateDigital()
{
    digitalWrite(_ledPin, flags._ctrlMode ? !flags._outputState : flags._outputState);
}

/**
 * @brief Turn the LED on
 *
 * @param delayTime Optional delay before turning on (ms)
 */
void ezLED::turnON(uint16_t delayTime)
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

/**
 * @brief Turn the LED off
 *
 * @param delayTime Optional delay before turning off (ms)
 */
void ezLED::turnOFF(uint16_t delayTime)
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

/**
 * @brief Toggle the LED state
 *
 * @param delayTime Optional delay before toggling (ms)
 */
void ezLED::toggle(uint16_t delayTime)
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

/**
 * @brief Fade the LED from one brightness to another
 *
 * @param fadeFrom Start brightness (0-255)
 * @param fadeTo End brightness (0-255)
 * @param fadeTime Duration of fade in milliseconds
 * @param delayTime Optional delay before fading starts (ms)
 */
void ezLED::fade(uint8_t fadeFrom, uint8_t fadeTo, uint32_t fadeTime, uint16_t delayTime)
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

/**
 * @brief Blink the LED continuously
 *
 * @param onTime Time LED stays on during blink (ms)
 * @param offTime Time LED stays off during blink (ms)
 * @param delayTime Optional delay before blinking starts (ms)
 */
void ezLED::blink(uint16_t onTime, uint16_t offTime, uint16_t delayTime)
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

/**
 * @brief Blink the LED for a specific period of time
 *
 * @param onTime Time LED stays on during blink (ms)
 * @param offTime Time LED stays off during blink (ms)
 * @param blinkTime Total time to blink (ms)
 * @param delayTime Optional delay before blinking starts (ms)
 */
void ezLED::blinkInPeriod(uint16_t onTime, uint16_t offTime, uint16_t blinkTime, uint16_t delayTime)
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

/**
 * @brief Blink the LED a specific number of times
 *
 * @param onTime Time LED stays on during blink (ms)
 * @param offTime Time LED stays off during blink (ms)
 * @param numberOfTimes Number of times to blink
 * @param delayTime Optional delay before blinking starts (ms)
 */
void ezLED::blinkNumberOfTimes(uint16_t onTime, uint16_t offTime, uint8_t numberOfTimes, uint16_t delayTime)
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

/**
 * @brief Cancel current operation and turn LED off
 */
void ezLED::cancel(void)
{
    turnOFF();
}

/**
 * @brief Get current on/off state
 *
 * @return LED_ON or LED_OFF
 */
int ezLED::getOnOff(void)
{
    return flags._outputState;
}

/**
 * @brief Get current operating state
 *
 * @return LED_IDLE, LED_DELAY, LED_FADING, or LED_BLINKING
 */
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

/**
 * @brief Update LED state (must be called regularly in loop)
 *
 * This is the core non-blocking state machine that manages all LED operations.
 * It must be called regularly in the main loop.
 */
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