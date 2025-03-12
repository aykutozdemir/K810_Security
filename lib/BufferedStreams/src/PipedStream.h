/**
 * @file PipedStream.h
 * @brief Defines bidirectional pipe streams for communication between components.
 *
 * This file contains the PipedStream and PipedStreamPair classes which implement
 * bidirectional stream communication using internal buffers.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#pragma once

#include "LoopbackStream.h"

/**
 * @brief Bidirectional stream that forms one side of a pipe.
 *
 * PipedStreams are created in pairs, and all data written to one of the streams can be read on the other
 *
 * If any of the internal buffers overflows, the last bytes written are lost.
 *
 * It can be used as a Serial or Socket-like layer between components.
 */
class PipedStream : public Stream
{
  LoopbackStream *in;  ///< Input stream (data written to the other end).
  LoopbackStream *out; ///< Output stream (data written to this end).

public:
  /**
   * @brief Constructor that sets up in and out streams.
   *
   * @param in Stream for incoming data (written to other end).
   * @param out Stream for outgoing data (written to this end).
   */
  PipedStream(LoopbackStream &in, LoopbackStream &out);

  /**
   * @brief Virtual destructor.
   */
  virtual ~PipedStream() = default;

  /**
   * @brief Clears both input and output streams.
   */
  void clear();

  /**
   * @brief Writes a byte to the output stream.
   *
   * @param data The byte to write.
   * @return Number of bytes written (1 on success, 0 if buffer is full).
   */
  virtual size_t write(uint8_t data) override;

  /**
   * @brief Writes a buffer of bytes to the output stream.
   *
   * @param buffer The buffer to write.
   * @param size The number of bytes to write.
   * @return Number of bytes successfully written.
   */
  virtual size_t write(const uint8_t *buffer, size_t size) override;

  /**
   * @brief Gets the number of bytes available for writing.
   *
   * @return Number of bytes that can be written before the output buffer is full.
   */
  virtual int availableForWrite(void) override;

  /**
   * @brief Gets the number of bytes available for reading.
   *
   * @return Number of bytes available to read from the input buffer.
   */
  virtual int available() override;

  /**
   * @brief Reads a byte from the input stream.
   *
   * @return The next byte in the input buffer, or -1 if the buffer is empty.
   */
  virtual int read() override;

  /**
   * @brief Peeks at the next byte in the input stream without removing it.
   *
   * @return The next byte in the input buffer, or -1 if the buffer is empty.
   */
  virtual int peek() override;

  /**
   * @brief Flushes the output stream.
   */
  virtual void flush() override;

  /**
   * @brief Creates a reversed view of this pipe (the other end).
   *
   * @return A PipedStream that is the opposite end of this pipe.
   */
  PipedStream backDoor()
  {
    return PipedStream(*out, *in);
  }
};

/**
 * @brief A pair of connected PipedStreams that can communicate with each other.
 *
 * This class creates and manages a pair of PipedStreams that are connected to each other.
 * Data written to one stream can be read from the other, and vice versa.
 */
class PipedStreamPair
{
private:
  LoopbackStream buffer1; ///< Buffer for first→second communication.
  LoopbackStream buffer2; ///< Buffer for second→first communication.

public:
  /**
   * @brief Constructor that creates a pair of connected streams.
   *
   * @param buffer_size Size of the internal buffers (default is LoopbackStream::DEFAULT_SIZE).
   */
  explicit PipedStreamPair(const uint16_t buffer_size = LoopbackStream::DEFAULT_SIZE);

  PipedStream first;  ///< First end of the pipe.
  PipedStream second; ///< Second end of the pipe.
};
