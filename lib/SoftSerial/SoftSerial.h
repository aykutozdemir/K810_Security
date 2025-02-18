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

  SoftSerial(const uint8_t rxPin, const uint8_t txPin);

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

  void loop();

private:
  // Methods to set TX pin low or high
  void txBitLow();
  void txBitHigh();

  // Pin control
  const FastPin m_rxPin;
  const FastPin m_txPin;

  // Buffers
  FastCircularQueue<uint8_t, RX_BUFFER_SIZE> m_rxQueue;
  FastCircularQueue<uint8_t, TX_BUFFER_SIZE> m_txQueue;

  FastCircularQueue<uint16_t, RX_BUFFER_SIZE> m_rxTempQueue;

  // Serial configuration
  unsigned long m_baudRate;
  uint8_t m_stopBits;
  ParityMode m_parity;
  uint8_t m_expectedBits;

  // Bit state variables
  uint8_t m_isrCounter;
  uint8_t m_rxISRPoint;

  volatile uint8_t m_rxBitIndex;
  uint16_t m_receivedData;

  volatile uint8_t m_txBitIndex;

  // Function pointer type for TX bit manipulations
  typedef void (SoftSerial::*TxBitManipulation)();

  // Array of function pointers for TX bit manipulations
  TxBitManipulation m_txBitManipulations[12];
};

#include "SoftSerial.hpp"

#endif
