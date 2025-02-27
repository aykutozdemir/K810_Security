#pragma once

#include <Stream.h>

/*
 * A LoopbackStream stores all data written in an internal buffer and returns it back when the stream is read.
 *
 * If the buffer overflows, the last bytes written are lost.
 *
 * It can be used as a buffering layer between components.
 */
class LoopbackStream : public Stream
{
  uint8_t *buffer;
  uint16_t buffer_size;
  uint16_t pos, size;

public:
  static const uint16_t DEFAULT_SIZE = 64;

  explicit LoopbackStream(uint16_t buffer_size = LoopbackStream::DEFAULT_SIZE);
  ~LoopbackStream();

  // Add move semantics
  LoopbackStream(LoopbackStream &&other) noexcept;
  LoopbackStream &operator=(LoopbackStream &&other) noexcept;

  // Delete copy operations
  LoopbackStream(const LoopbackStream &) = delete;
  LoopbackStream &operator=(const LoopbackStream &) = delete;

  void clear();

  virtual size_t write(uint8_t);
  virtual int availableForWrite(void);

  virtual int available();
  virtual bool contains(char);
  virtual int read();
  virtual int peek();
  virtual void flush();
};
