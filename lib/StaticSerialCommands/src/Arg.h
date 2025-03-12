/*---------------------------------------------------------------------
Author         : naszly
License        : BSD
Repository     : https://github.com/naszly/Arduino-StaticSerialCommands
-----------------------------------------------------------------------*/

/**
 * @file Arg.h
 * @brief Command argument handling for StaticSerialCommands.
 *
 * This file provides classes and macros for defining, parsing, and validating
 * command arguments in the StaticSerialCommands library.
 *
 * @author naszly
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STATIC_SERIAL_COMMANDS_ARG_H
#define STATIC_SERIAL_COMMANDS_ARG_H
#include <Arduino.h>

/**
 * @brief Maximum number of arguments that can be processed.
 */
#define MAX_ARGS 16

/**
 * @brief Get a single character from a string at specific index.
 * @param str The input string.
 * @param i The index position.
 * @return The character at position i or 0 if beyond string length.
 */
#define GET_1_CHAR(str, i) (sizeof(str) > (i) ? str[(i)] : 0)

/**
 * @brief Get 4 consecutive characters from a string starting at specific index.
 * @param str The input string.
 * @param i The starting index position.
 * @return The 4 consecutive characters starting at position i.
 */
#define GET_4_CHAR(str, i)                        \
  GET_1_CHAR(str, i + 0), GET_1_CHAR(str, i + 1), \
      GET_1_CHAR(str, i + 2), GET_1_CHAR(str, i + 3)

/**
 * @brief Get 16 consecutive characters from a string starting at specific index.
 * @param str The input string.
 * @param i The starting index position.
 * @return The 16 consecutive characters starting at position i.
 */
#define GET_16_CHAR(str, i)                       \
  GET_4_CHAR(str, i + 0), GET_4_CHAR(str, i + 4), \
      GET_4_CHAR(str, i + 8), GET_4_CHAR(str, i + 12)

/**
 * @brief Get the full string with a guard for longer strings.
 * @param str The input string.
 * @return The string characters with a null terminator.
 */
#define GET_STR(str) GET_16_CHAR(str, 0), 0 // guard for longer strings

/**
 * @brief Define an argument with just a type.
 * @param type The argument type.
 */
#define ARG_1(type) \
  impl::ArgConstraint(type)

/**
 * @brief Define an argument with type and name.
 * @param type The argument type.
 * @param name The argument name.
 */
#define ARG_2(type, name) \
  impl::ArgConstraint(type, impl::ArgConstraint::getNamePgm<GET_STR(name)>)

/**
 * @brief Define an argument with type, min, and max values.
 * @param type The argument type.
 * @param min The minimum value.
 * @param max The maximum value.
 */
#define ARG_3(type, min, max) \
  impl::ArgConstraint(type, impl::ArgConstraint::getRange<min, max>)

/**
 * @brief Define an argument with type, min, max values, and name.
 * @param type The argument type.
 * @param min The minimum value.
 * @param max The maximum value.
 * @param name The argument name.
 */
#define ARG_4(type, min, max, name) \
  impl::ArgConstraint(type, impl::ArgConstraint::getRange<min, max>, impl::ArgConstraint::getNamePgm<GET_STR(name)>)

/**
 * @brief Helper macro for argument definition with variable arguments.
 */
#define ARG_X(a0, a1, a2, a3, a4, FUNC, ...) FUNC

/**
 * @brief Main macro for defining command arguments with various options.
 *
 * This macro provides a flexible way to define command arguments with different
 * parameter combinations (type only, type and name, type with range, etc.).
 */
#define ARG(...)            \
  ARG_X(, ##__VA_ARGS__,    \
        ARG_4(__VA_ARGS__), \
        ARG_3(__VA_ARGS__), \
        ARG_2(__VA_ARGS__), \
        ARG_1(__VA_ARGS__))

/**
 * @brief Enumeration of supported argument types.
 */
enum class ArgType : uint8_t
{
  Null,  ///< Null (no value)
  Int,   ///< Integer value
  Float, ///< Floating point value
  String ///< String value
};

/**
 * @brief Union for storing argument values of different types.
 */
union ArgData
{
  int32_t num;        ///< Integer value
  float num_f;        ///< Floating point value
  const char *string; ///< String value
};

/**
 * @brief Class representing a command argument with type information.
 */
class Arg
{
public:
  /**
   * @brief Default constructor creating a null argument.
   */
  constexpr Arg() : value{0}, type(ArgType::Null) {}

  /**
   * @brief Constructor for an integer argument.
   * @param value The integer value.
   */
  explicit Arg(int32_t value)
      : value{.num = value}, type(ArgType::Int) {}

  /**
   * @brief Constructor for a float argument.
   * @param value The float value.
   */
  explicit Arg(float value)
      : value{.num_f = value}, type(ArgType::Float) {}

  /**
   * @brief Constructor for a string argument.
   * @param value The string value.
   */
  explicit Arg(const char *value)
      : value{.string = value}, type(ArgType::String) {}

  /**
   * @brief Get the argument value as an integer.
   * @return The integer value.
   */
  int32_t getInt()
  {
    return value.num;
  }

  /**
   * @brief Get the argument value as a float.
   * @return The float value.
   */
  float getFloat()
  {
    return value.num_f;
  }

  /**
   * @brief Get the argument value as a string.
   * @return The string value.
   */
  const char *getString()
  {
    return value.string;
  }

