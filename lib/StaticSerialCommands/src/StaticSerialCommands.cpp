/*---------------------------------------------------------------------
Author         : naszly
License        : BSD
Repository     : https://github.com/naszly/Arduino-StaticSerialCommands
-----------------------------------------------------------------------*/

#include "Parse.h"
#include "StaticSerialCommands.h"

void SerialCommands::printCommand(const Command &command)
{
  if (command.hasParent())
  {
    printCommand(command.getParent());
    serial->print(' ');
  }

  printFromPgm(command.getCommandPgm());

  uint8_t count = 0;
  const impl::ArgConstraint *argcs = command.getArgsPgm(&count);
  impl::ArgConstraint argc;
  for (uint16_t j = 0; j < count; ++j)
  {
    memcpy_P(&argc, &argcs[j], sizeof(impl::ArgConstraint));
    serial->print(' ');
    serial->print('<');
    printFromPgm(argc.getNamePgm());
    serial->print('>');
  }
}

void SerialCommands::printCommandDescription(const Command &command)
{
  printFromPgm(command.getDescriptionPgm());
}

void SerialCommands::listCommands(const Command *commands, uint16_t commandsCount)
{
  for (uint16_t i = 0; i < commandsCount; ++i)
  {
    printCommand(commands[i]);
    serial->print(F(" - "));
    printCommandDescription(commands[i]);
    serial->println();
  }
}

void SerialCommands::listAllCommands(const Command *commands, uint16_t commandsCount)
{
  const Command *subcmds;
  uint16_t subcmdCount;
  for (uint16_t i = 0; i < commandsCount; ++i)
  {
    printCommand(commands[i]);
    serial->print(F(" - "));
    printCommandDescription(commands[i]);
    serial->println();

    subcmds = nullptr;
    commands[i].getSubCommands(&subcmds, &subcmdCount);
    if (subcmds != nullptr)
    {
      listAllCommands(subcmds, subcmdCount);
    }
  }
}

void SerialCommands::readSerial()
{
  static uint16_t index = 0;
  static uint64_t lastTime = millis();

  if (timeout != 0 && lastTime + timeout < millis())
  {
    index = 0;
  }

  while (serial->available())
  {
    lastTime = millis();
    int ch = serial->read();
    if (isTerm(ch))
    {
      if (index > 0)
      {
        buffer[index] = '\0';
        parseCommand(buffer);
        index = 0;
      }
    }
    else if (index < bufferSize)
    {
      buffer[index] = ch;
      index++;
    }
    else
    {
      serial->println(F("ERROR: Buffer overflow"));
      index = 0;
    }
  }
}

const Command *SerialCommands::findCommand(const char *const string, const Command *commands, uint16_t commandsCount)
{
  uint16_t len = strlen(string);
  uint16_t index;
  uint16_t count = 0;
  for (uint16_t i = 0; i < commandsCount; ++i)
  {
    PGM_P cmd = commands[i].getCommandPgm();
    if (memcmp_P(string, cmd, len + 1) == 0)
      return &commands[i];
    if (memcmp_P(string, cmd, len) == 0)
    {
      ++count;
      index = i;
    }
  }
  if (count == 1)
    return &commands[index];
  return nullptr;
}

bool SerialCommands::processArguments(const Command *cmd, char **string, Args &args, uint8_t &argIndex)
{
  uint8_t argCount;
  const impl::ArgConstraint *argcs = cmd->getArgsPgm(&argCount);
  impl::ArgConstraint argc;
  for (uint8_t i = 0; i < argCount; ++i)
  {
    memcpy_P(&argc, &argcs[i], sizeof(impl::ArgConstraint));
    char *token = getToken(string);
    if (token == nullptr)
    {
      serial->println(F("ERROR: Not enough arguments"));
      printCommand(*cmd);
      serial->println();
      return false;
    }
    if (!getArg(args[argIndex], token, argc))
    {
      serial->print(F("ERROR: Can't parse argument "));
      serial->println(argIndex + 1);
      printCommand(*cmd);
      serial->println();
      return false;
    }
    if (!argc.isInRange(args[argIndex]))
    {
      serial->print(F("ERROR: Argument out of range "));
      serial->print(argIndex + 1);
      impl::Range range = argc.getRange();
      serial->print(F(" ("));
      serial->print(range.minimum);
      serial->print(F(" - "));
      serial->print(range.maximum);
      serial->println(')');
      printCommand(*cmd);
      serial->println();
      return false;
    }
    argIndex++;
  }
  return true;
}

void SerialCommands::parseCommand(char *string)
{
  char *token;
  uint8_t argIndex = 0;
  Args args{};
  const Command *cmd = nullptr;
  const Command *cmds = this->commands;
  uint16_t cmdsCount = commandsCount;

  token = getToken(&string);
  while (token != nullptr)
  {
    cmd = findCommand(token, cmds, cmdsCount);
    if (cmd != nullptr)
    {
      if (!processArguments(cmd, &string, args, argIndex))
        return;

      cmd->getSubCommands(&cmds, &cmdsCount);
      token = getToken(&string);
      if (cmds == nullptr)
      {
        if (token != nullptr)
        {
          serial->println(F("ERROR: Too many arguments"));
          printCommand(*cmd);
          serial->println();
          return;
        }
        cmd->runCommand(*this, args);
        return;
      }
      else if (token == nullptr)
      {
        cmd->runCommand(*this, args);
        return;
      }
    }
    else
    {
      serial->print(F("ERROR: Command does not exist \""));
      serial->print(token);
      serial->println('"');
      return;
    }
  }
}

char *SerialCommands::getToken(char **stringp)
{
  char *begin, *end;
  begin = *stringp;
  if (begin == nullptr)
    return nullptr;

  while (isDelim(*begin))
    begin++;

  if (isQuotation(*begin))
  {
    const char quote = *begin;
    begin++;
    end = begin;
    while (*end != quote && *end != '\0')
      end++;

    if (*end == quote)
    {
      *end = '\0';
      end++;
    }
  }
  else
  {
    end = begin;
    while (!isDelim(*end) && *end != '\0')
      end++;
  }

  while (isDelim(*end))
  {
    *end = '\0';
    end++;
  }

  if (*end != '\0')
    *stringp = end;
  else
    *stringp = nullptr;

  return begin;
}

bool SerialCommands::getArg(Arg &out, const char *string, const impl::ArgConstraint &arg)
{
  switch (arg.type)
  {
  case ArgType::String:
    out = Arg(string);
    return true;

  case ArgType::Int:
  {
    int32_t value;
    if (parse::strtoi(string, &value))
    {
      out = Arg(value);
      return true;
    }
  }
  break;

  case ArgType::Float:
  {
    float value_f;
    if (parse::strtof(string, &value_f))
    {
      out = Arg(value_f);
      return true;
    }
  }
  break;

  default:
    break;
  }
  return false;
}

void SerialCommands::printFromPgm(PGM_P str)
{
  serial->print(reinterpret_cast<const __FlashStringHelper *>(str));
}
