/**
 * @file PipedStream.cpp
 * @brief Implementation of the PipedStream and PipedStreamPair classes.
 *
 * This file contains the implementation of the PipedStream and PipedStreamPair classes
 * which provide bidirectional stream communication between components.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#include "PipedStream.h"

/**
 * @brief Constructor that sets up the stream with input and output channels.
 *
 * @param in The input stream (receives data written to the other end).
 * @param out The output stream (receives data written to this end).
 */
PipedStream::PipedStream(LoopbackStream &in, LoopbackStream &out)
    : in(&in), out(&out)
{
}

/**
 * @brief Clears both input and output buffers.
 */
void PipedStream::clear()
{
  in->clear();
  out->clear();
}

/**
 * @brief Reads a byte from the input buffer.
 *
 * @return The read byte, or -1 if the buffer is empty.
 */
int PipedStream::read()
{
  return in->read();
}

/**
 * @brief Writes a byte to the output buffer.
 *
 * @param v The byte to write.
 * @return 1 if the byte was written, 0 if the buffer was full.
 */
size_t PipedStream::write(uint8_t v)
{
  return out->write(v);
}

/**
 * @brief Writes multiple bytes to the output buffer.
 *
 * @param buffer The buffer containing bytes to write.
 * @param size The number of bytes to write.
 * @return The number of bytes successfully written.
 */
size_t PipedStream::write(const uint8_t *buffer, size_t size)
{
  size_t bytes_written = 0;
  for (size_t i = 0; i < size; ++i)
  {
    bytes_written += out->write(buffer[i]);
  }
  return bytes_written;
}

/**
 * @brief Returns the number of bytes available to read.
 *
 * @return The number of bytes in the input buffer.
 */
int PipedStream::available()
{
  return in->available();
}

/**
 * @brief Returns the number of bytes that can be written.
 *
 * @return The space available in the output buffer.
 */
int PipedStream::availableForWrite()
{
  return out->availableForWrite();
}

/**
 * @brief Peeks at the next byte without removing it.
 *
 * @return The next byte, or -1 if the buffer is empty.
 */
int PipedStream::peek()
{
  return in->peek();
}

/**
 * @brief Flushes the output buffer.
 */
void PipedStream::flush()
{
  out->flush();
}

/**
 * @brief Constructor that creates a pair of connected PipedStreams.
 *
 * @param buffer_size The size of both internal buffers.
 */
PipedStreamPair::PipedStreamPair(const uint16_t buffer_size)
    : buffer1(buffer_size),
      buffer2(buffer_size),
      first(buffer1, buffer2),
      second(buffer2, buffer1)
{
}
