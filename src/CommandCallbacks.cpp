#include "CommandCallbacks.h"
#include "Globals.h"

//================ Helper Functions for Commands ==================

// Print the standard OK response.
static inline void printOK(SerialCommands &sender)
{
  sender.getSerial().println(F("\r\nOK"));
}

// Print an error message stored in flash.
static inline void printError(SerialCommands &sender, const __FlashStringHelper *msg)
{
  sender.getSerial().print(F("ERROR: "));
  sender.getSerial().println(msg);
}

// Print a single byte in HEX with a leading zero if needed.
static inline void printHexByte(SerialCommands &sender, byte value)
{
  static const char hexChars[] PROGMEM = "0123456789ABCDEF";
  sender.getSerial().write(pgm_read_byte(&hexChars[value >> 4]));
  sender.getSerial().write(pgm_read_byte(&hexChars[value & 0x0F]));
}

// Helper to check that the seed has not been set already.
static inline bool requireSeedNotChecked(SerialCommands &sender)
{
  if (KeyboardController::isSeedChecked())
  {
    printError(sender, F("Already checked"));
    return false;
  }
  return true;
}

// Converts a hex character to its numeric value.
static inline bool hexCharToByte(const char c, byte &result)
{
  if (c >= '0' && c <= '9')
  {
    result = c - '0';
    return true;
  }
  if (c >= 'a' && c <= 'f')
  {
    result = c - 'a' + 10;
    return true;
  }
  if (c >= 'A' && c <= 'F')
  {
    result = c - 'A' + 10;
    return true;
  }
  return false; // Indicate invalid character
}

// Parse a hexadecimal string into a seed array.
static inline bool parseSeedString(const char *str, byte *seed, size_t length)
{
  for (size_t i = 0; i < length; ++i)
  {
    byte highNibble, lowNibble;
    if (!hexCharToByte(str[2 * i], highNibble) || !hexCharToByte(str[2 * i + 1], lowNibble))
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
    printError(sender, F("Seed not checked"));
    return false;
  }

  byte seed[SEED_LENGTH];
  if (!parseSeedString(args[0].getString(), seed, SEED_LENGTH))
  {
    printError(sender, F("Invalid seed format"));
    return false;
  }

  byte genSeed[SEED_LENGTH];
  KeyboardController::generateSeed(genSeed, SEED_LENGTH);
  KeyboardController::cypherDecryption(seed, SEED_LENGTH, genSeed, SEED_LENGTH, KeyboardController::generateSalt());

  // Check index 0 first for early exit
  if (seed[0] != genSeed[0])
  {
    printError(sender, F("Seed not matched"));
    return false;
  }

  // Only check remaining indices if first one matched
  for (int i = 1; i < SEED_LENGTH; ++i)
  {
    if (seed[i] != genSeed[i])
    {
      printError(sender, F("Seed not matched"));
      return false;
    }
  }
  return true;
}

//================ Command Callbacks ==================

void commandHelp(SerialCommands &sender, Args &args)
{
  sender.listCommands();
  printOK(sender);
}

void commandPing(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(F("pong"));
  printOK(sender);
}

void commandIrq(SerialCommands &sender, Args &args)
{
  statisticController.printInterruptTable(sender.getSerial());
  printOK(sender);
}

void commandRam(SerialCommands &sender, Args &args)
{
  statisticController.printRam(sender.getSerial());
  printOK(sender);
}

void commandStatistics(SerialCommands &sender, Args &args)
{
  statisticController.printStatisticTable(sender.getSerial(),
                                          statistics,
                                          lengthOfStatistics);
  printOK(sender);
}

void commandGenSalt(SerialCommands &sender, Args &args)
{
  if (!requireSeedNotChecked(sender))
    return;
  const byte salt = KeyboardController::generateSalt();
  printHexByte(sender, salt);
  printOK(sender);
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
    printHexByte(sender, seed[i]);
  }
  printOK(sender);
}

void commandCheck(SerialCommands &sender, Args &args)
{
  if (KeyboardController::isSeedChecked())
  {
    printError(sender, F("Already checked"));
    return;
  }
  KeyboardController::seedChecked();
  printOK(sender);
}

void commandState(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(keyboardController.state());
  printOK(sender);
}

void commandLock(SerialCommands &sender, Args &args)
{
  if (!seedCheck(sender, args))
    return;
  keyboardController.lock();
  printOK(sender);
}

void commandUnlock(SerialCommands &sender, Args &args)
{
  if (!seedCheck(sender, args))
    return;
  keyboardController.unlock();
  printOK(sender);
}

void commandReset(SerialCommands &sender, Args &args)
{
  watchdogController.resetMCU();
  printOK(sender);
}

void commandResetForProgramming(SerialCommands &sender, Args &args)
{
  watchdogController.resetMCUForSelfProgramming();
  printOK(sender);
}

void commandVersion(SerialCommands &sender, Args &args)
{
  sender.getSerial().println(KeyboardController::getVersion());
  printOK(sender);
}
