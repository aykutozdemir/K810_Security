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

#include <ezOutput.h>

ezOutput::ezOutput(uint8_t pin) : 
	_outputPin(pin),
	_states{0, BLINK_STATE_DISABLE, 0}, // Initialize all bits
	_highTime(0),
	_lowTime(0),
	_blinkTimes(-1),
	_lastBlinkTime(0)
{
	pinMode(_outputPin, OUTPUT);
}

void ezOutput::high() {
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = 1;
	digitalWrite(_outputPin, HIGH);
}

void ezOutput::low() {
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = 0;
	digitalWrite(_outputPin, LOW);
}

void ezOutput::toggle() {
	_states.blinkState = BLINK_STATE_DISABLE;
	_states.outputState = !_states.outputState;
	digitalWrite(_outputPin, _states.outputState);
}

void ezOutput::toggle(uint32_t delayTime) {
	_highTime = _lowTime = 0;
	_startTime = delayTime;
	_blinkTimes = 1;
	_states.blinkState = BLINK_STATE_DELAY;
	_lastBlinkTime = millis();
}

void ezOutput::pulse(uint32_t pulseTime) {
	pulse(pulseTime, 0);
}

void ezOutput::pulse(uint32_t pulseTime, uint32_t delayTime) {
	_states.blinkState = BLINK_STATE_DISABLE;
	blink(_states.outputState == LOW ? 0 : pulseTime, 
		  _states.outputState == LOW ? pulseTime : 0, 
		  delayTime, 2);
}

void ezOutput::blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime, int16_t blinkTimes) {
	_highTime = highTime;
	_lowTime = lowTime;
	_startTime = delayTime;
	_blinkTimes = blinkTimes;

	if (_states.blinkState == BLINK_STATE_DISABLE) {
		_states.blinkState = BLINK_STATE_DELAY;
		_lastBlinkTime = millis();
	}
}

void ezOutput::blink(uint32_t lowTime, uint32_t highTime, uint32_t delayTime) {
	blink(lowTime, highTime, delayTime, -1);
}

void ezOutput::blink(uint32_t lowTime, uint32_t highTime) {
	blink(lowTime, highTime, 0, -1);
}

uint8_t ezOutput::getState() const {
	return _states.outputState;
}

void ezOutput::loop() {
	if (_blinkTimes == 0) {
		_states.blinkState = BLINK_STATE_DISABLE;
		return;
	}

	bool isBlink = false;
	uint32_t currentTime = millis();
	uint32_t elapsedTime = currentTime - _lastBlinkTime;

	switch (_states.blinkState) {
		case BLINK_STATE_DELAY:
			if (elapsedTime >= _startTime) {
				isBlink = true;
				_states.blinkState = BLINK_STATE_BLINK;
			}
			break;

		case BLINK_STATE_BLINK:
			isBlink = _states.outputState ? 
					  (elapsedTime >= _highTime) :
					  (elapsedTime >= _lowTime);
			break;

		default:
			return;
	}

	if (isBlink) {
		_states.outputState = !_states.outputState;
		digitalWrite(_outputPin, _states.outputState);
		_lastBlinkTime = currentTime;

		if (_blinkTimes > 0) {
			_blinkTimes--;
		}
	}
}
