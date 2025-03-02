#include "PipedStream.h"

PipedStream::PipedStream(LoopbackStream &in, LoopbackStream &out)
    : in(&in), out(&out)
{
}

void PipedStream::clear()
{
  in->clear();
  out->clear();
}

int PipedStream::read()
{
  return in->read();
}

size_t PipedStream::write(uint8_t v)
{
  return out->write(v);
}

size_t PipedStream::write(const uint8_t *buffer, size_t size)
{
  size_t bytes_written = 0;
  for (size_t i = 0; i < size; ++i)
  {
    bytes_written += out->write(buffer[i]);
  }
  return bytes_written;
}

int PipedStream::available()
{
  return in->available();
}

int PipedStream::availableForWrite()
{
  return out->availableForWrite();
}

int PipedStream::peek()
{
  return in->peek();
}

void PipedStream::flush()
{
  out->flush();
}

PipedStreamPair::PipedStreamPair(const uint16_t buffer_size)
    : buffer1(buffer_size),
      buffer2(buffer_size),
      first(buffer1, buffer2),
      second(buffer2, buffer1)
{
}
