/**
 * @file StringBuffer.h
 * @brief Efficient string buffer for embedded systems.
 *
 * This file defines the StringBuffer class, which provides an efficient way to handle
 * string operations in memory-constrained embedded systems. It offers a fixed-size
 * buffer with various string manipulation functions optimized for performance.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STRINGBUFFER_H
#define STRINGBUFFER_H

#include "FastCircularQueue.h"
#include <Arduino.h>

/**
 * @brief Efficient string manipulation buffer based on circular queue
 *
 * This class extends FastCircularQueue to provide specialized string handling
 * operations optimized for embedded systems with limited memory.
 *
 * @tparam BUFFER_SIZE The size of the buffer (must be a power of 2)
 */
template <uint8_t BUFFER_SIZE>
class StringBuffer : public FastCircularQueue<char, BUFFER_SIZE>
{
public:
  /**
   * @brief Constructs an empty string buffer
   */
  StringBuffer();

  /**
   * @brief Appends a character to the buffer
   *
   * @param c The character to append
   */
  void append(char c);

  /**
   * @brief Appends a null-terminated string to the buffer
   *
   * @param str The string to append
   */
  void append(const char *str);

  /**
   * @brief Appends a flash string to the buffer
   *
   * @param flashStr The flash string to append
   */
  void append(const __FlashStringHelper *flashStr);

  /**
   * @brief Appends an Arduino String to the buffer
   *
   * @param str The Arduino String to append
   */
  void append(const String &str);

  /**
   * @brief Finds the first occurrence of a character
   *
   * @param c The character to find
   * @return The index of the character, or -1 if not found
   */
  int indexOf(const char c) const;

  /**
   * @brief Finds the first occurrence of a string
   *
   * @param str The string to find
   * @return The starting index of the string, or -1 if not found
   */
  int indexOf(const char *str) const;

  /**
   * @brief Finds the first occurrence of a flash string
   *
   * @param flashStr The flash string to find
   * @return The starting index of the string, or -1 if not found
   */
  int indexOf(const __FlashStringHelper *flashStr) const;

  /**
   * @brief Finds the first occurrence of an Arduino String
   *
   * @param str The Arduino String to find
   * @return The starting index of the string, or -1 if not found
   */
  int indexOf(const String &str) const;

  /**
   * @brief Checks if the buffer ends with a specific string
   *
   * @param str The string to check
   * @return true if the buffer ends with the string, false otherwise
   */
  bool endsWith(const char *str) const;

  /**
   * @brief Checks if the buffer ends with a specific flash string
   *
   * @param flashStr The flash string to check
   * @return true if the buffer ends with the string, false otherwise
   */
  bool endsWith(const __FlashStringHelper *flashStr) const;

  /**
   * @brief Checks if the buffer ends with an Arduino String
   *
   * @param str The Arduino String to check
   * @return true if the buffer ends with the string, false otherwise
   */
  bool endsWith(const String &str) const;

  /**
   * @brief Trims leading and trailing spaces from the buffer
   */
  void trim();

  /**
   * @brief Extracts a substring from the buffer
   *
   * @param from Starting index (inclusive)
   * @param to Ending index (exclusive)
   * @return A new StringBuffer containing the substring
   */
  StringBuffer substring(int from, int to) const;

  /**
   * @brief Copies the buffer contents to a C-string
   *
   * @param output The output buffer to copy to
   * @param maxSize The maximum size of the output buffer
   */
  void toCString(char *output, uint8_t maxSize) const;

  /**
   * @brief Converts the buffer contents to an Arduino String
   *
   * @return An Arduino String containing the buffer contents
   */
  String toString() const;

  /**
   * @brief Clears the buffer
   */
  void clear();

  /**
   * @brief Gets the number of characters in the buffer
   *
   * @return The number of characters in the buffer
   */
  uint8_t size() const;
};

#include "StringBuffer.hpp" // Include template implementation
#endif                      // STRINGBUFFER_H
