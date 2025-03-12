/**
 * @file StringBuffer.hpp
 * @brief Implementation of the StringBuffer class.
 *
 * This file contains the implementation of the StringBuffer class methods for efficient
 * string handling in embedded systems. It provides optimized string operations designed
 * for memory-constrained environments.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STRINGBUFFER_HPP
#define STRINGBUFFER_HPP

// Constructor
template <uint8_t BUFFER_SIZE>
StringBuffer<BUFFER_SIZE>::StringBuffer()
{
  clear();
}

// Append a single character (overwrite if full)
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::append(char c)
{
  this->pushOverwrite(c);
}

// Append a C-string
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::append(const char *str)
{
  while (*str)
  {
    this->pushOverwrite(*str++);
  }
}

// Append a Flash string
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::append(const __FlashStringHelper *flashStr)
{
  PGM_P p = reinterpret_cast<PGM_P>(flashStr);
  char c;
  while ((c = pgm_read_byte(p++)))
  {
    this->pushOverwrite(c);
  }
}

// Append an Arduino String
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::append(const String &str)
{
  const unsigned int strLen = str.length();
  // Only copy up to BUFFER_SIZE characters
  for (uint16_t i = 0; i < strLen && i < BUFFER_SIZE; i++)
  {
    this->pushOverwrite(str[i]);
  }
}

// Find the first occurrence of a character
template <uint8_t BUFFER_SIZE>
int StringBuffer<BUFFER_SIZE>::indexOf(const char c) const
{
  for (uint8_t i = 0; i < this->available(); i++)
  {
    char temp;
    this->peekAt(i, temp);
    if (temp == c)
    {
      return i;
    }
  }
  return -1;
}

// Find the first occurrence of a C-string
template <uint8_t BUFFER_SIZE>
int StringBuffer<BUFFER_SIZE>::indexOf(const char *str) const
{
  if (!str)
    return -1; // Check for null pointer
  const size_t len = strlen(str);
  if (len == 0)
    return -1; // Check for empty string
  if (len > this->available())
  {
    return -1;
  }

  for (uint8_t i = 0; i <= this->available() - len; i++)
  {
    bool match = true;
    for (uint8_t j = 0; j < len; j++)
    {
      char temp;
      this->peekAt(i + j, temp);
      if (temp != str[j])
      {
        match = false;
        break;
      }
    }
    if (match)
      return i;
  }
  return -1;
}

// Find the first occurrence of a Flash string
template <uint8_t BUFFER_SIZE>
int StringBuffer<BUFFER_SIZE>::indexOf(const __FlashStringHelper *flashStr) const
{
  if (!flashStr)
    return -1; // Check for null pointer
  const size_t len = strnlen_P(reinterpret_cast<PGM_P>(flashStr), BUFFER_SIZE);
  if (len == 0 || len > this->available())
    return -1; // Validate input

  for (uint8_t i = 0; i <= this->available() - len; i++)
  {
    bool match = true;
    for (uint8_t j = 0; j < len; j++)
    {
      char temp, flashChar;
      this->peekAt(i + j, temp);                                        // Get character from buffer
      flashChar = pgm_read_byte(reinterpret_cast<PGM_P>(flashStr) + j); // Read from PROGMEM

      if (temp != flashChar)
      {
        match = false;
        break;
      }
    }
    if (match)
      return i;
  }
  return -1;
}

// Find the first occurrence of an Arduino String
template <uint8_t BUFFER_SIZE>
int StringBuffer<BUFFER_SIZE>::indexOf(const String &str) const
{
  return indexOf(str.c_str());
}

// Check if buffer ends with a given C-string
template <uint8_t BUFFER_SIZE>
bool StringBuffer<BUFFER_SIZE>::endsWith(const char *str) const
{
  const size_t len = strlen(str);
  if (len > this->available())
    return false;

  for (uint8_t i = 0; i < len; i++)
  {
    char temp;
    this->peekAt(this->available() - len + i, temp);
    if (temp != str[i])
      return false;
  }
  return true;
}

// Check if buffer ends with a Flash string
template <uint8_t BUFFER_SIZE>
bool StringBuffer<BUFFER_SIZE>::endsWith(const __FlashStringHelper *flashStr) const
{
  const size_t len = strnlen_P(reinterpret_cast<PGM_P>(flashStr), BUFFER_SIZE);
  if (len == 0 || len > this->available())
    return false; // Validate input

  const uint8_t startIdx = this->available() - len; // Start comparison from the end

  for (uint8_t i = 0; i < len; i++)
  {
    char temp, flashChar;
    this->peekAt(startIdx + i, temp);                                 // Get character from buffer
    flashChar = pgm_read_byte(reinterpret_cast<PGM_P>(flashStr) + i); // Read from PROGMEM

    if (temp != flashChar)
    {
      return false;
    }
  }
  return true;
}

// Check if buffer ends with an Arduino String
template <uint8_t BUFFER_SIZE>
bool StringBuffer<BUFFER_SIZE>::endsWith(const String &str) const
{
  return endsWith(str.c_str());
}

// Trim leading and trailing spaces
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::trim()
{
  uint8_t newStart = 0, newEnd = this->available();

  // Find first non-space character
  while (newStart < newEnd)
  {
    char temp;
    this->peekAt(newStart, temp);
    if (temp != ' ')
      break;
    newStart++;
  }

  // Find last non-space character
  while (newEnd > newStart)
  {
    char temp;
    this->peekAt(newEnd - 1, temp);
    if (temp != ' ')
      break;
    newEnd--;
  }

  // Re-align buffer only if needed
  if (newStart > 0 || newEnd < this->available())
  {
    for (uint8_t i = 0; i < (newEnd - newStart); i++)
    {
      char temp;
      this->peekAt(newStart + i, temp);
      this->pushOverwrite(temp);
    }
    while (this->available() > (newEnd - newStart))
    {
      char temp;
      this->pop(temp);
    }
  }
}

// Extract a substring into a new StringBuffer
template <uint8_t BUFFER_SIZE>
StringBuffer<BUFFER_SIZE> StringBuffer<BUFFER_SIZE>::substring(int from, int to) const
{
  StringBuffer<BUFFER_SIZE> subBuffer;
  if (from < 0 || to > this->available() || from >= to)
    return subBuffer;

  for (int i = from; i < to; i++)
  {
    char temp;
    this->peekAt(i, temp);
    subBuffer.append(temp);
  }
  return subBuffer;
}

// Convert buffer to C-string (null-terminated)
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::toCString(char *output, uint8_t maxSize) const
{
  if (maxSize == 0)
    return;
  uint8_t copyLength = (this->available() < maxSize - 1) ? this->available() : (maxSize - 1);

  for (uint8_t i = 0; i < copyLength; i++)
  {
    this->peekAt(i, output[i]);
  }
  output[copyLength] = '\0'; // Null-terminate
}

// Convert buffer to Arduino String
template <uint8_t BUFFER_SIZE>
String StringBuffer<BUFFER_SIZE>::toString() const
{
  char output[BUFFER_SIZE + 1];
  toCString(output, BUFFER_SIZE + 1);
  return String(output);
}

// Get buffer size
template <uint8_t BUFFER_SIZE>
uint8_t StringBuffer<BUFFER_SIZE>::size() const
{
  return this->available();
}

// Clear the buffer
template <uint8_t BUFFER_SIZE>
void StringBuffer<BUFFER_SIZE>::clear()
{
  while (!this->isEmpty())
  {
    char temp;
    this->pop(temp);
  }
}

#endif // STRINGBUFFER_HPP
