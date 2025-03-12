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
 * @file ezOutput.h
 * @brief Non-blocking digital output control library for Arduino.
 *
 * The ezOutput library provides a non-blocking way to control digital outputs
 * with features including toggle, pulse, and various blinking patterns.
 *
 * @author ArduinoGetStarted.com
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 * @see https://arduinogetstarted.com/tutorials/arduino-output-library
 */

#ifndef ezOutput_h
#define ezOutput_h

#include <Arduino.h>

/**
 * @brief Constants for output blink states
 */
enum BlinkState
{
	BLINK_STATE_DISABLE = 0, ///< Blinking is disabled
	BLINK_STATE_DELAY = 1,	 ///< In delay state before blinking
	BLINK_STATE_BLINK = 2	 ///< Currently blinking
};

/**
 * @brief Non-blocking digital output control class
 *
 * This class provides an easy-to-use interface for controlling digital outputs
 * with built-in support for various patterns without blocking the main program execution.
 */
class ezOutput
{
private:
	const uint8_t _outputPin; ///< Arduino pin connected to the output

	// Pack states into a bit field structure
	struct
	{
		uint8_t outputState : 1; ///< Current output state (HIGH/LOW)
		uint8_t blinkState : 2;	 ///< Current blink state (DISABLE/DELAY/BLINK)
		uint8_t unused : 5;		 ///< Unused bits for future expansion
	} _states;

	uint32_t _highTime;		 ///< Duration for output to stay HIGH during blink (ms)
	uint32_t _lowTime;		 ///< Duration for output to stay LOW during blink (ms)
	uint32_t _startTime;	 ///< Delay time before blinking starts (ms)
	int16_t _blinkTimes;	 ///< Number of times to blink (-1 for infinite)
	uint32_t _lastBlinkTime; ///< Last time the output was toggled

public:
	/**
	 * @brief Constructor
	 *
	 * @param pin Arduino pin number the output is connected to
	 */
	explicit ezOutput(uint8_t pin);

	/**
	 * @brief Set the output to HIGH
	 */
	void high();

	/**
	 * @brief Set the output to LOW
	 */
	void low();

	/**
	 * @brief Toggle the output state immediately
	 */
	void toggle();

	/**
	 * @brief Toggle the output state after a delay
	 *
	 * @param delayTime Delay time in milliseconds
	 */
	void toggle(uint32_t delayTime);

	/**
	 * @brief Generate a single pulse on the output
	 *
	 * @param pulseTime Duration of the pulse in milliseconds
	 */
	void pulse(uint32_t pulseTime);

	/**
	 * @brief Generate a single pulse on the output after a delay
	 *
	 * @param pulseTime Duration of the pulse in milliseconds
	 * @param delayTime Delay before the pulse starts in milliseconds
	 */
	void pulse(uint32_t pulseTime, uint32_t delayTime);

	/**
	 * @brief Blink the output continuously
	 *
	 * @param lowTime Duration for output to stay LOW during each blink (ms)
	 * @param highTime Duration for output to stay HIGH during each blink (ms)
	 */
	void blink(uint32_t lowTime, uint32_t highTime);

	/**
	 * @brief Blink the output continuously after a delay
	 *
	 * @param lowTime Duration for output to stay LOW during each blink (ms)
	 * @param highTime Duration for output to stay HIGH during each blink (ms)
	 * @param delayTime Delay before blinking starts in milliseconds
	 */
	void blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime);

	/**
	 * @brief Blink the output a specific number of times
	 *
	 * @param lowTime Duration for output to stay LOW during each blink (ms)
	 * @param highTime Duration for output to stay HIGH during each blink (ms)
	 * @param delayTime Delay before blinking starts in milliseconds
	 * @param blinkTimes Number of times to blink (-1 for infinite)
	 */
	void blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime, int16_t blinkTimes);

	/**
	 * @brief Get the current output state
	 *
	 * @return HIGH or LOW
	 */
	uint8_t getState() const;

	/**
	 * @brief Update output state (must be called regularly in loop)
	 */
	void loop();
};

#endif
