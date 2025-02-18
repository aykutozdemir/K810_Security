#include "LoopbackStream.h"

LoopbackStream::LoopbackStream(uint16_t buffer_size)
{
  this->buffer = static_cast<uint8_t *>(malloc(buffer_size));
  this->buffer_size = buffer_size;
  this->pos = 0;
  this->size = 0;
}

LoopbackStream::~LoopbackStream()
{
  free(buffer);
}

LoopbackStream::LoopbackStream(LoopbackStream&& other) noexcept
    : buffer(other.buffer)
    , buffer_size(other.buffer_size)
    , pos(other.pos)
    , size(other.size)
{
    other.buffer = nullptr;
    other.buffer_size = 0;
    other.pos = 0;
    other.size = 0;
}

LoopbackStream& LoopbackStream::operator=(LoopbackStream&& other) noexcept
{
    if (this != &other) {
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

void LoopbackStream::clear()
{
  this->pos = 0;
  this->size = 0;
}

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

int LoopbackStream::available()
{
  return size;
}

int LoopbackStream::availableForWrite()
{
  return buffer_size - size;
}

bool LoopbackStream::contains(char ch)
{
  uint16_t current = pos;
  uint16_t remaining = size;
  
  while (remaining > 0) {
    if (buffer[current] == ch) {
      return true;
    }
    current++;
    if (current == buffer_size) {
      current = 0;
    }
    remaining--;
  }
  return false;
}

int LoopbackStream::peek()
{
  return size == 0 ? -1 : buffer[pos];
}

void LoopbackStream::flush()
{
  // No implementation needed
}