  /**
   * @brief Get the type of the argument.
   * @return The argument type.
   */
  ArgType getType()
  {
    return type;
  }

private:
  ArgData value; ///< The argument value
  ArgType type;  ///< The argument type
};

/**
 * @brief Container class for a set of command arguments.
 */
class Args
{
public:
  /**
   * @brief Access an argument by index.
   * @param idx The argument index.
   * @return Reference to the argument.
   */
  Arg &operator[](uint8_t idx)
  {
    return args[idx];
  }

  /**
   * @brief Access an argument by index (const version).
   * @param idx The argument index.
   * @return Const reference to the argument.
   */
  const Arg &operator[](uint8_t idx) const
  {
    return args[idx];
  }

private:
  Arg args[MAX_ARGS]; ///< Array of arguments
};

namespace impl
{
  /**
   * @brief Structure representing a numeric range.
   */
  struct Range
  {
    /**
     * @brief Constructor.
     * @param minimum The minimum value.
     * @param maximum The maximum value.
     */
    constexpr Range(int32_t minimum, int32_t maximum) : minimum(minimum), maximum(maximum) {}
    int32_t minimum; ///< Minimum value of the range
    int32_t maximum; ///< Maximum value of the range
  };

  /**
   * @brief Structure for defining and validating argument constraints.
   */
  struct ArgConstraint
  {
    /**
     * @brief Default constructor creating a null constraint.
     */
    ArgConstraint()
        : type(ArgType::Null), getRangeFn(nullptr), getNamePgmFn(nullptr) {}

    /**
     * @brief Constructor with just the argument type.
     * @param type The argument type.
     */
    constexpr explicit ArgConstraint(const ArgType type)
        : type(type), getRangeFn(nullptr), getNamePgmFn(nullptr) {}

    /**
     * @brief Constructor with type and range.
     * @param type The argument type.
     * @param getRangeFn Function to get the valid range.
     */
    constexpr ArgConstraint(const ArgType type, Range (*getRangeFn)())
        : type(type), getRangeFn(getRangeFn), getNamePgmFn(nullptr) {}

    /**
     * @brief Constructor with type and name.
     * @param type The argument type.
     * @param getNamePgmFn Function to get the argument name.
     */
    constexpr ArgConstraint(const ArgType type, PGM_P (*getNamePgmFn)())
        : type(type), getRangeFn(nullptr), getNamePgmFn(getNamePgmFn) {}

    /**
     * @brief Constructor with type, range and name.
     * @param type The argument type.
     * @param getRangeFn Function to get the valid range.
     * @param getNamePgmFn Function to get the argument name.
     */
    constexpr ArgConstraint(const ArgType type, Range (*getRangeFn)(), PGM_P (*getNamePgmFn)())
        : type(type), getRangeFn(getRangeFn), getNamePgmFn(getNamePgmFn) {}

    const ArgType type;      ///< The argument type
    Range (*getRangeFn)();   ///< Function to get the valid range
    PGM_P (*getNamePgmFn)(); ///< Function to get the argument name

    /**
     * @brief Get the argument name from PROGMEM.
     * @return The argument name or default type name if not set.
     */
    PGM_P getNamePgm() const
    {
      if (getNamePgmFn)
      {
        return (*getNamePgmFn)();
      }
      else
      {
        return getTypeNamePgm(type);
      }
    }

    /**
     * @brief Check if an argument value is within the valid range.
     * @param arg The argument to check.
     * @return true if the value is in range, false otherwise.
     */
    bool isInRange(Arg arg)
    {
      if (getRangeFn)
      {
        Range range = (*getRangeFn)();
        switch (arg.getType())
        {
        case ArgType::Int:
          return arg.getInt() >= range.minimum && arg.getInt() <= range.maximum;
        case ArgType::Float:
          return arg.getFloat() >= range.minimum && arg.getFloat() <= range.maximum;
        default:
          return true;
        }
      }
      return true;
    }

    /**
     * @brief Get the valid range for the argument.
     * @return The range object or default full range if not set.
     */
    Range getRange()
    {
      if (getRangeFn)
      {
        return (*getRangeFn)();
      }
      return Range(INT32_MIN, INT32_MAX);
    }

    /**
     * @brief Get the type name from PROGMEM based on the ArgType.
     * @param type The argument type.
     * @return The type name as a PROGMEM string pointer.
     */
    static PGM_P getTypeNamePgm(ArgType type)
    {
      static const char _null[] PROGMEM = "null";
      static const char _int[] PROGMEM = "int";
      static const char _float[] PROGMEM = "float";
      static const char _string[] PROGMEM = "string";
      static const char *const types[] PROGMEM{_null, _int, _float, _string};
      return (PGM_P)pgm_read_word(&(types[(int)type]));
    }

    /**
     * @brief Template function to store a name in PROGMEM.
     * @tparam chars The characters of the name.
     * @return PROGMEM string pointer to the name.
     */
    template <char... chars>
    static PGM_P getNamePgm()
    {
      static const char _name[] PROGMEM = {chars...};
      return _name;
    }

    /**
     * @brief Template function to create a Range object.
     * @tparam min The minimum value.
     * @tparam max The maximum value.
     * @return The Range object.
     */
    template <int32_t min, int32_t max>
    static Range getRange()
    {
      return Range(min, max);
    }
  };

}

#endif // STATIC_SERIAL_COMMANDS_ARG_H
