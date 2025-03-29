/*
  I2C.h   - I2C library
  Copyright (c) 2011-2012 Wayne Truchsess.  All right reserved.
  Rev 5.0 - January 24th, 2012
          - Removed the use of interrupts completely from the library
            so TWI state changes are now polled.
          - Added calls to lockup() function in most functions
            to combat arbitration problems
          - Fixed scan() procedure which left timeouts enabled
            and set to 80msec after exiting procedure
          - Changed scan() address range back to 0 - 0x7F
          - Removed all Wire legacy functions from library
          - A big thanks to Richard Baldwin for all the testing
            and feedback with debugging bus lockups!
  Rev 4.0 - January 14th, 2012
          - Updated to make compatible with 8MHz clock frequency
  Rev 3.0 - January 9th, 2012
          - Modified library to be compatible with Arduino 1.0
          - Changed argument type from boolean to uint8_t in pullUp(),
            setSpeed() and receiveByte() functions for 1.0 compatability
          - Modified return values for timeout feature to report
            back where in the transmission the timeout occured.
          - added function scan() to perform a bus scan to find devices
            attached to the I2C bus.  Similar to work done by Todbot
            and Nick Gammon
  Rev 2.0 - September 19th, 2011
          - Added support for timeout function to prevent
            and recover from bus lockup (thanks to PaulS
            and CrossRoads on the Arduino forum)
          - Changed return type for stop() from void to
            uint8_t to handle timeOut function
  Rev 1.0 - August 8th, 2011

  This is a modified version of the Arduino Wire/TWI
  library.  Functions were rewritten to provide more functionality
  and also the use of Repeated Start.  Some I2C devices will not
  function correctly without the use of a Repeated Start.  The
  initial version of this library only supports the Master.


  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

/**
 * @file I2C.h
 * @brief Enhanced I2C/TWI library for Arduino.
 *
 * This library provides more functionality than the standard Wire library,
 * including support for repeated start conditions and bus timeout detection.
 * It is designed for I2C master mode operation.
 *
 * @author Wayne Truchsess
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef I2C_h
#define I2C_h

#if (ARDUINO >= 100)
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include <inttypes.h>
#include "Traceable.h"
#include "../SimpleTimer/SimpleTimer.h"

/**
 * @name TWI Status Codes
 * @brief TWI/I2C status codes for tracking communication state
 * @{
 */
#define START 0x08          ///< START condition transmitted
#define REPEATED_START 0x10 ///< Repeated START condition transmitted
#define MT_SLA_ACK 0x18     ///< SLA+W transmitted, ACK received
#define MT_SLA_NACK 0x20    ///< SLA+W transmitted, NACK received
#define MT_DATA_ACK 0x28    ///< Data transmitted, ACK received
#define MT_DATA_NACK 0x30   ///< Data transmitted, NACK received
#define MR_SLA_ACK 0x40     ///< SLA+R transmitted, ACK received
#define MR_SLA_NACK 0x48    ///< SLA+R transmitted, NACK received
#define MR_DATA_ACK 0x50    ///< Data received, ACK returned
#define MR_DATA_NACK 0x58   ///< Data received, NACK returned
#define LOST_ARBTRTN 0x38   ///< Arbitration lost
/** @} */

#define TWI_STATUS (TWSR & 0xF8)                    ///< Get TWI status code from status register
#define SLA_W(address) (address << 1)               ///< Format address for write operation
#define SLA_R(address) ((address << 1) + 0x01)      ///< Format address for read operation
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit)) ///< Clear bit in register
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))  ///< Set bit in register

#define MAX_BUFFER_SIZE 32 ///< Maximum buffer size for I2C data

/**
 * @brief Enhanced I2C master library for Arduino
 *
 * This class provides I2C master functionality with support for repeated start
 * conditions, timeouts to detect and recover from bus lockups, and utility functions
 * for common I2C operations.
 */
class I2C : public Traceable
{
public:
  /**
   * @brief Constructor
   */
  I2C();

