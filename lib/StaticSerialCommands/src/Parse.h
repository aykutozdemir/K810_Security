/*---------------------------------------------------------------------
Author         : naszly
License        : BSD
Repository     : https://github.com/naszly/Arduino-StaticSerialCommands
-----------------------------------------------------------------------*/

/**
 * @file Parse.h
 * @brief String parsing utilities for StaticSerialCommands.
 *
 * This file provides utility functions for parsing string values into
 * different numeric types safely, with error checking.
 *
 * @author naszly
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STATIC_SERIAL_COMMANDS_PARSE_H
#define STATIC_SERIAL_COMMANDS_PARSE_H

#include <Arduino.h>

/**
 * @brief Namespace containing string parsing utilities.
 */
namespace parse
{
  /**
   * @brief Parse a string into an unsigned integer.
   *
   * This function safely parses a string representation of an unsigned integer,
   * checking for overflow and invalid characters.
   *
   * @param str The input string to parse.
   * @param out Pointer to store the parsed value.
   * @return true if parsing was successful, false on error.
   */
  bool strtou(const char *str, uint32_t *out)
  {
    uint32_t value = 0;
    for (int i = 0; str[i] != '\0'; ++i)
    {
      uint8_t d = str[i] - '0';
      if (d > 9)
        return false;
      uint32_t tmp = value;
      value = value * 10 + d;
      if (tmp > value)
        return false; // overflow
    }
    *out = value;
    return true;
  }

  /**
   * @brief Parse a string into a signed integer.
   *
   * This function safely parses a string representation of a signed integer,
   * handling negative values, checking for overflow and invalid characters.
   *
   * @param str The input string to parse.
   * @param out Pointer to store the parsed value.
   * @return true if parsing was successful, false on error.
   */
  bool strtoi(const char *str, int32_t *out)
  {
    int32_t value = 0;
    int i = 0;
    int32_t sign = 1;
    if (str[i] == '-')
    {
      sign = -1;
      ++i;
    }
    else if (str[i] == '+')
    {
      ++i;
    }

    for (; str[i] != '\0'; ++i)
    {
      uint8_t d = str[i] - '0';
      if (d > 9)
        return false;
      int32_t tmp = value;
      value = value * 10 + d;
      if (tmp > value)
        return false; // overflow
    }
    *out = value * sign;
    return true;
  }

  /**
   * @brief Parse a string into a floating point value.
   *
   * This function uses the standard library strtod function to parse a
   * string representation of a floating point number.
   *
   * @param str The input string to parse.
   * @param out Pointer to store the parsed value.
   * @return true if parsing was successful, false on error.
   */
  bool strtof(const char *str, float *out)
  {
    char *str_end = nullptr;
    *out = (float)strtod(str, &str_end);
    if (*out == 0.0f && str_end == str)
      return false;
    return true;
  }

}

#endif // STATIC_SERIAL_COMMANDS_PARSE_H
