#ifndef SOFTSERIAL_H
#define SOFTSERIAL_H

#include <Arduino.h>
#include <Stream.h>
#include <FastPin.h>
#include <FastCircularQueue.h>

enum ParityMode
{
  NONE,
  EVEN,
  ODD
};

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
class SoftSerial : public Stream
{
public:
  typedef void (*TimerSetupCallback)(const unsigned long period);
  typedef void (*ErrorCallback)(const __FlashStringHelper* errorMessage);

  SoftSerial(const uint8_t rxPin, const uint8_t txPin);

  inline void begin(const unsigned long baudRate,
                    TimerSetupCallback timerSetupCallback,
                    const uint8_t stopBits = 1, const ParityMode parity = NONE);
  inline void end();
  inline void setErrorCallback(ErrorCallback callback);

  inline void processISR();

  inline int available() override;
  inline int read() override;
  inline int peek() override;
  inline void flush() override;
  inline size_t write(uint8_t data) override;

  void loop();

private:
  const FastPin m_rxPin;
  const FastPin m_txPin;

  FastCircularQueue<uint8_t, RX_BUFFER_SIZE> m_rxQueue;
  FastCircularQueue<uint8_t, TX_BUFFER_SIZE> m_txQueue;
  FastCircularQueue<uint16_t, RX_BUFFER_SIZE> m_rxTempQueue;

  unsigned long m_baudRate;
  uint8_t m_stopBits;
  ParityMode m_parity;
  uint8_t m_expectedBits;
  ErrorCallback m_errorCallback;

  volatile uint8_t m_rxBitIndex;
  uint16_t m_receivedData;
  uint16_t m_rxIsrCounter;
  uint8_t m_rxIsrTargetCounter;

  volatile uint8_t m_txBitIndex;
  volatile bool m_txBitChanges[12];
  uint8_t m_txIsrCounter;
};

#include "SoftSerial.hpp"

#endif
