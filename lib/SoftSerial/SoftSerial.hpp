/**
 * @file SoftSerial.hpp
 * @brief Implementation file for the SoftSerial class.
 *
 * This file contains the implementation of the SoftSerial class methods for software-based
 * asynchronous serial communication. It handles bit-level operations, timing, and the
 * interrupt service routine for transmitting and receiving data.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef SOFTSERIAL_HPP
#define SOFTSERIAL_HPP

#include "SoftSerial.h"
#include <SafeInterrupts.h>
#include <Utilities.h>

/** @brief Sampling constant for RX processing */
constexpr uint8_t SAMPLE = 1;

/** @brief Oversampling factor for increased accuracy */
constexpr uint8_t OVERSAMPLE = 3;

/** @brief Half of the oversample value for timing adjustments */
constexpr uint8_t OVERSAMPLE_SHIFT = (OVERSAMPLE / 2);

/** @brief Threshold for determining if a baud rate is too high */
constexpr uint8_t OVERSAMPLE_THRESHOLD = 30;

/** @brief Special index value indicating uninitialized state */
constexpr uint8_t UNINITIALIZED_INDEX = 255;

/** @brief Special index value indicating initialized but inactive state */
constexpr uint8_t INITIALIZED_INDEX = 254;

// Define PROGMEM strings for error messages
template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_PREFIX[] PROGMEM = "SS: ";

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_BAUD_TOO_HIGH[] PROGMEM = "Baud too high";

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_START_BIT_ERR[] PROGMEM = "Start bit err";

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_STOP_BIT_ERR[] PROGMEM = "Stop bit err";

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_PARITY_ERR[] PROGMEM = "Parity err";

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
const char SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SOFT_SERIAL_RX_BUF_FULL[] PROGMEM = "RX buf full";

