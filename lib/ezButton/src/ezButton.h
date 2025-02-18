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

#ifndef ezButton_h
#define ezButton_h

#include <Arduino.h>

// Combine related constants to save program space
#define COUNT_FALLING 0
#define COUNT_RISING 1
#define COUNT_BOTH 2

// Constants for button modes
#define INTERNAL_PULLUP INPUT_PULLUP
#ifdef INPUT_PULLDOWN
#define INTERNAL_PULLDOWN INPUT_PULLDOWN
#else
#define INTERNAL_PULLDOWN INPUT
#endif

// Use uint8_t instead of int for mode constants to save space
#define EXTERNAL_PULLUP 0xFE
#define EXTERNAL_PULLDOWN 0xFF

class ezButton
{
private:
	struct {
		uint8_t btnPin;           // Pin number (0-255)
		struct {
			uint8_t countMode : 2;     // Only needs 2 bits (0-2)
			uint8_t pressedState : 1;   // Only needs 1 bit
			uint8_t unpressedState : 1; // Only needs 1 bit
			uint8_t previousState : 1;  // Only needs 1 bit
			uint8_t lastState : 1;      // Only needs 1 bit
			uint8_t flickerState : 1;   // Only needs 1 bit
			uint8_t unused : 1;         // Padding bit
		} flags;
	} config;

	uint32_t debounceTime;
	uint32_t count;
	uint32_t lastDebounceTime;

public:
	ezButton(int pin);
	ezButton(int pin, int mode);
	void setDebounceTime(unsigned long time);
	int getState(void) const;
	int getStateRaw(void) const;
	bool isPressed(void) const;
	bool isReleased(void) const;
	void setCountMode(int mode);
	unsigned long getCount(void) const;
	void resetCount(void);
	void loop(void);
};

#endif
