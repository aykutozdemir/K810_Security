/**
 * @file SoftSerial.h
 * @brief Software serial communication implementation for Arduino.
 *
 * This file defines the SoftSerial class, which provides software-based asynchronous serial
 * communication for Arduino. It supports configurable baud rates, parity modes, and stop bits.
 * The implementation uses efficient bit manipulation and interrupt handling for reliable
 * communication without requiring hardware UART.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef SOFTSERIAL_H
#define SOFTSERIAL_H

#include <Arduino.h>
#include <Stream.h>
#include <FastPin.h>
#include <FastCircularQueue.h>
#include "DriverBase.h"

/**
 * @brief Enum for specifying the parity mode.
 */
enum ParityMode
{
  NONE, ///< No parity
  EVEN, ///< Even parity
  ODD   ///< Odd parity
};

/**
 * @brief Enum for specifying the baud rate.
 */
enum BaudRate : uint8_t
{
  BAUD_1200 = 0,  ///< 1200 baud
  BAUD_2400 = 1,  ///< 2400 baud
  BAUD_4800 = 2,  ///< 4800 baud
  BAUD_9600 = 3,  ///< 9600 baud
  BAUD_19200 = 4, ///< 19200 baud
  BAUD_38400 = 5, ///< 38400 baud
  BAUD_57600 = 6, ///< 57600 baud
  BAUD_115200 = 7 ///< 115200 baud
};

/**
 * @brief Software serial class for asynchronous serial communication.
 *
 * @tparam RX_BUFFER_SIZE Size of the RX buffer.
 * @tparam TX_BUFFER_SIZE Size of the TX buffer.
 */
template <uint8_t RX_BUFFER_SIZE, uint8_t TX_BUFFER_SIZE>
class SoftSerial : public Stream, public DriverBase
{
public:
  /**
   * @brief Type definition for the timer setup callback function.
   */
  typedef void (*TimerSetupCallback)(const unsigned long period);

  /**
   * @brief Constructs a SoftSerial object with specified RX and TX pins.
   *
   * @param rxPin The pin number for RX.
   * @param txPin The pin number for TX.
   */
  SoftSerial(const uint8_t rxPin, const uint8_t txPin);

  /**
   * @brief Initializes the SoftSerial communication with specified parameters.
   *
   * @param timerSetupCallback Callback function to set up the timer.
   * @param baudRate The baud rate for communication.
   * @param stopBits The number of stop bits.
   * @param parity The parity mode.
   */
  inline void begin(TimerSetupCallback timerSetupCallback,
                    const BaudRate baudRate,
                    const uint8_t stopBits = 1,
                    const ParityMode parity = NONE);

  /**
   * @brief Ends the SoftSerial communication.
   */
  inline void end();

  /**
   * @brief Interrupt Service Routine to handle RX and TX bit processing.
   */
  inline void processISR();

  /**
   * @brief Returns the number of bytes available for reading.
   *
   * @return The number of bytes available in the RX queue.
   */
  inline int available() override;

  /**
   * @brief Reads a byte from the RX queue.
   *
   * @return The byte read, or -1 if no data is available.
   */
  inline int read() override;

  /**
   * @brief Peeks at the next byte in the RX queue without removing it.
   *
   * @return The next byte, or -1 if no data is available.
   */
  inline int peek() override;

  /**
   * @brief Flushes the TX buffer.
   */
  inline void flush() override;

  /**
   * @brief Writes a byte to the TX queue.
   *
   * @param data The byte to write.
   * @return 1 if the byte was successfully written, 0 otherwise.
   */
  inline size_t write(uint8_t data) override;

  /**
   * @brief Main loop function to handle RX and TX operations.
   */
  void loop();

private:
  /**
   * @brief Bit-packed flags structure to save RAM.
   */
  struct SerialFlags
  {
    uint8_t parityType : 2;   ///< Parity type: 0=none, 1=even, 2=odd
    uint8_t stopBitCount : 2; ///< Number of stop bits: 1-3
    uint8_t baudRate : 3;     ///< Encoded baud rate (see BaudRate enum)
  } __attribute__((packed));

  // Declare PROGMEM strings for error messages
  static const char SOFT_SERIAL_BAUD_TOO_HIGH[] PROGMEM; ///< Error message for baud rate too high
  static const char SOFT_SERIAL_START_BIT_ERR[] PROGMEM; ///< Error message for start bit error
  static const char SOFT_SERIAL_STOP_BIT_ERR[] PROGMEM;  ///< Error message for stop bit error
  static const char SOFT_SERIAL_PARITY_ERR[] PROGMEM;    ///< Error message for parity error
  static const char SOFT_SERIAL_RX_BUF_FULL[] PROGMEM;   ///< Error message for RX buffer full

  /**
   * @brief Helper method to convert between baud rate and code.
   *
   * @param baudRate The baud rate to convert.
   * @return The corresponding BaudRate code.
   */
  static BaudRate getBaudRateCode(const unsigned long baudRate);

  /**
   * @brief Helper method to convert between code and baud rate.
   *
   * @param code The BaudRate code to convert.
   * @return The corresponding baud rate.
   */
  static unsigned long getBaudRateValue(const BaudRate code);

  FastCircularQueue<uint8_t, RX_BUFFER_SIZE> m_rxQueue;      ///< RX buffer queue
  FastCircularQueue<uint8_t, TX_BUFFER_SIZE> m_txQueue;      ///< TX buffer queue
  FastCircularQueue<uint16_t, RX_BUFFER_SIZE> m_rxTempQueue; ///< Temporary RX buffer queue

  uint16_t m_receivedData; ///< Stores received data bits

  volatile uint8_t m_rxBitIndex; ///< Index for RX bit processing
  volatile uint8_t m_txBitIndex; ///< Index for TX bit processing
  uint8_t m_txIsrCounter;        ///< Counter for TX ISR timing
  uint8_t m_rxIsrCounter;        ///< Counter for RX ISR timing
  uint8_t m_expectedBits;        ///< Number of expected bits per frame

  SerialFlags m_flags; ///< Bit-packed structure for serial configuration flags

  volatile bool m_txBitChanges[12]; ///< Array to track TX bit changes

  const FastPin m_rxPin; ///< RX pin object
  const FastPin m_txPin; ///< TX pin object
};

#include "SoftSerial.hpp"

#endif