// Implementation of baud rate conversion methods
template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
BaudRate SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::getBaudRateCode(const unsigned long baudRate)
{
  if (baudRate <= 1200)
    return BAUD_1200;
  if (baudRate <= 2400)
    return BAUD_2400;
  if (baudRate <= 4800)
    return BAUD_4800;
  if (baudRate <= 9600)
    return BAUD_9600;
  if (baudRate <= 19200)
    return BAUD_19200;
  if (baudRate <= 38400)
    return BAUD_38400;
  if (baudRate <= 57600)
    return BAUD_57600;
  return BAUD_115200;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
unsigned long SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::getBaudRateValue(const BaudRate code)
{
  switch (code)
  {
  case BAUD_1200:
    return 1200;
  case BAUD_2400:
    return 2400;
  case BAUD_4800:
    return 4800;
  case BAUD_9600:
    return 9600;
  case BAUD_19200:
    return 19200;
  case BAUD_38400:
    return 38400;
  case BAUD_57600:
    return 57600;
  case BAUD_115200:
    return 115200;
  default:
    return 9600;
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::SoftSerial(const uint8_t rxPin, const uint8_t txPin)
    : Stream(), DriverBase(), // Call both parent constructors
      m_receivedData(0), m_rxBitIndex(UNINITIALIZED_INDEX), m_txBitIndex(UNINITIALIZED_INDEX),
      m_txIsrCounter(OVERSAMPLE), m_rxIsrCounter(SAMPLE), m_expectedBits(10),
      m_rxPin(rxPin, false, true), m_txPin(txPin, true)
{
  // Initialize flags
  m_flags.parityType = NONE;
  m_flags.stopBitCount = 1;
  m_flags.baudRate = BAUD_9600;

  // Initialize bit changes array
  for (uint8_t i = 0; i < sizeof(m_txBitChanges); i++)
  {
    m_txBitChanges[i] = false;
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::begin(const TimerSetupCallback timerSetupCallback,
                                                              const BaudRate baudRate,
                                                              const uint8_t stopBits,
                                                              const ParityMode parity)
{
  SafeInterrupts::ScopedDisable guard;

  // Store configuration in bit fields
  m_flags.stopBitCount = stopBits;
  m_flags.parityType = parity;
  m_flags.baudRate = baudRate;

  // Calculate expected bits
  m_expectedBits = 1 /*start*/ + 8 /*data*/ + ((parity != NONE) ? 1 : 0) + stopBits;

  const unsigned long actualBaudRate = getBaudRateValue(static_cast<BaudRate>(m_flags.baudRate));
  const uint32_t bitPeriod = (F_CPU + (actualBaudRate / 2UL)) / actualBaudRate;
  const uint16_t oversampleBitPeriod = ((bitPeriod + (OVERSAMPLE / 2UL)) / OVERSAMPLE) + 1;

  if (oversampleBitPeriod < OVERSAMPLE_THRESHOLD)
  {
    printError(PGMT(SOFT_SERIAL_BAUD_TOO_HIGH));
    return;
  }

  m_rxQueue.clear();
  m_txQueue.clear();
  m_rxTempQueue.clear();

  m_txPin.high();
  m_txBitIndex = UNINITIALIZED_INDEX;

  m_rxBitIndex = INITIALIZED_INDEX;

  timerSetupCallback(oversampleBitPeriod);
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
  DriverBase::loop();

  for (uint8_t i = 0; (i < 8) && !m_rxQueue.isFull(); i++)
  {
    uint16_t frame;
    {
      SafeInterrupts::ScopedDisable guard;
      if (!m_rxTempQueue.pop(frame))
        break;
    }

    bool hasError = false;

    // In the ISR, bits are stored with decreasing rxBitIndex:
    // - Start bit is stored at position (m_expectedBits-1) [highest bit]
    // - Data bits are at positions (m_expectedBits-2) down to (m_expectedBits-9)
    // - Parity bit (if present) is at position (m_expectedBits-10)
    // - Stop bits are at positions (m_expectedBits-11) and lower [lowest bits]

    // Check start bit - should be 0 (low)
    if ((frame & (1 << (m_expectedBits - 1))) != 0)
    {
      printError(PGMT(SOFT_SERIAL_START_BIT_ERR));
      hasError = true;
    }

    // Check stop bits - should be 1 (high)
    if (!hasError)
    {
      for (uint8_t s = 0; s < m_flags.stopBitCount; s++)
      {
        // Stop bits are at the lowest positions
        if ((frame & (1 << s)) == 0)
        {
          printError(PGMT(SOFT_SERIAL_STOP_BIT_ERR));
          hasError = true;
          break;
        }
      }
    }

    if (hasError)
      continue;

    // Extract data bits and reverse their order (UART sends LSB first)
    uint8_t data = 0;
    for (uint8_t bitIndex = 0; bitIndex < 8; bitIndex++)
    {
      // Data bits are at positions (m_expectedBits-2) to (m_expectedBits-9)
      const uint8_t isrBitPos = m_expectedBits - 2 - bitIndex;

      // The bit position in the data byte (reverse order because UART sends LSB first)
      if ((frame & (static_cast<uint16_t>(1) << isrBitPos)) != 0)
      {
        data |= (1 << bitIndex);
      }
    }

    if (m_flags.parityType != NONE)
    {
      // Parity bit is at position (m_expectedBits-10)
      const uint8_t parityBitPos = m_expectedBits - 10;
      const uint8_t parityBit = (frame & (1 << parityBitPos)) ? 1 : 0;

      bool computedParity = __builtin_parity(data);
      if (m_flags.parityType == EVEN)
        computedParity = !computedParity;

      if (parityBit != computedParity)
      {
        printError(PGMT(SOFT_SERIAL_PARITY_ERR));
        continue;
      }
    }

    if (!m_rxQueue.push(data))
    {
      printError(PGMT(SOFT_SERIAL_RX_BUF_FULL));
    }
  }

  if (m_txBitIndex == UNINITIALIZED_INDEX)
  {
    uint8_t data;
    if (m_txQueue.pop(data))
    {
      // Reset bit changes
      for (uint8_t i = 0; i < sizeof(m_txBitChanges); i++)
      {
        m_txBitChanges[i] = false;
      }

      // The ISR processes txBitIndex from high to low (m_expectedBits down to 0)
      // and toggles the pin when m_txBitChanges[txBitIndex] is true.
      // We need to populate m_txBitChanges to create the correct UART signal.
      uint8_t currentBit = m_expectedBits;

      // Initialize with current pin state (high for idle)
      bool currentState = true;

      // Start bit always requires a transition (high→low)
      m_txBitChanges[--currentBit] = true;
      currentState = false; // Pin state after start bit is low

      // Set transitions for data bits (LSB first in UART)
      for (uint8_t i = 0; i < 8; i++)
      {
        const bool bitVal = (data & (1 << i)) != 0;
        currentBit--;
        if (bitVal != currentState)
        {
          m_txBitChanges[currentBit] = true;
          currentState = bitVal;
        }
      }

      // Set transition for parity bit if needed
      if (m_flags.parityType != NONE)
      {
        bool parityVal = __builtin_parity(data);
        if (m_flags.parityType == EVEN)
          parityVal = !parityVal;

        currentBit--;
        if (parityVal != currentState)
        {
          m_txBitChanges[currentBit] = true;
          currentState = parityVal;
        }
      }

      // First stop bit always transitions to high if not already high
      currentBit--;
      if (!currentState)
      {
        m_txBitChanges[currentBit] = true;
        currentState = true;
      }

      // TX is processed in reverse order in the ISR, so we need to set the
      // index to the highest position in our transition array
      m_txBitIndex = m_expectedBits;
    }
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::processISR()
{
  register uint8_t rxBitIndex = m_rxBitIndex;

  if (rxBitIndex == UNINITIALIZED_INDEX)
    return;

  const uint8_t rxState = m_rxPin.read();

  register uint8_t txBitIndex = m_txBitIndex;
  if (txBitIndex != UNINITIALIZED_INDEX)
  {
    if (--m_txIsrCounter == 0)
    {
      m_txIsrCounter = OVERSAMPLE;

      if (txBitIndex > 0)
      {
        if (m_txBitChanges[--txBitIndex])
        {
          m_txPin.toggle();
        }
      }
      else
      {
        m_txPin.high();
        txBitIndex = UNINITIALIZED_INDEX;
      }
      m_txBitIndex = txBitIndex;
    }
  }

  if (--m_rxIsrCounter == 0)
  {
    m_rxIsrCounter = SAMPLE;

    if (rxBitIndex == INITIALIZED_INDEX)
    {
      if (rxState == LOW)
      {
        rxBitIndex = m_expectedBits;
        m_receivedData = 0;
        m_rxIsrCounter = OVERSAMPLE_SHIFT;
      }
    }
    else if (rxBitIndex > 0)
    {
      m_receivedData |= static_cast<uint16_t>(rxState) << (--rxBitIndex);

      if (rxBitIndex > 0)
      {
        m_rxIsrCounter = OVERSAMPLE;
      }
      else
      {
        m_rxTempQueue.push(m_receivedData);
        rxBitIndex = INITIALIZED_INDEX;
      }
    }
    m_rxBitIndex = rxBitIndex;
  }
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::available()
{
  return m_rxQueue.available();
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::read()
{
  uint8_t data;
  return m_rxQueue.pop(data) ? data : -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline int SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::peek()
{
  uint8_t data;
  return m_rxQueue.peek(data) ? data : -1;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::flush() {}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
inline size_t SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::write(uint8_t data)
{
  return m_txQueue.push(data) ? 1 : 0;
}

template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
void SoftSerial<RX_BUFFER_SIZE, TX_BUFFER_SIZE>::printError(const __FlashStringHelper *errProgmem)
{
  if (errProgmem != nullptr)
  {
    debugPrint(PGMT(SOFT_SERIAL_PREFIX), nullptr, false);
  }
  debugPrint(errProgmem, nullptr, true);
}

#endif