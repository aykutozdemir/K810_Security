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
 * @file ezButton.h
 * @brief Easy-to-use button handling library for Arduino.
 *
 * The ezButton library provides an efficient and reliable way to handle button events
 * with built-in debouncing. It can detect button press, release, and count events.
 *
 * @author ArduinoGetStarted.com
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 * @see https://arduinogetstarted.com/tutorials/arduino-button-library
 */

#ifndef ezButton_h
#define ezButton_h

#include <Arduino.h>

/**
 * @brief Constants for button counting modes
 */
// Combine related constants to save program space
#define COUNT_FALLING 0 ///< Count events when button state changes from HIGH to LOW
#define COUNT_RISING 1	///< Count events when button state changes from LOW to HIGH
#define COUNT_BOTH 2	///< Count events on both rising and falling edges

/**
 * @brief Constants for button modes
 */
#define INTERNAL_PULLUP INPUT_PULLUP ///< Use internal pull-up resistor
#ifdef INPUT_PULLDOWN
#define INTERNAL_PULLDOWN INPUT_PULLDOWN ///< Use internal pull-down resistor
#else
#define INTERNAL_PULLDOWN INPUT ///< Fallback for platforms without pull-down
#endif

// Use uint8_t instead of int for mode constants to save space
#define EXTERNAL_PULLUP 0xFE   ///< Use external pull-up resistor
#define EXTERNAL_PULLDOWN 0xFF ///< Use external pull-down resistor

/**
 * @brief Easy-to-use button handling class with debounce
 *
 * The ezButton class provides a simple interface for button handling
 * with built-in debouncing and event counting capabilities.
 */
class ezButton
{
private:
	struct
	{
		uint8_t btnPin; // Pin number (0-255)
		struct
		{
			uint8_t countMode : 2;		// Only needs 2 bits (0-2)
			uint8_t pressedState : 1;	// Only needs 1 bit
			uint8_t unpressedState : 1; // Only needs 1 bit
			uint8_t previousState : 1;	// Only needs 1 bit
			uint8_t lastState : 1;		// Only needs 1 bit
			uint8_t flickerState : 1;	// Only needs 1 bit
			uint8_t unused : 1;			// Padding bit
		} flags;
	} config;

	uint16_t debounceTime;	   ///< Debounce time in milliseconds
	uint16_t count;			   ///< Button event counter
	uint16_t lastDebounceTime; ///< Last time button state changed

public:
	/**
	 * @brief Constructor with pull-up mode by default
	 *
	 * @param pin Arduino pin number the button is connected to
	 */
	explicit ezButton(int pin);

	/**
	 * @brief Constructor with configurable input mode
	 *
	 * @param pin Arduino pin number the button is connected to
	 * @param mode INPUT, INPUT_PULLUP, INTERNAL_PULLUP, INTERNAL_PULLDOWN, EXTERNAL_PULLUP, or EXTERNAL_PULLDOWN
	 */
	ezButton(int pin, int mode);

	/**
	 * @brief Set the debounce time
	 *
	 * @param time Debounce time in milliseconds
	 */
	void setDebounceTime(uint16_t time);

	/**
	 * @brief Get the current debounced button state
	 *
	 * @return HIGH or LOW
	 */
	int getState(void) const;

	/**
	 * @brief Get the raw (non-debounced) button state
	 *
	 * @return HIGH or LOW
	 */
	int getStateRaw(void) const;

	/**
	 * @brief Check if the button was just pressed
	 *
	 * @return true if button was just pressed, false otherwise
	 */
	bool isPressed(void) const;

	/**
	 * @brief Check if the button was just released
	 *
	 * @return true if button was just released, false otherwise
	 */
	bool isReleased(void) const;

	/**
	 * @brief Configure the event counting mode
	 *
	 * @param mode COUNT_FALLING, COUNT_RISING, or COUNT_BOTH
	 */
	void setCountMode(int mode);

	/**
	 * @brief Get the current event count
	 *
	 * @return Number of counted events
	 */
	uint16_t getCount(void) const;

	/**
	 * @brief Reset the event counter to zero
	 */
	void resetCount(void);

	/**
	 * @brief Update button state (must be called regularly in loop)
	 */
	void loop(void);
};

#endif
