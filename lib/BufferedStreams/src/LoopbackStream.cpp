/**
 * @file LoopbackStream.cpp
 * @brief Implementation of the LoopbackStream class.
 *
 * This file contains the implementation of the LoopbackStream class which provides
 * a buffer that loops written data back for reading.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "LoopbackStream.h"

/**
 * @brief Constructor that allocates memory for the internal buffer.
 *
 * @param buffer_size Size of the buffer to allocate.
 */
LoopbackStream::LoopbackStream(uint16_t buffer_size)
{
  this->buffer = static_cast<uint8_t *>(malloc(buffer_size));
  this->buffer_size = buffer_size;
  this->pos = 0;
  this->size = 0;
}

/**
 * @brief Destructor that frees the allocated buffer.
 */
LoopbackStream::~LoopbackStream()
{
  free(buffer);
}

/**
 * @brief Move constructor that transfers ownership of the buffer.
 *
 * @param other The LoopbackStream to move from.
 */
LoopbackStream::LoopbackStream(LoopbackStream &&other) noexcept
    : buffer(other.buffer), buffer_size(other.buffer_size), pos(other.pos), size(other.size)
{
  other.buffer = nullptr;
  other.buffer_size = 0;
  other.pos = 0;
  other.size = 0;
}

/**
 * @brief Move assignment operator that transfers ownership of the buffer.
 *
 * @param other The LoopbackStream to move from.
 * @return Reference to this object.
 */
LoopbackStream &LoopbackStream::operator=(LoopbackStream &&other) noexcept
{
  if (this != &other)
  {
    free(buffer);

    buffer = other.buffer;
    buffer_size = other.buffer_size;
    pos = other.pos;
    size = other.size;

    other.buffer = nullptr;
    other.buffer_size = 0;
    other.pos = 0;
    other.size = 0;
  }
  return *this;
}

/**
 * @brief Clears the internal buffer by resetting read position and size.
 */
void LoopbackStream::clear()
{
  this->pos = 0;
  this->size = 0;
}

/**
 * @brief Reads a byte from the buffer.
 *
 * @return The read byte, or -1 if the buffer is empty.
 */
int LoopbackStream::read()
{
  if (size == 0)
  {
    return -1;
  }
  else
  {
    int ret = buffer[pos];
    pos++;
    size--;
    if (pos == buffer_size)
    {
      pos = 0;
    }
    return ret;
  }
}

/**
 * @brief Writes a byte to the buffer.
 *
 * @param v The byte to write.
 * @return 1 if the byte was written, 0 if the buffer was full.
 */
size_t LoopbackStream::write(uint8_t v)
{
  if (size == buffer_size)
  {
    return 0;
  }

  uint16_t write_pos = (pos + size) % buffer_size;
  buffer[write_pos] = v;
  size++;
  return 1;
}

/**
 * @brief Returns the number of bytes available for reading.
 *
 * @return The number of bytes available.
 */
int LoopbackStream::available()
{
  return size;
}

/**
 * @brief Returns the number of bytes that can be written before the buffer is full.
 *
 * @return The number of bytes available for writing.
 */
int LoopbackStream::availableForWrite()
{
  return buffer_size - size;
}

/**
 * @brief Checks if the buffer contains a specific character.
 *
 * @param ch The character to search for.
 * @return true if the character is found, false otherwise.
 */
bool LoopbackStream::contains(char ch)
{
  uint16_t current = pos;
  uint16_t remaining = size;

  while (remaining > 0)
  {
    if (buffer[current] == ch)
    {
      return true;
    }
    current++;
    if (current == buffer_size)
    {
      current = 0;
    }
    remaining--;
  }
  return false;
}

/**
 * @brief Peeks at the next byte in the buffer without removing it.
 *
 * @return The next byte, or -1 if the buffer is empty.
 */
int LoopbackStream::peek()
{
  return size == 0 ? -1 : buffer[pos];
}

/**
 * @brief Flushes the stream.
 *
 * This is a no-op for LoopbackStream as there is no external connection to flush.
 */
void LoopbackStream::flush()
{
  // No implementation needed
}
