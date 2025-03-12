/*---------------------------------------------------------------------
Author         : naszly
License        : BSD
Repository     : https://github.com/naszly/Arduino-StaticSerialCommands
-----------------------------------------------------------------------*/

/**
 * @file Command.h
 * @brief Command handling classes for StaticSerialCommands.
 *
 * This file provides classes for defining and managing commands in the
 * StaticSerialCommands library. It handles command storage, parent-child
 * relationship, and execution.
 *
 * @author naszly
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 */

#ifndef STATIC_SERIAL_COMMANDS_COMMAND_H
#define STATIC_SERIAL_COMMANDS_COMMAND_H

#include <Arduino.h>
#include "CommandBuilder.h"
#include "Arg.h"

class SerialCommands;

namespace impl
{
  /**
   * @brief Internal implementation of the Command structure.
   *
   * This template structure stores the command information including name,
   * description, arguments, and function to execute.
   *
   * @tparam commandLength Length of the command name string.
   * @tparam descriptionLength Length of the description string.
   * @tparam argCount Number of arguments for this command.
   */
  template <uint8_t commandLength = 0, uint16_t descriptionLength = 0, uint8_t argCount = 0>
  struct Command
  {
    PGM_P (*getCommandPgmFn)(PGM_VOID_P);                              ///< Function to retrieve command name
    PGM_P (*getDescriptionPgmFn)(PGM_VOID_P);                          ///< Function to retrieve description
    const impl::ArgConstraint *(*getArgsPgmFn)(PGM_VOID_P, uint8_t *); ///< Function to retrieve argument constraints
    void (*function)(SerialCommands &, Args &);                        ///< Callback function to execute
    const void *subcommands;                                           ///< Pointer to subcommands array
    const uint16_t subcommandsCount;                                   ///< Number of subcommands
    const char command[commandLength];                                 ///< Command name string
    const char description[descriptionLength];                         ///< Command description string
    const ArgConstraint args[argCount];                                ///< Array of argument constraints

    /**
     * @brief Internal helper to get the command name from PROGMEM.
     * @param cmdPtr Pointer to the Command structure.
     * @return The command name as a PROGMEM string pointer.
     */
    static PGM_P _getCommandPgm(PGM_VOID_P cmdPtr)
    {
      return ((const Command<commandLength, descriptionLength, argCount> *)cmdPtr)->command;
    }

    /**
     * @brief Internal helper to get the description from PROGMEM.
     * @param cmdPtr Pointer to the Command structure.
     * @return The description as a PROGMEM string pointer.
     */
    static PGM_P _getDescriptionPgm(PGM_VOID_P cmdPtr)
    {
      return ((const Command<commandLength, descriptionLength, argCount> *)cmdPtr)->description;
    }

    /**
     * @brief Internal helper to get the argument constraints from PROGMEM.
     * @param cmdPtr Pointer to the Command structure.
     * @param count Output parameter to store the number of arguments.
     * @return Array of argument constraints.
     */
    static const impl::ArgConstraint *_getArgsPgm(PGM_VOID_P cmdPtr, uint8_t *count)
    {
      *count = argCount;
      return ((const Command<commandLength, descriptionLength, argCount> *)cmdPtr)->args;
    }
  };
}

/**
 * @brief Wrapper class for managing command information.
 *
 * This class provides a simple interface to access command information
 * and execute commands with proper argument handling.
 */
class Command
{
public:
  /**
   * @brief Constructor for a root command.
   * @param command Pointer to the command data.
   */
  constexpr explicit Command(const void *command)
      : _command((const impl::Command<> *)command), parent(nullptr) {}

  /**
   * @brief Constructor for a subcommand with parent reference.
   * @param command Pointer to the command data.
   * @param parent Pointer to the parent command data.
   */
  constexpr Command(const void *command, const void *parent)
      : _command((const impl::Command<> *)command), parent((const impl::Command<> *)parent) {}

  /**
   * @brief Get the command name from PROGMEM.
   * @return The command name as a PROGMEM string pointer.
   */
  PGM_P getCommandPgm() const
  {
    PGM_P (*_getCommandPgmFn)(PGM_VOID_P) = pgm_read_word(&(_command->getCommandPgmFn));
    return (*_getCommandPgmFn)(_command);
  }

  /**
   * @brief Get the command description from PROGMEM.
   * @return The description as a PROGMEM string pointer.
   */
  PGM_P getDescriptionPgm() const
  {
    PGM_P (*_getDescriptionPgmFn)(PGM_VOID_P) = pgm_read_word(&(_command->getDescriptionPgmFn));
    return (*_getDescriptionPgmFn)(_command);
  }

  /**
   * @brief Get the command's argument constraints.
   * @param count Output parameter to store the number of arguments.
   * @return Array of argument constraints.
   */
  const impl::ArgConstraint *getArgsPgm(uint8_t *count) const
  {
    impl::ArgConstraint *(*_getArgsPgmFn)(PGM_VOID_P, uint8_t *) = pgm_read_word(&(_command->getArgsPgmFn));
    return (*_getArgsPgmFn)(_command, count);
  }

  /**
   * @brief Execute the command with the provided arguments.
   * @param sender Reference to the SerialCommands instance.
   * @param args Arguments to pass to the command function.
   */
  void runCommand(SerialCommands &sender, Args &args) const
  {
    void (*function)(SerialCommands &, Args &) = pgm_read_word(&(_command->function));
    if (function)
    {
      (*function)(sender, args);
    }
  }

  /**
   * @brief Get the command's subcommands.
   * @param commands Output parameter to store the subcommands array.
   * @param count Output parameter to store the number of subcommands.
   */
  void getSubCommands(const Command **commands, uint16_t *count) const
  {
    *commands = pgm_read_word(&(_command->subcommands));
    *count = pgm_read_word(&(_command->subcommandsCount));
  }

  /**
   * @brief Get the parent command.
   * @return The parent command instance.
   */
  const Command getParent() const
  {
    return Command(parent);
  }

  /**
   * @brief Check if the command has a parent.
   * @return true if the command has a parent, false otherwise.
   */
  bool hasParent() const
  {
    return parent != nullptr;
  }

  /**
   * @brief Get the internal command data.
   * @return Pointer to the internal command structure.
   */
  const impl::Command<> *get()
  {
    return _command;
  }

private:
  const impl::Command<> *_command; ///< Pointer to the command data
  const impl::Command<> *parent;   ///< Pointer to the parent command data (if any)
};

#endif // STATIC_SERIAL_COMMANDS_COMMAND_H
