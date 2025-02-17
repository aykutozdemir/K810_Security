#ifndef FASTCIRCULARQUEUE_H
#define FASTCIRCULARQUEUE_H

#include <Arduino.h>

template <typename T, uint8_t BUFFER_SIZE>
class FastCircularQueue
{
  static_assert((BUFFER_SIZE & (BUFFER_SIZE - 1)) == 0, "BUFFER_SIZE must be a power of 2!");

public:
  FastCircularQueue()
      : head(0), tail(0) {}

  inline bool push(const T &value)
  {
    const uint8_t next = (head + 1) & (BUFFER_SIZE - 1);
    if (next == tail)
      return false;
    buffer[head] = value;
    head = next;
    return true;
  }

  inline void pushOverwrite(const T &value)
  {
    const uint8_t next = (head + 1) & (BUFFER_SIZE - 1);
    if (next == tail)
    {
      // Overwrite mode: move tail to discard oldest data
      tail = (tail + 1) & (BUFFER_SIZE - 1);
    }
    buffer[head] = value;
    head = next;
  }

  inline bool pop(T &value)
  {
    if (head == tail)
      return false;
    value = buffer[tail];
    tail = (tail + 1) & (BUFFER_SIZE - 1);
    return true;
  }

  inline bool peek(T &value) const
  {
    if (head == tail)
      return false;
    value = buffer[tail];
    return true;
  }

  inline bool isEmpty() const
  {
    return head == tail;
  }

  inline bool isFull() const
  {
    return ((head + 1) & (BUFFER_SIZE - 1)) == tail;
  }

  inline uint8_t available() const
  {
    return (head - tail) & (BUFFER_SIZE - 1);
  }

  inline void clear()
  {
    head = tail = 0;
  }

protected:
  inline uint8_t getTail() const
  {
    return tail;
  } // Allow derived classes to access tail safely

  inline bool peekAt(uint8_t index, T &value) const
  { // Provide safe indexed access
    if (index >= available())
      return false;
    uint8_t pos = (tail + index) & (BUFFER_SIZE - 1);
    value = buffer[pos];
    return true;
  }

private:
  T buffer[BUFFER_SIZE];
  volatile uint8_t head, tail;
};

#endif
