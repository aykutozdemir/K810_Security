/**
 * @file FastCircularQueue.h
 * @brief High-performance circular queue implementation.
 *
 * This file defines a template-based circular queue implementation optimized for
 * performance in embedded systems. It provides efficient FIFO operations with a fixed
 * size buffer, suitable for interrupt-safe data passing between ISRs and main code.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef FASTCIRCULARQUEUE_H
#define FASTCIRCULARQUEUE_H

#include <Arduino.h>

/**
 * @brief High-performance circular queue implementation with fixed size
 *
 * This template class implements a circular queue (FIFO) with a fixed size buffer.
 * It is optimized for performance in embedded systems and is suitable for
 * passing data between ISRs and main code.
 *
 * @tparam T The type of elements stored in the queue
 * @tparam BUFFER_SIZE The size of the buffer (must be a power of 2)
 */
template <typename T, uint8_t BUFFER_SIZE>
class FastCircularQueue
{
  static_assert((BUFFER_SIZE & (BUFFER_SIZE - 1)) == 0, "BUFFER_SIZE must be a power of 2!");
  static_assert(BUFFER_SIZE <= 256, "BUFFER_SIZE must be <= 256 due to uint8_t index type!");

public:
  /**
   * @brief Constructs an empty circular queue
   */
  FastCircularQueue()
      : head(0), tail(0)
  {
    for (uint8_t i = 0; i < BUFFER_SIZE; ++i)
    {
      buffer[i] = T();
    }
  }

  /**
   * @brief Pushes a value to the queue
   *
   * @param value The value to push
   * @return true if the value was successfully pushed, false if the queue is full
   */
  inline bool push(const T &value)
  {
    const uint8_t currentHead = head; // Take a snapshot of head
    const uint8_t next = (currentHead + 1) & (BUFFER_SIZE - 1);
    if (next == tail)
      return false;
    buffer[currentHead] = value;
    head = next; // Memory barrier might be needed here for thread safety
    return true;
  }

  /**
   * @brief Pushes a value to the queue, overwriting the oldest value if full
   *
   * @param value The value to push
   */
  inline void pushOverwrite(const T &value)
  {
    const uint8_t currentHead = head;
    const uint8_t next = (currentHead + 1) & (BUFFER_SIZE - 1);
    if (next == tail)
    {
      // Overwrite mode: move tail to discard oldest data
      tail = (tail + 1) & (BUFFER_SIZE - 1);
    }
    buffer[currentHead] = value;
    head = next; // Memory barrier might be needed here for thread safety
  }

  /**
   * @brief Pops a value from the queue
   *
   * @param value Reference to store the popped value
   * @return true if a value was successfully popped, false if the queue is empty
   */
  inline bool pop(T &value)
  {
    if (head == tail)
      return false;
    value = buffer[tail];
    tail = (tail + 1) & (BUFFER_SIZE - 1);
    return true;
  }

  /**
   * @brief Peeks at the next value in the queue without removing it
   *
   * @param value Reference to store the peeked value
   * @return true if a value was successfully peeked, false if the queue is empty
   */
  inline bool peek(T &value) const
  {
    if (head == tail)
      return false;
    value = buffer[tail];
    return true;
  }

  /**
   * @brief Checks if the queue is empty
   *
   * @return true if the queue is empty, false otherwise
   */
  inline bool isEmpty() const
  {
    return head == tail;
  }

  /**
   * @brief Checks if the queue is full
   *
   * @return true if the queue is full, false otherwise
   */
  inline bool isFull() const
  {
    return ((head + 1) & (BUFFER_SIZE - 1)) == tail;
  }

  /**
   * @brief Gets the number of elements in the queue
   *
   * @return The number of elements in the queue
   */
  inline uint8_t available() const
  {
    return (head - tail) & (BUFFER_SIZE - 1);
  }

  /**
   * @brief Clears the queue
   */
  inline void clear()
  {
    head = tail = 0;
  }

protected:
  /**
   * @brief Gets the tail index
   *
   * @return The current tail index
   */
  inline uint8_t getTail() const
  {
    return tail;
  } // Allow derived classes to access tail safely

  /**
   * @brief Peeks at a value at a specific index in the queue
   *
   * @param index The index to peek at, relative to the tail
   * @param value Reference to store the peeked value
   * @return true if a value was successfully peeked, false if the index is out of bounds
   */
  inline bool peekAt(uint8_t index, T &value) const
  { // Provide safe indexed access
    if (index >= available())
      return false;
    uint8_t pos = (tail + index) & (BUFFER_SIZE - 1);
    value = buffer[pos];
    return true;
  }

private:
  T buffer[BUFFER_SIZE];       ///< The circular buffer
  volatile uint8_t head, tail; ///< Head and tail indices
};

#endif
