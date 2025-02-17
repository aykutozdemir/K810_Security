#ifndef COMMANDCALLBACKS_H
#define COMMANDCALLBACKS_H

#include <StaticSerialCommands.h>

void commandHelp(SerialCommands &sender, Args &args);

void commandPing(SerialCommands &sender, Args &args);

void commandIrq(SerialCommands &sender, Args &args);

void commandRam(SerialCommands &sender, Args &args);

void commandStatistics(SerialCommands &sender, Args &args);

void commandGenSalt(SerialCommands &sender, Args &args);

void commandGenSeed(SerialCommands &sender, Args &args);

void commandCheck(SerialCommands &sender, Args &args);

void commandState(SerialCommands &sender, Args &args);

void commandLock(SerialCommands &sender, Args &args);

void commandUnlock(SerialCommands &sender, Args &args);

#endif