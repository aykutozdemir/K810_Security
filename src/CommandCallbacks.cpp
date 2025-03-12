#include "CommandCallbacks.h"
#include "Globals.h"
#include "Utilities.h"

//================ Helper Functions for Commands ==================

// Helper to check that the seed has not been set already.
static inline bool requireSeedNotChecked(SerialCommands &sender)
{
  if (KeyboardController::isSeedChecked())
  {
    Utilities::printError(sender, F("Already checked"));
    return false;
  }
  return true;
}

// Parse a hexadecimal string into a seed array.
static inline bool parseSeedString(const char *str, byte *seed, size_t length)
{
  for (size_t i = 0; i < length; ++i)
  {
    byte highNibble, lowNibble;
    if (!Utilities::hexCharToByte(str[2 * i], highNibble) || !Utilities::hexCharToByte(str[2 * i + 1], lowNibble))
    {
      return false;
    }
    seed[i] = (highNibble << 4) | lowNibble;
  }
  return true;
}

// Check the provided seed argument against the generated seed.
bool seedCheck(SerialCommands &sender, Args &args)
{
  if (!KeyboardController::isSeedChecked())
  {
    Utilities::printError(sender, F("Seed not checked"));
    return false;
  }

  byte seed[SEED_LENGTH];
  if (!parseSeedString(args[0].getString(), seed, SEED_LENGTH))
  {
    Utilities::printError(sender, F("Invalid seed format"));
    return false;
  }

  byte genSeed[SEED_LENGTH];
  KeyboardController::generateSeed(genSeed, SEED_LENGTH);
  KeyboardController::cypherDecryption(seed, SEED_LENGTH, genSeed, SEED_LENGTH, KeyboardController::generateSalt());

  // Check index 0 first for early exit
  if (seed[0] != genSeed[0])
  {
    Utilities::printError(sender, F("Seed not matched"));
    return false;
  }

  // Only check remaining indices if first one matched
  for (int i = 1; i < SEED_LENGTH; ++i)
  {
    if (seed[i] != genSeed[i])
    {
      Utilities::printError(sender, F("Seed not matched"));
      return false;
    }
  }
  return true;
}

//================ Command Callbacks ==================

void commandHelp(SerialCommands &sender, Args &args)
{
  sender.listCommands();
  Utilities::printOK(sender);
}

void commandPing(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(F("pong"));
  Utilities::printOK(sender);
}

void commandRam(SerialCommands &sender, Args &args)
{
  statisticController.printRam(sender.getSerial());
  Utilities::printOK(sender);
}

void commandStatistics(SerialCommands &sender, Args &args)
{
  statisticController.printStatisticTable(sender.getSerial(),
                                          statistics,
                                          lengthOfStatistics);
  Utilities::printOK(sender);
}

void commandGenSalt(SerialCommands &sender, Args &args)
{
  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = KeyboardController::generateSalt();
  Utilities::printHexByte(sender, salt);
  Utilities::printOK(sender);
}

void commandGenSeed(SerialCommands &sender, Args &args)
{
  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = KeyboardController::generateSalt();
  byte seed[SEED_LENGTH];
  KeyboardController::generateSeed(seed, SEED_LENGTH);
  KeyboardController::cypherEncryption(seed, SEED_LENGTH, salt);
  for (int i = 0; i < SEED_LENGTH; ++i)
  {
    Utilities::printHexByte(sender, seed[i]);
  }
  Utilities::printOK(sender);
}

void commandCheck(SerialCommands &sender, Args &args)
{
  if (KeyboardController::isSeedChecked())
  {
    Utilities::printError(sender, F("Already checked"));
    return;
  }
  KeyboardController::seedChecked();
  Utilities::printOK(sender);
}

void commandState(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(keyboardController.state());
  Utilities::printOK(sender);
}

void commandLock(SerialCommands &sender, Args &args)
{
  if (!seedCheck(sender, args))
    return;
  keyboardController.lock();
  Utilities::printOK(sender);
}

void commandUnlock(SerialCommands &sender, Args &args)
{
  if (!seedCheck(sender, args))
    return;
  keyboardController.unlock();
  Utilities::printOK(sender);
}

void commandReset(SerialCommands &sender, Args &args)
{
  watchdogController.resetMCU();
  Utilities::printOK(sender);
}

void commandResetForProgramming(SerialCommands &sender, Args &args)
{
  watchdogController.resetMCUForSelfProgramming();
  Utilities::printOK(sender);
}

void commandVersion(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(KeyboardController::getVersion());
  Utilities::printOK(sender);
}
