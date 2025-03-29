#include "CommandCallbacks.h"
#include "Globals.h"
#include "Utilities.h"
#include "Traceable.h"
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
  UNUSED(args);

  sender.listCommands();
  Utilities::printOK(sender);
}

void commandPing(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  sender.getSerial().println(F("pong"));
  Utilities::printOK(sender);
}

void commandRam(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  statisticController.printRam(sender.getSerial());
  Utilities::printOK(sender);
}

void commandStatistics(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  statisticController.printStatisticTable(sender.getSerial(),
                                          statistics,
                                          lengthOfStatistics);
  Utilities::printOK(sender);
}

void commandGenSalt(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = KeyboardController::generateSalt();
  Utilities::printHexByte(sender, salt);
  sender.getSerial().println();
  Utilities::printOK(sender);
}

void commandGenSeed(SerialCommands &sender, Args &args)
{
  UNUSED(args);

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
  sender.getSerial().println();
  Utilities::printOK(sender);
}

void commandCheck(SerialCommands &sender, Args &args)
{
  UNUSED(args);

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
  UNUSED(args);

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
  UNUSED(args);

  watchdogController.resetMCU();
  Utilities::printOK(sender);
}

void commandResetForProgramming(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  watchdogController.resetMCUForSelfProgramming();
  Utilities::printOK(sender);
}

void commandVersion(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  sender.getSerial().println(KeyboardController::getVersion());
  Utilities::printOK(sender);
}

void commandListTraceables(SerialCommands &sender, Args &args)
{
  UNUSED(args);

  for (ArduinoMap<const __FlashStringHelper *, Traceable::Settings *>::ConstIterator it =
           Traceable::getSettingsMap().cbegin();
       it != Traceable::getSettingsMap().cend();
       ++it)
  {
    sender.getSerial().print((*it).first);
    sender.getSerial().print(F(": "));
    sender.getSerial().println(static_cast<uint8_t>((*it).second->getLevel()));
  }
  Utilities::printOK(sender);
}

void commandSetTraceLevel(SerialCommands &sender, Args &args)
{
  const char *componentName = args[0].getString();
  const uint8_t level = args[1].getInt();

  if (level > static_cast<uint8_t>(Traceable::Level::TRACE))
  {
    Utilities::printError(sender, F("Invalid level"));
    return;
  }

  Traceable::Settings *settings = nullptr;
  for (auto it = Traceable::getSettingsMap().cbegin(); it != Traceable::getSettingsMap().cend(); ++it)
  {
    if (strcmp_P(componentName, (PGM_P)(*it).first) == 0)
    {
      settings = (*it).second;
      break;
    }
  }

  if (!settings)
  {
    Utilities::printError(sender, F("Component not found"));
    return;
  }

  settings->setLevel(static_cast<Traceable::Level>(level));
  Utilities::printOK(sender);
}
