// Arduino core
#include <EEPROM.h>

// Project headers
#include "KeyboardController.h"
#include "Globals.h"

#include "TraceLevel.h"
#undef CLASS_TRACE_LEVEL
#define CLASS_TRACE_LEVEL DEBUG_KEYBOARD_CONTROLLER
#include "TraceHelper.h"

KeyboardController::KeyboardController(const uint8_t keyboardPowerPin,
                                       const uint8_t keyboardDpPin,
                                       const uint8_t keyboardDmPin)
    : Traceable(F("KeyboardController"), static_cast<Level>(DEBUG_KEYBOARD_CONTROLLER)), m_keyboardPowerOutput(keyboardPowerPin, OUTPUT), m_keyboardDpControl(keyboardDpPin, OUTPUT), m_keyboardDmControl(keyboardDmPin, OUTPUT), m_state(LOCKED)
{
  m_keyboardPowerOutput.low();
  m_keyboardDpControl.low();
  m_keyboardDmControl.low();
} // end KeyboardController

KeyboardController::State KeyboardController::state() const
{
  return m_state;
} // end state

void KeyboardController::lock()
{
  if (m_state != LOCKED)
  {
    m_state = LOCKED;
    m_keyboardPowerOutput.low();
    blockUSB();
    TRACE_INFO()
        << F("Keyboard locked")
        << endl;
  } // end if
} // end lock

void KeyboardController::unlock(const bool releaseUSBFlag)
{
  if (m_state != UNLOCKED)
  {
    if (releaseUSBFlag)
    {
      releaseUSB();
    } // end if
    m_keyboardPowerOutput.high();
    m_state = UNLOCKED;
    TRACE_INFO()
        << F("Keyboard unlocked")
        << endl;
  } // end if
  if (!releaseUSBFlag)
  {
    blockUSB();
  } // end if
} // end unlock

void KeyboardController::generateSeed(byte *const seedArr,
                                      const uint8_t arrLength)
{
  if (arrLength < SEED_LENGTH)
  {
    return;
  }

  if (EEPROM.read(EEPROM_SEED_ADDRESS) != 0)
  {
    for (int i = 0; i < SEED_LENGTH; ++i)
    {
      seedArr[i] = EEPROM.read(EEPROM_SEED_ADDRESS + i);
    }

    return;
  }

  srand(millis());

  for (int i = 0; i < SEED_LENGTH; ++i)
  {
    seedArr[i] = (rand() % (0xFF - 1)) + 1;

    EEPROM.update(EEPROM_SEED_ADDRESS + i, seedArr[i]);
  }
}

byte KeyboardController::generateSalt()
{
  byte salt = EEPROM.read(EEPROM_SALT_ADDRESS);

  if (salt != 0)
  {
    return salt;
  }

  srand(millis());
  salt = (rand() % (0xFF - 1)) + 1;

  EEPROM.update(EEPROM_SALT_ADDRESS, salt);

  return salt;
}

bool KeyboardController::isSeedChecked()
{
  return EEPROM.read(EEPROM_SEED_CHECKED_ADDRESS) != 0;
}

void KeyboardController::seedChecked()
{
  EEPROM.update(EEPROM_SEED_CHECKED_ADDRESS, true);
}

void KeyboardController::cypherEncryption(byte *const dataArr,
                                          const uint8_t arrLength,
                                          const byte salt)
{
  if (arrLength == 0)
  {
    return;
  }

  dataArr[0] ^= salt;

  for (uint8_t i = 1; i < arrLength; i++)
  {
    dataArr[i] ^= dataArr[i - 1];
  }
}

void KeyboardController::cypherDecryption(byte *const dataArr,
                                          const uint8_t dataArrLength,
                                          const byte salt)
{
  if (dataArrLength == 0)
  {
    return;
  }

  byte prevEncrypted = dataArr[0];
  dataArr[0] ^= salt;

  for (uint8_t i = 1; i < dataArrLength; ++i)
  {
    const byte currentEncrypted = dataArr[i];
    dataArr[i] ^= prevEncrypted;
    prevEncrypted = currentEncrypted;
  }
}

void KeyboardController::cypherEncryption(byte *const dataArr,
                                          const uint8_t dataArrLength,
                                          const byte *const seedArr,
                                          const uint8_t seedArrLength,
                                          const byte salt)
{
  if (dataArrLength == 0 || seedArrLength == 0)
  {
    return;
  }

  const uint8_t seedOffset = (static_cast<unsigned char>(salt) % seedArrLength);

  byte prev = dataArr[0];
  dataArr[0] ^= seedArr[seedOffset];

  for (uint8_t i = 1; i < dataArrLength; i++)
  {
    byte plaintext = dataArr[i];
    dataArr[i] = (byte)(plaintext ^ prev ^ seedArr[(i + seedOffset) % seedArrLength]);
    prev = plaintext;
  }
}

void KeyboardController::cypherDecryption(byte *const dataArr,
                                          const uint8_t dataArrLength,
                                          const byte *const seedArr,
                                          const uint8_t seedArrLength,
                                          const byte salt)
{
  if (dataArrLength == 0 || seedArrLength == 0)
  {
    return;
  }

  const uint8_t seedOffset = (static_cast<unsigned char>(salt) % seedArrLength);

  dataArr[0] ^= seedArr[seedOffset];
  byte prev = dataArr[0];

  for (uint8_t i = 1; i < dataArrLength; i++)
  {
    dataArr[i] = (byte)(dataArr[i] ^ prev ^ seedArr[(i + seedOffset) % seedArrLength]);
    prev = dataArr[i];
  }
}

uint16_t KeyboardController::getVersion()
{
  return BUILD_VERSION;
}

void KeyboardController::loop()
{
  switch (m_state) {
    case LOCKED:
      // Do nothing when locked
      break;

    case UNLOCKED:
      // Do nothing when unlocked
      break;
  }
} // end loop

void KeyboardController::blockUSB()
{
  m_keyboardDpControl.setMode(true);
  m_keyboardDmControl.setMode(true);
  m_keyboardDpControl.low();
  m_keyboardDmControl.low();
  TRACE_INFO()
      << F("USB blocked")
      << endl;
} // end blockUSB

void KeyboardController::releaseUSB()
{
  m_keyboardDpControl.setMode(false);
  m_keyboardDmControl.setMode(false);
  TRACE_INFO()
      << F("USB released")
      << endl;
} // end releaseUSB