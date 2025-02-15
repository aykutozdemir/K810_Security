#ifndef STRINGBUFFER_H
#define STRINGBUFFER_H

#include "FastCircularQueue.h"
#include <Arduino.h>

template<uint8_t BUFFER_SIZE>
class StringBuffer : public FastCircularQueue<char, BUFFER_SIZE> {
public:
  StringBuffer();

  void append(char c);
  void append(const char* str);
  void append(const __FlashStringHelper* flashStr);
  void append(const String& str);

  int indexOf(const char c) const;
  int indexOf(const char* str) const;
  int indexOf(const __FlashStringHelper* flashStr) const;
  int indexOf(const String& str) const;

  bool endsWith(const char* str) const;
  bool endsWith(const __FlashStringHelper* flashStr) const;
  bool endsWith(const String& str) const;

  void trim();
  StringBuffer substring(int from, int to) const;

  void toCString(char* output, uint8_t maxSize) const;
  String toString() const;

  void clear();
  uint8_t size() const;
};

#include "StringBuffer.hpp"  // Include template implementation
#endif                       // STRINGBUFFER_H
