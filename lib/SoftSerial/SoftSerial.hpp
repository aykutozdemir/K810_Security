#ifndef SOFTSERIAL_HPP
#define SOFTSERIAL_HPP

#include "SoftSerial.h"
#include <SafeInterrupts.h>

#define OVERSAMPLE 3

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SoftSerial(const uint8_t rxPin, const uint8_t txPin,
                                                              FastCircularQueue<uint8_t, RX_BUFFER_SIZE> &rxQueue,
                                                              FastCircularQueue<uint8_t, TX_BUFFER_SIZE> &txQueue)
    : m_rxPin(rxPin, false, true), m_txPin(txPin, true), m_rxQueue(rxQueue), m_txQueue(txQueue),
      m_baudRate(9600), m_stopBits(1), m_parity(NONE), m_expectedBits(0),
      m_isrCounter(0), m_rxISRPoint(0), m_rxBitIndex(255), m_receivedData(0), m_txBitIndex(255) {}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::begin(const unsigned long baudRate,
                                                              TimerSetupCallback timerSetupCallback,
                                                              const uint8_t stopBits, const ParityMode parity)
{
  SafeInterrupts::ScopedDisable guard;

  m_baudRate = baudRate;
  m_stopBits = stopBits;
  m_parity = parity;
  m_expectedBits = 1 /*start*/ + 8 /*data*/ + ((m_parity != NONE) ? 1 : 0) + m_stopBits;

  m_rxQueue.clear();
  m_txQueue.clear();
  m_rxTempQueue.clear();

  m_rxBitIndex = 254;
  m_txPin.high();

  unsigned long bitPeriod = (F_CPU + baudRate / 2UL) / baudRate;

  timerSetupCallback(bitPeriod / OVERSAMPLE);
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::end()
{
  m_rxBitIndex = 255;
  m_txBitIndex = 255;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::loop()
{
  SafeInterrupts::ScopedDisable guard;

  while (!m_rxTempQueue.isEmpty())
  {
    uint16_t frame;
    if (m_rxTempQueue.pop(frame))
    {
      const uint8_t dataStartIndex = 1;
      const uint8_t dataBits = 8;
      uint8_t parityIndex = 0;
      uint8_t stopIndex = 0;

      if (m_parity != NONE)
      {
        parityIndex = dataStartIndex + dataBits;
        stopIndex = parityIndex + 1;
      }
      else
      {
        stopIndex = dataStartIndex + dataBits;
      }

      if ((frame & 0x01) != 0)
      {
        continue;
      }

      bool stopValid = true;
      for (uint8_t i = 0; i < m_stopBits; i++)
      {
        if (!((frame >> (stopIndex + i)) & 0x01))
        {
          stopValid = false;
          break;
        }
      }
      if (!stopValid)
      {
        continue;
      }

      const uint8_t data = (frame >> dataStartIndex) & 0xFF;

      if (m_parity != NONE)
      {
        const uint8_t parityBit = (frame >> parityIndex) & 0x01;
        bool computedParity = __builtin_parity(data);
        if (m_parity == EVEN)
        {
          computedParity = !computedParity;
        }
        if (parityBit != computedParity)
        {
          continue;
        }
      }

      m_rxQueue.push(data);
    }
  }

  if (m_txBitIndex == 255)
  {
    uint8_t data;
    if (m_txQueue.pop(data))
    {
      const uint8_t dataCopy = data;

      m_txBitManipulations[0] = &SoftSerial::txBitLow;
      for (int i = 1; i <= 8; ++i)
      {
        m_txBitManipulations[i] = (data & 0x01) ? &SoftSerial::txBitHigh : &SoftSerial::txBitLow;
        data >>= 1;
      }
      if (m_parity != NONE)
      {
        bool parityVal = __builtin_parity(dataCopy);
        if (m_parity == EVEN)
        {
          parityVal = !parityVal;
        }
        m_txBitManipulations[9] = parityVal ? &SoftSerial::txBitHigh : &SoftSerial::txBitLow;
      }
      else
      {
        m_txBitManipulations[9] = &SoftSerial::txBitHigh;
      }
      m_txBitManipulations[10] = &SoftSerial::txBitHigh;
      m_txBitManipulations[11] = &SoftSerial::txBitHigh;

      m_txBitIndex = 0;
    }
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::txBitLow()
{
  m_txPin.low();
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::txBitHigh()
{
  m_txPin.high();
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::processISR()
{
  /*** RX Handling ***/
  if (m_rxBitIndex == 255)
  {
    return;
  }

  m_isrCounter++;
  if (m_isrCounter >= OVERSAMPLE)
  {
    m_isrCounter = 0;
  }

  if (m_rxBitIndex == 254)
  {
    if (!m_rxPin.read())
    {
      uint8_t nextSample = m_isrCounter + 1;
      if (nextSample == OVERSAMPLE)
      {
        nextSample = 0;
      }
      m_rxISRPoint = nextSample;
      m_rxBitIndex = 0;
      m_receivedData = 0;
    }
  }
  else if (m_rxBitIndex < m_expectedBits)
  {
    if (m_isrCounter == m_rxISRPoint)
    {
      if (m_rxPin.read())
      {
        m_receivedData |= (1 << m_rxBitIndex);
      }
      m_rxBitIndex++;
      if (m_rxBitIndex >= m_expectedBits)
      {
        const uint16_t receivedData = m_receivedData;
        m_rxTempQueue.push(receivedData);
        m_rxBitIndex = 255;
      }
    }
  }

  if ((m_txBitIndex != 255) && (m_isrCounter == 0))
  {
    (this->*m_txBitManipulations[m_txBitIndex])();
    m_txBitIndex++;

    if (m_txBitIndex >= m_expectedBits)
    {
      m_txBitIndex = 255;
    }
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::available()
{
  SafeInterrupts::ScopedDisable guard;
  return m_rxQueue.available();
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::read()
{
  SafeInterrupts::ScopedDisable guard;
  uint8_t data;
  return m_rxQueue.pop(data) ? data : -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::peek()
{
  SafeInterrupts::ScopedDisable guard;
  uint8_t data;
  return m_rxQueue.peek(data) ? data : -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::flush() {}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline size_t SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::write(uint8_t data)
{
  SafeInterrupts::ScopedDisable guard;

  return m_txQueue.push(data) ? 1 : 0;
}

#endif