  /**
   * @brief Initialize the I2C bus
   */
  void begin();

  /**
   * @brief Close the I2C bus
   */
  void end();

  /**
   * @brief Set timeout duration for I2C operations
   *
   * @param timeOut Timeout in milliseconds (0 to disable timeout)
   */
  void timeOut(uint16_t timeOut);

  /**
   * @brief Set I2C bus speed
   *
   * @param fast 0 for 100kHz, 1 for 400kHz
   */
  void setSpeed(uint8_t fast);

  /**
   * @brief Enable or disable internal pullup resistors
   *
   * @param activate 0 to disable pullups, 1 to enable pullups
   */
  void pullup(uint8_t activate);

  /**
   * @brief Scan the I2C bus for connected devices
   *
   * This function outputs a list of I2C addresses with responding devices
   */
  void scan();

  /**
   * @brief Get number of bytes available to read
   *
   * @return Number of bytes available
   */
  uint8_t available();

  /**
   * @brief Read a byte from the receive buffer
   *
   * @return Next byte in the receive buffer
   */
  uint8_t receive();

  /**
   * @brief Write to a device without sending a register address
   *
   * @param address 7-bit I2C address
   * @return Status code
   */
  uint8_t write(uint8_t address);

  /**
   * @brief Write to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress);

  /**
   * @brief Write to a device register using int parameters
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @return Status code
   */
  uint8_t write(int address, int registerAddress);

  /**
   * @brief Write a byte to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data Byte to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, uint8_t data);

  /**
   * @brief Write a byte to a device register using int parameters
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data Byte to write
   * @return Status code
   */
  uint8_t write(int address, int registerAddress, int data);

  /**
   * @brief Write a string to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data String to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, const char *data);

  /**
   * @brief Write a 16-bit value to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data 16-bit value to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, uint16_t data);

  /**
   * @brief Write a 32-bit value to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data 32-bit value to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, uint32_t data);

  /**
   * @brief Write a 64-bit value to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data 64-bit value to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, uint64_t data);

  /**
   * @brief Write a buffer to a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param data Buffer of data to write
   * @param numberBytes Number of bytes to write
   * @return Status code
   */
  uint8_t write(uint8_t address, uint8_t registerAddress, const uint8_t *data, uint8_t numberBytes);

  /**
   * @brief Read from a device without specifying a register
   *
   * @param address 7-bit I2C address
   * @param numberBytes Number of bytes to read
   * @return Status code
   */
  uint8_t read(uint8_t address, uint8_t numberBytes);

  /**
   * @brief Read from a device using int parameters
   *
   * @param address 7-bit I2C address
   * @param numberBytes Number of bytes to read
   * @return Status code
   */
  uint8_t read(int address, int numberBytes);

  /**
   * @brief Read from a device register
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param numberBytes Number of bytes to read
   * @return Status code
   */
  uint8_t read(uint8_t address, uint8_t registerAddress, uint8_t numberBytes);

  /**
   * @brief Read from a device register using int parameters
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param numberBytes Number of bytes to read
   * @return Status code
   */
  uint8_t read(int address, int registerAddress, int numberBytes);

  /**
   * @brief Read from a device into a buffer
   *
   * @param address 7-bit I2C address
   * @param numberBytes Number of bytes to read
   * @param dataBuffer Buffer to store read data
   * @return Status code
   */
  uint8_t read(uint8_t address, uint8_t numberBytes, uint8_t *dataBuffer);

  /**
   * @brief Read from a device into a buffer with extended size
   *
   * @param address 7-bit I2C address
   * @param numberBytes Number of bytes to read (16-bit for larger transfers)
   * @param dataBuffer Buffer to store read data
   * @return Status code
   */
  uint8_t readex(uint8_t address, uint16_t numberBytes, uint8_t *dataBuffer);

  /**
   * @brief Read from a device register into a buffer
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param numberBytes Number of bytes to read
   * @param dataBuffer Buffer to store read data
   * @return Status code
   */
  uint8_t read(uint8_t address, uint8_t registerAddress, uint8_t numberBytes, uint8_t *dataBuffer);

