/**
 * @file ArduinoQueue.h
 * @brief A lightweight queue implementation for Arduino.
 *
 * A lightweight linked list type queue implementation designed for microcontrollers.
 * This queue provides standard FIFO operations with minimal memory overhead.
 *
 * @author Einar Arnason
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 * @see https://github.com/EinarArnason/ArduinoQueue
 */

#pragma once

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#elif defined(ARDUINO) && ARDUINO < 100
#include "WProgram.h"
#endif

#if __cplusplus <= 199711L
#define nullptr NULL
#endif

/**
 * @brief Lightweight queue implementation for Arduino.
 *
 * @tparam T Type of items stored in the queue.
 */
template <typename T>
class ArduinoQueue
{
private:
  /**
   * @brief Node structure for linked list implementation.
   */
  struct Node
  {
    T item;     ///< The stored item.
    Node *next; ///< Pointer to the next node in the linked list.
  };

  Node *head;         ///< Pointer to the first node in the queue.
  Node *tail;         ///< Pointer to the last node in the queue.
  uint16_t maxItems;  ///< Maximum number of items the queue can store.
  uint16_t maxMemory; ///< Maximum memory (in bytes) the queue can use.
  uint16_t count;     ///< Current number of items in the queue.

public:
  /**
   * @brief Constructor with optional maximum sizes.
   *
   * @param maxItems Maximum number of items the queue can hold (default is UINT16_MAX).
   * @param maxMemory Maximum memory (in bytes) the queue can use (default is UINT16_MAX).
   */
  explicit ArduinoQueue(uint16_t maxItems = UINT16_MAX,
                        uint16_t maxMemory = UINT16_MAX)
  {
    this->head = nullptr;
    this->tail = nullptr;
    this->count = 0;
    this->maxMemory = maxMemory;

    // Add overflow protection
    uint16_t calculatedMaxItems = (maxMemory < sizeof(Node)) ? 0 : (maxMemory / sizeof(Node));
    this->maxItems = calculatedMaxItems;

    if (maxItems != 0 && this->maxItems > maxItems)
    {
      this->maxItems = maxItems;
    }
  }

  /**
   * @brief Destructor that cleans up all allocated nodes.
   */
  ~ArduinoQueue()
  {
    for (Node *node = head; node != nullptr; node = head)
    {
      head = node->next;
      delete node;
    }
  }

  /**
   * @brief Push an item to the queue.
   *
   * @param item The item to add to the queue.
   * @return true if item was successfully added, false if the queue is full or memory allocation failed.
   */
  bool enqueue(T item)
  {
    if (count == maxItems)
    {
      return false;
    }

    Node *node = new Node;
    if (node == nullptr)
    {
      return false;
    }

    node->item = item;
    node->next = nullptr;

    if (head == nullptr)
    {
      head = node;
      tail = node;
      count++;
      return true;
    }

    tail->next = node;
    tail = node;
    count++;

    return true;
  }

  /**
   * @brief Pop the front item from the queue.
   *
   * @return The item at the front of the queue. Returns a default-constructed item if the queue is empty.
   */
  T dequeue()
  {
    if ((count == 0) || (head == nullptr))
    {
      return T();
    }

    Node *node = head;
    head = node->next;
    T item = node->item;
    node->next = nullptr;
    delete node;
    node = nullptr;

    if (head == nullptr)
    {
      tail = nullptr;
    }

    count--;
    return item;
  }

  /**
   * @brief Check if the queue is empty.
   *
   * @return true if the queue is empty, false otherwise.
   */
  bool isEmpty() { return head == nullptr; }

  /**
   * @brief Check if the queue is full.
   *
   * @return true if the queue is full, false otherwise.
   */
  bool isFull() { return count == maxItems; }

  /**
   * @brief Get the current number of items in the queue.
   *
   * @return Number of items currently in the queue.
   */
  unsigned int itemCount() { return count; }

  /**
   * @brief Get the size of a queue item in bytes.
   *
   * @return Size of a queue node in bytes.
   */
  unsigned int itemSize() { return sizeof(Node); }

  /**
   * @brief Get the maximum number of items the queue can hold.
   *
   * @return Maximum number of items.
   */
  unsigned int maxQueueSize() { return maxItems; }

  /**
   * @brief Get the maximum memory size the queue can use.
   *
   * @return Maximum memory size in bytes.
   */
  unsigned int maxMemorySize() { return maxMemory; }

  /**
   * @brief Get the item at the front of the queue without removing it.
   *
   * @return The front item. Returns a default-constructed item if the queue is empty.
   */
  T getHead()
  {
    if ((count == 0) || (head == nullptr))
    {
      return T();
    }

    T item = head->item;
    return item;
  }

  /**
   * @brief Get the item at the back of the queue without removing it.
   *
   * @return The back item. Returns a default-constructed item if the queue is empty.
   */
  T getTail()
  {
    if ((count == 0) || (head == nullptr))
    {
      return T();
    }

    T item = tail->item;
    return item;
  }

  /**
   * @brief Get a pointer to the item at the front of the queue.
   *
   * @return Pointer to the front item, or nullptr if the queue is empty.
   */
  T *getHeadPtr()
  {
    if ((count == 0) || (head == nullptr))
    {
      return nullptr;
    }

    return &(head->item);
  }

  /**
   * @brief Get a pointer to the item at the back of the queue.
   *
   * @return Pointer to the back item, or nullptr if the queue is empty.
   */
  T *getTailPtr()
  {
    if ((count == 0) || (head == nullptr))
    {
      return nullptr;
    }

    return &(tail->item);
  }
};
