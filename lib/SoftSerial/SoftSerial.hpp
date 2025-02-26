#ifndef SOFTSERIAL_HPP
#define SOFTSERIAL_HPP

#include "SoftSerial.h"
#include <SafeInterrupts.h>

constexpr uint8_t OVERSAMPLE = 3;

constexpr uint8_t UNINITIALIZED_INDEX = 255;
constexpr uint8_t INITIALIZED_INDEX = 254;

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SoftSerial(const uint8_t rxPin, const uint8_t txPin)
    : m_rxPin(rxPin, false, true), m_txPin(txPin, true),
      m_baudRate(9600), m_stopBits(1), m_parity(NONE), m_expectedBits(0), m_errorCallback(nullptr),
      m_rxBitIndex(255), m_receivedData(0), m_rxIsrCounter(0), m_rxIsrTargetCounter(0),
      m_txBitIndex(255), m_txIsrCounter(0) {}

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

  // More precise bit timing calculation
  const uint32_t bitPeriod = (F_CPU + (baudRate / 2UL)) / baudRate;
  // Add a small adjustment for interrupt latency
  const uint16_t oversampleBitPeriod = ((bitPeriod + (OVERSAMPLE / 2UL)) / OVERSAMPLE) + 1;

  m_rxQueue.clear();
  m_txQueue.clear();
  m_rxTempQueue.clear();

  m_txPin.high();
  m_rxIsrCounter = 0;
  m_rxIsrTargetCounter = 1;
  m_txIsrCounter = 0;
  m_txBitIndex = UNINITIALIZED_INDEX;

  timerSetupCallback(oversampleBitPeriod);

  m_rxBitIndex = INITIALIZED_INDEX;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::end()
{
  m_rxBitIndex = UNINITIALIZED_INDEX;
  m_txBitIndex = UNINITIALIZED_INDEX;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::loop()
{
  // Process received data from temp queue to main queue
  while (true)
  {
    uint16_t frame;
    {
      SafeInterrupts::ScopedDisable guard;
      if (!m_rxTempQueue.pop(frame))
        break;
    }

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
      if (m_errorCallback)
        m_errorCallback(F("SoftSerial: Start bit error"));
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
      if (m_errorCallback)
        m_errorCallback(F("SoftSerial: Stop bit error"));
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
        if (m_errorCallback)
          m_errorCallback(F("SoftSerial: Parity error"));
        continue;
      }
    }

    {
      SafeInterrupts::ScopedDisable guard;
      m_rxQueue.push(data);
    }
  }

  // Handle transmission
  if (m_txBitIndex == UNINITIALIZED_INDEX)
  {
    uint8_t data;
    bool shouldProcess = false;
    {
      SafeInterrupts::ScopedDisable guard;
      shouldProcess = m_txQueue.pop(data);
    }

    if (shouldProcess)
    {
      // Clear all bit changes first
      for (uint8_t i = 0; i < sizeof(m_txBitChanges); i++)
      {
        m_txBitChanges[i] = false;
      }

      // Start bit (always transition from high to low)
      m_txBitChanges[0] = true;
      
      // Process data bits LSB first
      bool currentState = false;  // After start bit, we're in low state
      for (uint8_t i = 0; i < 8; i++)
      {
        const bool bitVal = (data & (1 << i)) != 0;
        if (currentState != bitVal)
        {
          m_txBitChanges[i + 1] = true;
          currentState = bitVal;
        }
      }

      // Handle parity if enabled
      if (m_parity != NONE)
      {
        bool parityVal = __builtin_parity(data);
        if (m_parity == EVEN)
        {
          parityVal = !parityVal;
        }
        if (currentState != parityVal)
        {
          m_txBitChanges[9] = true;
          currentState = parityVal;
        }
      }

      // Stop bits (always high)
      const uint8_t stopBitStart = (m_parity != NONE) ? 10 : 9;
      if (!currentState)  // If we're not already high
      {
        m_txBitChanges[stopBitStart] = true;
      }

      SafeInterrupts::ScopedDisable guard;
      m_txBitIndex = 0;
      m_txIsrCounter = 0;
    }
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::processISR()
{
  if (m_rxBitIndex == UNINITIALIZED_INDEX)
    return;

  const uint8_t rxState = m_rxPin.read();

  // Handle transmission
  if (m_txBitIndex != UNINITIALIZED_INDEX)
  {
    if (++m_txIsrCounter >= OVERSAMPLE)
    {
      m_txIsrCounter = 0;

      if (m_txBitIndex < m_expectedBits)
      {
        if (m_txBitChanges[m_txBitIndex])
        {
          m_txPin.toggle();
        }
        m_txBitIndex++;
      }
      else
      {
        m_txPin.high();  // Ensure we end in idle state
        m_txBitIndex = UNINITIALIZED_INDEX;
      }
    }
  }

  if (++m_rxIsrCounter >= m_rxIsrTargetCounter)
  {
    m_rxIsrCounter = 0;

    if (m_rxBitIndex == INITIALIZED_INDEX)
    {
      if (!rxState)
      {
        m_rxBitIndex = 0;
        m_receivedData = 0;
      }
    }
    else if (m_rxBitIndex < m_expectedBits)
    {
      if (rxState)
      {
        m_receivedData |= (1 << m_rxBitIndex);
      }
      m_rxBitIndex++;

      if (m_rxBitIndex < m_expectedBits)
      {
        m_rxIsrTargetCounter = OVERSAMPLE;
      }
      else
      {
        m_rxTempQueue.push(m_receivedData);
        m_rxBitIndex = INITIALIZED_INDEX;
        m_rxIsrTargetCounter = 1;
      }
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

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::setErrorCallback(ErrorCallback callback)
{
  m_errorCallback = callback;
}

#endif