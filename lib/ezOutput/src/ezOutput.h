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

#ifndef ezOutput_h
#define ezOutput_h

#include <Arduino.h>

// Use enum instead of defines to save program space
enum BlinkState
{
	BLINK_STATE_DISABLE = 0,
	BLINK_STATE_DELAY = 1,
	BLINK_STATE_BLINK = 2
};

class ezOutput
{
private:
	const uint8_t _outputPin;

	// Pack states into a bit field structure
	struct
	{
		uint8_t outputState : 1; // 1 bit for HIGH/LOW
		uint8_t blinkState : 2;	 // 2 bits for DISABLE/DELAY/BLINK
		uint8_t unused : 5;		 // unused bits
	} _states;

	uint32_t _highTime;
	uint32_t _lowTime;
	uint32_t _startTime;
	int16_t _blinkTimes;
	uint32_t _lastBlinkTime;

public:
	explicit ezOutput(uint8_t pin);
	void high();
	void low();
	void toggle();
	void toggle(uint32_t delayTime);

	void pulse(uint32_t pulseTime);
	void pulse(uint32_t pulseTime, uint32_t delayTime);

	void blink(uint32_t lowTime, uint32_t highTime);
	void blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime);
	void blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime, int16_t blinkTimes);

	uint8_t getState() const;
	void loop();
};

#endif
