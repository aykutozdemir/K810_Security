/**
 * @file LoopbackStream.h
 * @brief Defines a stream that buffers data internally and loops it back for reading.
 *
 * This file contains the LoopbackStream class which implements a Stream that
 * stores all written data in an internal buffer and makes it available for reading.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#pragma once

#include <Stream.h>

/**
 * @brief A stream that stores written data and returns it when read.
 *
 * A LoopbackStream stores all data written in an internal buffer and returns it back
 * when the stream is read. If the buffer overflows, the last bytes written are lost.
 * It can be used as a buffering layer between components.
 */
class LoopbackStream : public Stream
{
  uint8_t *buffer;      ///< Pointer to the internal buffer.
  uint16_t buffer_size; ///< Size of the internal buffer.
  uint16_t pos;         ///< Current read position in the buffer.
  uint16_t size;        ///< Number of bytes currently in the buffer.

public:
  /**
   * @brief Default buffer size constant.
   */
  static const uint16_t DEFAULT_SIZE = 64;

  /**
   * @brief Constructor with optional buffer size.
   *
   * @param buffer_size Size of the internal buffer (default is DEFAULT_SIZE).
   */
  explicit LoopbackStream(const uint16_t buffer_size = LoopbackStream::DEFAULT_SIZE);

  /**
   * @brief Destructor that frees the internal buffer.
   */
  ~LoopbackStream();

  /**
   * @brief Move constructor.
   *
   * @param other The LoopbackStream to move from.
   */
  LoopbackStream(LoopbackStream &&other) noexcept;

  /**
   * @brief Move assignment operator.
   *
   * @param other The LoopbackStream to move from.
   * @return Reference to this object.
   */
  LoopbackStream &operator=(LoopbackStream &&other) noexcept;

  // Delete copy operations
  LoopbackStream(const LoopbackStream &) = delete;
  LoopbackStream &operator=(const LoopbackStream &) = delete;

  /**
   * @brief Get the size of the internal buffer.
   *
   * @return Size of the internal buffer in bytes.
   */
  inline uint16_t bufferSize() const
  {
    return buffer_size;
  }

  /**
   * @brief Clear the internal buffer.
   */
  void clear();

  /**
   * @brief Write a byte to the buffer.
   *
   * @param data The byte to write.
   * @return Number of bytes written (1 on success, 0 if buffer is full).
   */
  virtual size_t write(uint8_t data) override;

  /**
   * @brief Get the number of bytes available for writing.
   *
   * @return Number of bytes that can be written before the buffer is full.
   */
  virtual int availableForWrite(void) override;

  /**
   * @brief Get the number of bytes available for reading.
   *
   * @return Number of bytes available to read.
   */
  virtual int available() override;

  /**
   * @brief Check if the buffer contains a specific character.
   *
   * @param ch The character to search for.
   * @return true if the character is found, false otherwise.
   */
  virtual bool contains(char ch);

  /**
   * @brief Read a byte from the buffer.
   *
   * @return The next byte in the buffer, or -1 if the buffer is empty.
   */
  virtual int read() override;

  /**
   * @brief Peek at the next byte in the buffer without removing it.
   *
   * @return The next byte in the buffer, or -1 if the buffer is empty.
   */
  virtual int peek() override;

  /**
   * @brief Flush the stream.
   *
   * This is a no-op for LoopbackStream as there is no external connection to flush.
   */
  virtual void flush() override;
};
