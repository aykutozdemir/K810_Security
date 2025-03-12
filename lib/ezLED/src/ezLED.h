/*
 * Copyright (c) 2021, ArduinoGetStarted.com. All rights reserved.
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
 * @file ezLED.h
 * @brief Advanced LED control library for Arduino.
 *
 * The ezLED library provides a non-blocking way to control LEDs including
 * on/off, toggle, fade, and various blinking patterns.
 *
 * @author ArduinoGetStarted.com
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 * @see https://arduinogetstarted.com/tutorials/arduino-led-library
 */

#ifndef ezLED_h
#define ezLED_h

#include <Arduino.h>

/**
 * @brief LED state constants
 */
#define LED_OFF 0 ///< LED off state
#define LED_ON 1  ///< LED on state

/**
 * @brief LED operating state constants
 */
#define LED_IDLE 0	   ///< LED is idle
#define LED_DELAY 1	   ///< LED is in delay mode
#define LED_FADING 2   ///< LED is fading
#define LED_BLINKING 3 ///< LED is blinking

/**
 * @brief LED control mode constants
 */
#define CTRL_ANODE 0   ///< LED is controlled through anode (common cathode)
#define CTRL_CATHODE 1 ///< LED is controlled through cathode (common anode)

/**
 * @brief LED operation mode constants
 */
#define LED_MODE_OFF 0			  ///< LED is turned off
#define LED_MODE_ON 1			  ///< LED is turned on
#define LED_MODE_TOGGLE 2		  ///< LED is toggling between on and off
#define LED_MODE_FADE 3			  ///< LED is fading
#define LED_MODE_BLINK_FOREVER 4  ///< LED is blinking continuously
#define LED_MODE_BLINK_PERIOD 5	  ///< LED is blinking for a period of time
#define LED_MODE_BLINK_NUM_TIME 6 ///< LED is blinking a specific number of times

/**
 * @brief LED internal state constants
 */
#define LED_STATE_IDLE 0   ///< LED internal state is idle
#define LED_STATE_DELAY 1  ///< LED internal state is in delay
#define LED_STATE_ON_OFF 2 ///< LED internal state is handling on/off
#define LED_STATE_FADE 3   ///< LED internal state is handling fade
#define LED_STATE_BLINK 4  ///< LED internal state is handling blink

/**
 * @brief Non-blocking LED control library
 *
 * This class provides an easy-to-use interface for controlling LEDs
 * with built-in support for various lighting patterns without blocking
 * the main program execution.
 */
class ezLED
{
private:
	uint8_t _ledPin;	 ///< Arduino pin connected to the LED
	uint8_t _brightness; ///< LED brightness (0 to 255)

	// Group flags into a struct to ensure optimal bit-packing
	struct
	{
		uint8_t _ctrlMode : 1;	  ///< Control mode: CTRL_ANODE or CTRL_CATHODE
		uint8_t _ledMode : 3;	  ///< LED mode, values 0-6
		uint8_t _ledState : 3;	  ///< LED state, values 0-4
		uint8_t _outputState : 1; ///< Output state: LED_OFF or LED_ON
	} flags;

	// Group fade-related variables
	struct
	{
		uint8_t from;  ///< Start brightness for fade
		uint8_t to;	   ///< End brightness for fade
		uint32_t time; ///< Duration of fade in milliseconds
	} _fade;

	// Group blink-related variables
	struct
	{
		uint16_t onTime;  ///< Time LED stays on during blink (ms)
		uint16_t offTime; ///< Time LED stays off during blink (ms)
		uint16_t period;  ///< Total period for blinking (ms)
		uint32_t timer;	  ///< Timer for period-based blinking
		uint8_t count;	  ///< Current count of blinks
		uint8_t target;	  ///< Target number of blinks
	} _blink;

	uint16_t _delayTime; ///< Delay time before action (ms)
	uint32_t _lastTime;	 ///< Last time an action was performed

	/**
	 * @brief Configure blink parameters
	 *
	 * @param onTime Time LED stays on during blink (ms)
	 * @param offTime Time LED stays off during blink (ms)
	 * @param delayTime Delay before blinking starts (ms)
	 */
	void setBlink(uint16_t onTime, uint16_t offTime, uint16_t delayTime);

	/**
	 * @brief Update LED using analog write (for fading)
	 */
	void updateAnalog();

	/**
	 * @brief Update LED using digital write
	 */
	void updateDigital();

public:
	/**
	 * @brief Constructor
	 *
	 * @param pin Arduino pin connected to the LED
	 * @param mode Control mode: CTRL_ANODE (default) or CTRL_CATHODE
	 */
	explicit ezLED(int pin, int mode = CTRL_ANODE);

	/**
	 * @brief Turn the LED on
	 *
	 * @param delayTime Optional delay before turning on (ms)
	 */
	void turnON(uint16_t delayTime = 0);

	/**
	 * @brief Turn the LED off
	 *
	 * @param delayTime Optional delay before turning off (ms)
	 */
	void turnOFF(uint16_t delayTime = 0);

	/**
	 * @brief Toggle the LED state
	 *
	 * @param delayTime Optional delay before toggling (ms)
	 */
	void toggle(uint16_t delayTime = 0);

	/**
	 * @brief Fade the LED from one brightness to another
	 *
	 * @param fadeFrom Start brightness (0-255)
	 * @param fadeTo End brightness (0-255)
	 * @param fadeTime Duration of fade in milliseconds
	 * @param delayTime Optional delay before fading starts (ms)
	 */
	void fade(uint8_t fadeFrom, uint8_t fadeTo, uint32_t fadeTime, uint16_t delayTime = 0);

	/**
	 * @brief Blink the LED continuously
	 *
	 * @param onTime Time LED stays on during blink (ms)
	 * @param offTime Time LED stays off during blink (ms)
	 * @param delayTime Optional delay before blinking starts (ms)
	 */
	void blink(uint16_t onTime, uint16_t offTime, uint16_t delayTime = 0);

	/**
	 * @brief Blink the LED for a specific period of time
	 *
	 * @param onTime Time LED stays on during blink (ms)
	 * @param offTime Time LED stays off during blink (ms)
	 * @param blinkTime Total time to blink (ms)
	 * @param delayTime Optional delay before blinking starts (ms)
	 */
	void blinkInPeriod(uint16_t onTime, uint16_t offTime, uint16_t blinkTime, uint16_t delayTime = 0);

	/**
	 * @brief Blink the LED a specific number of times
	 *
	 * @param onTime Time LED stays on during blink (ms)
	 * @param offTime Time LED stays off during blink (ms)
	 * @param numberOfTimes Number of times to blink
	 * @param delayTime Optional delay before blinking starts (ms)
	 */
	void blinkNumberOfTimes(uint16_t onTime, uint16_t offTime, uint8_t numberOfTimes, uint16_t delayTime = 0);

	/**
	 * @brief Cancel current operation and turn LED off
	 */
	void cancel(void);

	/**
	 * @brief Get current on/off state
	 *
	 * @return LED_ON or LED_OFF
	 */
	int getOnOff(void);

	/**
	 * @brief Get current operating state
	 *
	 * @return LED_IDLE, LED_DELAY, LED_FADING, or LED_BLINKING
	 */
	int getState(void);

	/**
	 * @brief Update LED state (must be called regularly in loop)
	 */
	void loop(void);
};

#endif
