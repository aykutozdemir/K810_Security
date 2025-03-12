/*
 * Copyright (c) 2019, ArduinoGetStarted.com. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * - Neither the name of the ArduinoGetStarted.com nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY ARDUINOGETSTARTED.COM "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL ARDUINOGETSTARTED.COM BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file ezOutput.cpp
 * @brief Implementation of the ezOutput library.
 *
 * This file contains the implementation of the ezOutput class which provides
 * non-blocking digital output control including toggle, pulse, and blink patterns.
 *
 * @author ArduinoGetStarted.com
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#include <ezOutput.h>

/**
 * @brief Constructor
 *
 * Initializes the digital output pin and internal state.
 *
 * @param pin Arduino pin number the output is connected to
 */
ezOutput::ezOutput(uint8_t pin) : _outputPin(pin),
								  _states{0, BLINK_STATE_DISABLE, 0}, // Initialize all bits
								  _highTime(0),
								  _lowTime(0),
								  _blinkTimes(-1),
								  _lastBlinkTime(0)
{
	pinMode(_outputPin, OUTPUT);
}

/**
 * @brief Set the output to HIGH
 *
 * Disables any blinking and sets the output pin to HIGH.
 */
void ezOutput::high()
{
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = 1;
	digitalWrite(_outputPin, HIGH);
}

/**
 * @brief Set the output to LOW
 *
 * Disables any blinking and sets the output pin to LOW.
 */
void ezOutput::low()
{
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = 0;
	digitalWrite(_outputPin, LOW);
}

/**
 * @brief Toggle the output state immediately
 *
 * Disables any blinking and toggles the output pin state.
 */
void ezOutput::toggle()
{
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = !_states.outputState;
	digitalWrite(_outputPin, _states.outputState);
}

/**
 * @brief Toggle the output state after a delay
 *
 * Sets up a delayed toggle operation. The actual toggle occurs when loop() is called.
 *
 * @param delayTime Delay time in milliseconds
 */
void ezOutput::toggle(uint32_t delayTime)
{
	_highTime = _lowTime = 0;
	_startTime = delayTime;
	_blinkTimes = 1;
	_states.blinkState = BLINK_STATE_DELAY;
	_lastBlinkTime = millis();
}

/**
 * @brief Generate a single pulse on the output
 *
 * If the output is LOW, it will go HIGH for pulseTime milliseconds,
 * then return to LOW. If it's HIGH, it will go LOW for pulseTime, then HIGH.
 *
 * @param pulseTime Duration of the pulse in milliseconds
 */
void ezOutput::pulse(uint32_t pulseTime)
{
	pulse(pulseTime, 0);
}

/**
 * @brief Generate a single pulse on the output after a delay
 *
 * Similar to pulse(), but with an initial delay before the pulse begins.
 *
 * @param pulseTime Duration of the pulse in milliseconds
 * @param delayTime Delay before the pulse starts in milliseconds
 */
void ezOutput::pulse(uint32_t pulseTime, uint32_t delayTime)
{
	_states.blinkState = BLINK_STATE_DISABLE;
	blink(_states.outputState == LOW ? 0 : pulseTime,
		  _states.outputState == LOW ? pulseTime : 0,
		  delayTime, 2);
}

/**
 * @brief Configure and start a blinking pattern
 *
 * Core function for all blinking modes. Sets up timing parameters
 * and initiates the blinking state machine.
 *
 * @param lowTime Duration for output to stay LOW during each blink (ms)
 * @param highTime Duration for output to stay HIGH during each blink (ms)
 * @param delayTime Delay before blinking starts in milliseconds
 * @param blinkTimes Number of times to blink (-1 for infinite)
 */
void ezOutput::blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime, int16_t blinkTimes)
{
	_highTime = highTime;
	_lowTime = lowTime;
	_startTime = delayTime;
	_blinkTimes = blinkTimes;

	if (_states.blinkState == BLINK_STATE_DISABLE)
	{
		_states.blinkState = BLINK_STATE_DELAY;
		_lastBlinkTime = millis();
	}
}

/**
 * @brief Blink the output continuously after a delay
 *
 * @param lowTime Duration for output to stay LOW during each blink (ms)
 * @param highTime Duration for output to stay HIGH during each blink (ms)
 * @param delayTime Delay before blinking starts in milliseconds
 */
void ezOutput::blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime)
{
	blink(lowTime, highTime, delayTime, -1);
}

/**
 * @brief Blink the output continuously
 *
 * @param lowTime Duration for output to stay LOW during each blink (ms)
 * @param highTime Duration for output to stay HIGH during each blink (ms)
 */
void ezOutput::blink(uint32_t lowTime, uint32_t highTime)
{
	blink(lowTime, highTime, 0, -1);
}

/**
 * @brief Get the current output state
 *
 * @return Current output state (HIGH or LOW)
 */
uint8_t ezOutput::getState() const
{
	return _states.outputState;
}

/**
 * @brief Update output state (must be called regularly in loop)
 *
 * This is the core non-blocking state machine that manages all output operations.
 * It must be called regularly in the main loop.
 */
void ezOutput::loop()
{
	if (_blinkTimes == 0)
	{
		_states.blinkState = BLINK_STATE_DISABLE;
		return;
	}

	bool isBlink = false;
	uint32_t currentTime = millis();
	uint32_t elapsedTime = currentTime - _lastBlinkTime;

	switch (_states.blinkState)
	{
	case BLINK_STATE_DELAY:
		if (elapsedTime >= _startTime)
		{
			isBlink = true;
			_states.blinkState = BLINK_STATE_BLINK;
		}
		break;

	case BLINK_STATE_BLINK:
		isBlink = _states.outputState ? (elapsedTime >= _highTime) : (elapsedTime >= _lowTime);
		break;

	default:
		return;
	}

	if (isBlink)
	{
		_states.outputState = !_states.outputState;
		digitalWrite(_outputPin, _states.outputState);
		_lastBlinkTime = currentTime;

		if (_blinkTimes > 0)
		{
			_blinkTimes--;
		}
	}
}
