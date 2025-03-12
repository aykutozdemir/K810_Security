/**
 * @file CommandCallbacks.h
 * @brief Serial command handlers for system control.
 *
 * This file defines callback functions for handling serial commands
 * for system monitoring, configuration, and control.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef COMMANDCALLBACKS_H
#define COMMANDCALLBACKS_H

#include <StaticSerialCommands.h>

/**
 * @brief Display help information about available commands.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandHelp(SerialCommands &sender, Args &args);

/**
 * @brief Respond to a ping command to verify connectivity.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandPing(SerialCommands &sender, Args &args);

/**
 * @brief Display RAM usage information.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandRam(SerialCommands &sender, Args &args);

/**
 * @brief Display performance statistics.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandStatistics(SerialCommands &sender, Args &args);

/**
 * @brief Generate and display a random salt value for encryption.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandGenSalt(SerialCommands &sender, Args &args);

/**
 * @brief Generate and display a random seed for encryption.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandGenSeed(SerialCommands &sender, Args &args);

/**
 * @brief Verify the seed or perform other security checks.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandCheck(SerialCommands &sender, Args &args);

/**
 * @brief Display the current state of the system.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandState(SerialCommands &sender, Args &args);

/**
 * @brief Lock the keyboard/system.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandLock(SerialCommands &sender, Args &args);

/**
 * @brief Unlock the keyboard/system.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandUnlock(SerialCommands &sender, Args &args);

/**
 * @brief Reset the microcontroller.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandReset(SerialCommands &sender, Args &args);

/**
 * @brief Reset the microcontroller in preparation for programming.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandResetForProgramming(SerialCommands &sender, Args &args);

/**
 * @brief Display the firmware version.
 * @param sender Reference to the SerialCommands instance.
 * @param args Command arguments.
 */
void commandVersion(SerialCommands &sender, Args &args);

#endif