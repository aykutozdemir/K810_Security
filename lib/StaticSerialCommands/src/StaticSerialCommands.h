/*---------------------------------------------------------------------
Author         : naszly
License        : BSD
Repository     : https://github.com/naszly/Arduino-StaticSerialCommands
-----------------------------------------------------------------------*/

/**
 * @file StaticSerialCommands.h
 * @brief Serial command parser and handler for Arduino.
 *
 * This file defines the SerialCommands class, which provides a command-line
 * interface over serial for Arduino applications. It supports hierarchical
 * commands, argument parsing, and help text generation.
 *
 * @author naszly
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STATIC_SERIAL_COMMANDS_H
#define STATIC_SERIAL_COMMANDS_H

#include <Arduino.h>
#include "Command.h"

/**
 * @brief Macro to create a SerialCommands instance with a given serial port and command array.
 * @param serial The serial port to use.
 * @param commands Array of commands to register.
 */
#define SERIAL_COMMANDS(serial, commands) SerialCommands(serial, commands, sizeof(commands) / sizeof(Command))

/**
 * @brief Default delimiter character for command parsing.
 */
#define CMD_DELIM ' '

/**
 * @brief Default quotation character for handling quoted strings.
 */
#define CMD_QUOTATION '"'

/**
 * @brief First termination character for command parsing (newline).
 */
#define CMD_TERM_1 '\n'

/**
 * @brief Second termination character for command parsing (carriage return).
 */
#define CMD_TERM_2 '\r'

/**
 * @brief Main class for handling serial commands.
 *
 * This class provides functionality to parse and execute commands received
 * over a serial interface. It supports command hierarchies, argument validation,
 * and help text generation.
 */
class SerialCommands
{
public:
  /**
   * @brief Type definition for a character predicate function.
   *
   * This function type is used to determine if a character meets certain criteria
   * (e.g., is a delimiter, quotation, or terminator).
   */
  typedef bool (*CharPredicate)(char);

  /**
   * @brief Constructor with custom buffer.
   *
   * @param serial The Stream to use for communication.
   * @param commands Array of Command objects to register.
   * @param commandsCount Number of commands in the array.
   * @param buffer Buffer to use for command processing.
   * @param bufferSize Size of the buffer.
   * @param timeout Timeout in milliseconds for command input (0 for no timeout).
   */
  SerialCommands(Stream &serial, const Command *commands, uint16_t commandsCount, char *buffer, uint16_t bufferSize, uint16_t timeout = 0)
      : serial(&serial), buffer(buffer), bufferSize(bufferSize),
        commands(commands), commandsCount(commandsCount),
        timeout(timeout) {}

  /**
   * @brief Constructor with default internal buffer.
   *
   * @param serial The Stream to use for communication.
   * @param commands Array of Command objects to register.
   * @param commandsCount Number of commands in the array.
   */
  SerialCommands(Stream &serial, const Command *commands, uint16_t commandsCount)
      : serial(&serial),
        commands(commands), commandsCount(commandsCount), timeout(0)
  {
    static char tmpBffer[64];
    this->buffer = tmpBffer;
    bufferSize = sizeof(buffer);
  }

  /**
   * @brief Print a command's syntax.
   *
   * Prints the command name and argument descriptions to the serial output.
   *
   * @param command The command to print.
   */
  void printCommand(const Command &command);

  /**
   * @brief Print a command's description.
   *
   * Prints the description of the command to the serial output.
   *
   * @param command The command to print the description of.
   */
  void printCommandDescription(const Command &command);

  /**
   * @brief List all commands in a command set.
   *
   * Lists the commands with their descriptions but does not recurse into subcommands.
   *
   * @param commands Array of commands to list.
   * @param commandsCount Number of commands in the array.
   */
  void listCommands(const Command *commands, uint16_t commandsCount);

  /**
   * @brief List all commands and subcommands recursively.
   *
   * Lists all commands and their subcommands with descriptions.
   *
   * @param commands Array of commands to list.
   * @param commandsCount Number of commands in the array.
   */
  void listAllCommands(const Command *commands, uint16_t commandsCount);

  /**
   * @brief List all registered commands.
   *
   * Lists the registered commands with their descriptions but does not recurse into subcommands.
   */
  void listCommands()
  {
    listCommands(commands, commandsCount);
  }

  /**
   * @brief List all registered commands and subcommands recursively.
   *
   * Lists all registered commands and their subcommands with descriptions.
   */
  void listAllCommands()
  {
    listAllCommands(commands, commandsCount);
  }

