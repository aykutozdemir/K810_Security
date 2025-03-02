#pragma once

#include "LoopbackStream.h"

/*
 * PipedStreams are created in pairs, and all data written to one of the streams can be read on the other
 *
 * If any of the internal buffers overflows, the last bytes written are lost.
 *
 * It can be used as a Serial or Socket-like layer between components.
 */

class PipedStream : public Stream
{
  LoopbackStream *in;
  LoopbackStream *out;

public:
  PipedStream(LoopbackStream &in, LoopbackStream &out);

  void clear();

  virtual size_t write(uint8_t) override;
  virtual size_t write(const uint8_t *, size_t) override;
  virtual int availableForWrite(void) override;

  virtual int available() override;
  virtual int read() override;
  virtual int peek() override;
  virtual void flush() override;
};

class PipedStreamPair
{
private:
  LoopbackStream buffer1, buffer2;

public:
  explicit PipedStreamPair(const uint16_t buffer_size = LoopbackStream::DEFAULT_SIZE);
  PipedStream first, second;
};
