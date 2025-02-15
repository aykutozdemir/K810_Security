#ifndef SOFTSERIAL_HPP
#define SOFTSERIAL_HPP

#include "SoftSerial.h"
#include <SafeInterrupts.h>

#define OVERSAMPLE 3

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SoftSerial(const uint8_t rxPin, const uint8_t txPin,
                                                       FastCircularQueue<uint8_t, RX_BUFFER_SIZE> &rxQueue,
                                                       FastCircularQueue<uint8_t, TX_BUFFER_SIZE> &txQueue)
    : m_rxPin(rxPin, false, true), m_txPin(txPin, true), m_rxQueue(rxQueue), m_txQueue(txQueue),
      m_baudRate(9600), m_stopBits(1), m_parity(NONE),
      m_isrCounter(0), m_rxISRPoint(0), m_rxBitIndex(255), m_receivedData(0), m_txBitIndex(255), m_txData(0) {}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::begin(const unsigned long baudRate,
                                                       TimerSetupCallback timerSetupCallback,
                                                       const uint8_t stopBits, const ParityMode parity)
{
  SafeInterrupts::ScopedDisable guard;

  m_baudRate = baudRate;
  m_stopBits = stopBits;
  m_parity = parity;

  m_rxQueue.clear();
  m_txQueue.clear();

  m_rxBitIndex = 254;
  m_txPin.high();

  const unsigned long bitPeriod = (F_CPU + baudRate / 2UL) / baudRate;

  timerSetupCallback(bitPeriod / OVERSAMPLE);
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::end()
{
  m_rxBitIndex = 255;
  m_txBitIndex = 255;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::processISR()
{
  /*** RX Handling ***/
  if (m_rxBitIndex == 255)
  {
    return;
  }

  m_isrCounter++;
  if (m_isrCounter == OVERSAMPLE)
  {
    m_isrCounter = 0;
  }

  if (m_rxBitIndex == 254)
  {
    if (!m_rxPin.read())
    { // Start bit detected
      uint8_t nextSample = m_isrCounter + 1;
      if (nextSample == OVERSAMPLE)
      {
        nextSample = 0;
      }
      m_rxISRPoint = nextSample;
      m_rxBitIndex = 0;
    }
  }
  else if (m_rxBitIndex == 0)
  {
    // Only check at the optimal sample time
    if (m_isrCounter == m_rxISRPoint)
    {
      // Confirm the start bit
      if (!m_rxPin.read())
      {
        m_rxBitIndex = 1;
        m_receivedData = 0;
      }
      else
      {
        // False trigger, abort start bit reception
        m_rxBitIndex = 254;
      }
    }
  }
  else if (m_rxBitIndex <= 8)
  { // Receiving data bits (LSB first)
    if (m_isrCounter == m_rxISRPoint)
    {
      const bool pinVal = m_rxPin.read();
      m_receivedData |= (static_cast<uint8_t>(pinVal) << (m_rxBitIndex - 1));
      m_rxBitIndex++;
    }
  }
  else
  { // Parity check and store data
    if (m_isrCounter == m_rxISRPoint)
    {
      bool store = true;
      const bool pinVal = m_rxPin.read();

      if (m_parity != NONE)
      {
        bool parityVal = __builtin_parity(m_receivedData);
        if (m_parity == EVEN)
        {
          parityVal = !parityVal;
        }
        if (pinVal != parityVal)
        {
          store = false;
        }
      }

      if (store)
      {
        if (!m_rxQueue.isFull())
        {

          uint8_t receivedData = m_receivedData;
          m_rxQueue.push(receivedData);
        }
      }

      m_rxBitIndex = 254; // Ready for next byte
    }
  }

  /*** TX Handling ***/
  if ((m_txBitIndex != 255) && (m_isrCounter == 0))
  {
    switch (m_txBitIndex)
    {
    case 0:
      m_txPin.low(); // Start bit
      m_txDataCopy = m_txData;
      break;

    case 1 ... 8:
      m_txPin.set(m_txData & 0x01); // Data bits (LSB first)
      m_txData >>= 1;
      break;

    case 9:
      if (m_parity != NONE)
      {
        m_txPin.set((m_parity == EVEN) ? !__builtin_parity(m_txDataCopy) : __builtin_parity(m_txDataCopy)); // Parity bit
      }
      else
      {
        // If no parity, immediately move to stop bits
        ++m_txBitIndex;
        m_txPin.high(); // First stop bit
        if (m_stopBits == 1)
        {
          ++m_txBitIndex; // Transmission complete with 1 stop bit
        }
      }
      break;

    case 10:
      if (m_parity != NONE)
      {
        m_txPin.high(); // First stop bit after parity
        if (m_stopBits == 1)
        {
          ++m_txBitIndex; // Stop transmission if only one stop bit
        }
      }
      else if (m_stopBits == 2)
      {
        m_txPin.high(); // Second stop bit (for cases with no parity)
      }
      break;

    case 11: // Second Stop Bit (when parity is used and 2 stop bits are required)
      if (m_parity != NONE && m_stopBits == 2)
      {
        m_txPin.high(); // Second stop bit
      }
      break;

    default:
      m_txBitIndex = 255; // Safety check: Ensure TX is disabled
      break;
    }

    if (m_txBitIndex == 255)
    {
      uint8_t data;
      if (m_txQueue.pop(data))
      {
        m_txData = data;
        m_txBitIndex = 0;
      }
    }
    else
    {
      ++m_txBitIndex;
    }
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::available()
{
  SafeInterrupts::ScopedDisable guard;

  const int availableBytes = m_rxQueue.available();

  return availableBytes;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::read()
{
  SafeInterrupts::ScopedDisable guard;

  uint8_t data;
  if (m_rxQueue.pop(data))
  {
    return data;
  }

  return -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::peek()
{
  SafeInterrupts::ScopedDisable guard;

  uint8_t data;
  if (m_rxQueue.peek(data))
  {
    return data;
  }

  return -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::flush() {}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
size_t SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::write(uint8_t data)
{
  SafeInterrupts::ScopedDisable guard;

  const bool result = m_txQueue.push(data);

  if (m_txBitIndex == 255)
  {
    uint8_t data;
    if (m_txQueue.pop(data))
    {
      m_txData = data;
      m_txBitIndex = 0;
    }
  }

  return result ? 1 : 0;
}

#endif