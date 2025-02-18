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

  SoftSerial(const uint8_t rxPin, const uint8_t txPin,
             FastCircularQueue<uint8_t, RX_BUFFER_SIZE> &rxQueue,
             FastCircularQueue<uint8_t, TX_BUFFER_SIZE> &txQueue);

  inline void begin(const unsigned long baudRate,
                    TimerSetupCallback timerSetupCallback,
                    const uint8_t stopBits = 1, const ParityMode parity = NONE);
  inline void end();

  inline void processISR();

  inline int available() override;
  inline int read() override;
  inline int peek() override;
  inline void flush() override;
  inline size_t write(uint8_t data) override;

private:
  // Pin control
  FastPin m_rxPin;
  FastPin m_txPin;

  // Buffers
  FastCircularQueue<uint8_t, RX_BUFFER_SIZE> &m_rxQueue;
  FastCircularQueue<uint8_t, TX_BUFFER_SIZE> &m_txQueue;

  // Serial configuration
  unsigned long m_baudRate;
  uint8_t m_stopBits;
  ParityMode m_parity;

  // Bit state variables
  volatile uint8_t m_isrCounter;

  volatile uint8_t m_rxISRPoint;
  volatile uint8_t m_rxBitIndex;
  volatile uint8_t m_receivedData;

  volatile uint8_t m_txBitIndex;
  volatile uint8_t m_txData;
  volatile uint8_t m_txDataCopy;
};

#include "SoftSerial.hpp"

#endif