  /**
   * @brief Read from a device register into a buffer with extended size
   *
   * @param address 7-bit I2C address
   * @param registerAddress Register address
   * @param numberBytes Number of bytes to read (16-bit for larger transfers)
   * @param dataBuffer Buffer to store read data
   * @return Status code
   */
  uint8_t readex(uint8_t address, uint8_t registerAddress, uint16_t numberBytes, uint8_t *dataBuffer);

  /**
   * @brief Helper function to send data to a device
   *
   * @param address 7-bit I2C address
   * @param data Buffer of data to send
   * @param length Number of bytes to send
   * @return Status code
   */
  uint8_t sendData(uint8_t address, const uint8_t *data, uint8_t length);

  /**
   * @brief Helper function to receive data from a device
   *
   * @param address 7-bit I2C address
   * @param buffer Buffer to store received data
   * @param length Number of bytes to receive
   * @return Status code
   */
  uint8_t receiveData(uint8_t address, uint8_t *buffer, uint8_t length);

  /**
   * @name 16-bit Register Functions
   * @brief Functions for working with 16-bit device registers
   * @{
   */
  uint8_t write16(uint8_t address, uint16_t registerAddress);
  uint8_t write16(uint8_t address, uint16_t registerAddress, uint8_t data);
  uint8_t write16(uint8_t address, uint16_t registerAddress, const char *data);
  uint8_t write16(uint8_t address, uint16_t registerAddress, uint16_t data);
  uint8_t write16(uint8_t address, uint16_t registerAddress, uint32_t data);
  uint8_t write16(uint8_t address, uint16_t registerAddress, uint64_t data);
  uint8_t write16(uint8_t address, uint16_t registerAddress, const uint8_t *data, uint8_t numberBytes);
  uint8_t read16(uint8_t address, uint16_t registerAddress, uint8_t numberBytes);
  uint8_t read16(uint8_t address, uint16_t registerAddress, uint8_t numberBytes, uint8_t *dataBuffer);
  /** @} */

  /**
   * @name Low-level I2C Methods
   * @brief Low-level functions for I2C communication
   * @{
   */

  /**
   * @brief Generate a START condition on the I2C bus
   *
   * @return Status code
   */
  uint8_t _start();

  /**
   * @brief Send a device address on the I2C bus
   *
   * @param address 7-bit address with R/W bit
   * @return Status code
   */
  uint8_t _sendAddress(uint8_t address);

  /**
   * @brief Send a byte on the I2C bus
   *
   * @param data Byte to send
   * @return Status code
   */
  uint8_t _sendByte(uint8_t data);

  /**
   * @brief Receive a byte from the I2C bus
   *
   * @param ack Whether to send ACK (1) or NACK (0) after receiving
   * @return Status code
   */
  uint8_t _receiveByte(uint8_t ack);

  /**
   * @brief Receive a byte from the I2C bus into a buffer
   *
   * @param ack Whether to send ACK (1) or NACK (0) after receiving
   * @param target Pointer to store the received byte
   * @return Status code
   */
  uint8_t _receiveByte(uint8_t ack, uint8_t *target);

  /**
   * @brief Generate a STOP condition on the I2C bus
   *
   * @return Status code
   */
  uint8_t _stop();
  /** @} */

private:
  /**
   * @brief Handle bus lockup by resetting TWI hardware
   */
  void lockUp();

  static uint8_t returnStatus;          ///< Status code from last operation
  static uint8_t nack;                  ///< Whether a NACK was received
  static uint8_t data[MAX_BUFFER_SIZE]; ///< Buffer for received data
  static uint8_t bytesAvailable;        ///< Number of bytes available in buffer
  static uint8_t bufferIndex;           ///< Current index in buffer
  static uint8_t totalBytes;            ///< Total bytes in current transaction
  static SimpleTimer<uint8_t> timeoutTimer;  ///< Timer for timeout operations
};

/** Global instance of the I2C class */
extern I2C I2c;

#endif
