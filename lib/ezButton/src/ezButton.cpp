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

#include <ezButton.h>

ezButton::ezButton(int pin) : ezButton(pin, INPUT_PULLUP) {}

ezButton::ezButton(int pin, int mode)
{
	config.btnPin = pin;
	debounceTime = 0;
	count = 0;
	config.flags.countMode = COUNT_FALLING;

	// Simplified pin mode setting
	pinMode(config.btnPin, (mode == EXTERNAL_PULLUP || mode == EXTERNAL_PULLDOWN) ? INPUT : mode);

	// Simplified state setting
	config.flags.pressedState = (mode == INTERNAL_PULLDOWN || mode == EXTERNAL_PULLDOWN) ? HIGH : LOW;
	config.flags.unpressedState = !config.flags.pressedState;

	uint8_t initial = digitalRead(config.btnPin);
	config.flags.previousState = initial;
	config.flags.lastState = initial;
	config.flags.flickerState = initial;

	lastDebounceTime = 0;
}

void ezButton::setDebounceTime(unsigned long time)
{
	debounceTime = time;
}

int ezButton::getState(void) const
{
	return config.flags.lastState;
}

int ezButton::getStateRaw(void) const
{
	return digitalRead(config.btnPin);
}

bool ezButton::isPressed(void) const
{
	return (config.flags.previousState == config.flags.unpressedState &&
			config.flags.lastState == config.flags.pressedState);
}

bool ezButton::isReleased(void) const
{
	return (config.flags.previousState == config.flags.pressedState &&
			config.flags.lastState == config.flags.unpressedState);
}

void ezButton::setCountMode(int mode)
{
	config.flags.countMode = mode;
}

unsigned long ezButton::getCount(void) const
{
	return count;
}

void ezButton::resetCount(void)
{
	count = 0;
}

void ezButton::loop(void)
{
	uint8_t currentState = digitalRead(config.btnPin);
	uint32_t currentTime = millis();

	if (currentState != config.flags.flickerState)
	{
		lastDebounceTime = currentTime;
		config.flags.flickerState = currentState;
	}

	if ((currentTime - lastDebounceTime) >= debounceTime)
	{
		config.flags.previousState = config.flags.lastState;
		config.flags.lastState = currentState;

		if (config.flags.previousState != config.flags.lastState)
		{
			if (config.flags.countMode == COUNT_BOTH ||
				(config.flags.countMode == COUNT_FALLING && config.flags.previousState == HIGH) ||
				(config.flags.countMode == COUNT_RISING && config.flags.previousState == LOW))
			{
				count++;
			}
		}
	}
}