  /**
   * @brief Read and process commands from the serial interface.
   *
   * This method should be called regularly to check for and process incoming commands.
   */
  void readSerial();

  /**
   * @brief Get the Stream object used for communication.
   *
   * @return Reference to the Stream object.
   */
  Stream &getSerial()
  {
    return *serial;
  }

  /**
   * @brief Set the delimiter predicate function.
   *
   * @param predicate Function that determines if a character is a delimiter.
   */
  void setDelimiterPredicate(CharPredicate predicate)
  {
    isDelim = predicate;
  }

  /**
   * @brief Set the quotation predicate function.
   *
   * @param predicate Function that determines if a character is a quotation mark.
   */
  void setQuotationPredicate(CharPredicate predicate)
  {
    isQuotation = predicate;
  }

  /**
   * @brief Set the termination predicate function.
   *
   * @param predicate Function that determines if a character is a terminator.
   */
  void setTerminationPredicate(CharPredicate predicate)
  {
    isTerm = predicate;
  }

  /**
   * @brief Set the delimiter characters.
   *
   * @tparam chars Characters to recognize as delimiters.
   */
  template <char... chars>
  void setDelimiterChars()
  {
    isDelim = anyChar<chars...>;
  }

  /**
   * @brief Set the quotation characters.
   *
   * @tparam chars Characters to recognize as quotation marks.
   */
  template <char... chars>
  void setQuotationChars()
  {
    isQuotation = anyChar<chars...>;
  }

  /**
   * @brief Set the termination characters.
   *
   * @tparam chars Characters to recognize as terminators.
   */
  template <char... chars>
  void setTerminationChars()
  {
    isTerm = anyChar<chars...>;
  }

private:
  Stream *const serial;         ///< Stream for communication
  char *buffer;                 ///< Buffer for command processing
  uint16_t bufferSize;          ///< Size of the buffer
  const Command *commands;      ///< Array of registered commands
  const uint16_t commandsCount; ///< Number of registered commands
  const uint16_t timeout;       ///< Timeout for command input

  /**
   * @brief Default delimiter predicate.
   */
  CharPredicate isDelim = [](char c)
  { return c == CMD_DELIM; };

  /**
   * @brief Default quotation predicate.
   */
  CharPredicate isQuotation = [](char c)
  { return c == CMD_QUOTATION; };

  /**
   * @brief Default termination predicate.
   */
  CharPredicate isTerm = [](char c)
  { return c == CMD_TERM_1 || c == CMD_TERM_2; };

  /**
   * @brief Find a command by name in the command array.
   *
   * @param string The command name to find.
   * @param commands Array of commands to search.
   * @param commandsCount Number of commands in the array.
   * @return Pointer to the found command or nullptr if not found.
   */
  const Command *findCommand(const char *const string, const Command *commands, uint16_t commandsCount);

  /**
   * @brief Parse and execute a command string.
   *
   * @param string The command string to parse.
   */
  void parseCommand(char *string);

  /**
   * @brief Get the next token from a string.
   *
   * @param stringp Pointer to string pointer (modified).
   * @return Pointer to the token or nullptr if no more tokens.
   */
  char *getToken(char **stringp);

  /**
   * @brief Parse an argument from a string according to a constraint.
   *
   * @param out Output argument.
   * @param string The string to parse.
   * @param arg The argument constraint.
   * @return true if parsing was successful, false otherwise.
   */
  bool getArg(Arg &out, const char *string, const impl::ArgConstraint &arg);

  /**
   * @brief Process command arguments.
   *
   * @param cmd The command to process arguments for.
   * @param string Pointer to the command string (modified).
   * @param args Output arguments.
   * @param argIndex Current argument index (modified).
   * @return true if all arguments were successfully processed, false otherwise.
   */
  bool processArguments(const Command *cmd, char **string, Args &args, uint8_t &argIndex);

  /**
   * @brief Print a string from program memory.
   *
   * @param str Pointer to the string in program memory.
   */
  void printFromPgm(PGM_P str);

  /**
   * @brief Check if a character matches any of the specified characters.
   *
   * @tparam chars Characters to check against.
   * @param c The character to check.
   * @return true if the character matches any of the specified characters, false otherwise.
   */
  template <char... chars>
  static bool anyChar(char c)
  {
    const char arr[] = {chars...};
    const size_t len = sizeof...(chars);
    for (size_t i = 0; i < len; i++)
    {
      if (c == arr[i])
        return true;
    }
    return false;
  }
};

#endif // STATIC_SERIAL_COMMANDS_H
