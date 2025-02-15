#include "KeyboardController.h"
#include <EEPROM.h>

#define SALT_ADDRESS 0
#define SEED_CHECKED_ADDRESS 1
#define SEED_ADDRESS 2

KeyboardController::KeyboardController(const uint8_t keyboardPowerPin)
  : m_keyboardPowerOutput(keyboardPowerPin), m_state(LOCKED) {
  m_keyboardPowerOutput.low();
}  // end KeyboardController

KeyboardController::State KeyboardController::state() const {
  return m_state;
}  // end state

void KeyboardController::lock() {
  if (m_state != LOCKED) {
    m_state = LOCKED;
    m_keyboardPowerOutput.low();
    Serial.println(F("Keyboard locked."));
  }  // end if
}  // end lock

void KeyboardController::unlock() {
  if (m_state != UNLOCKED) {
    m_state = UNLOCKED;
    m_keyboardPowerOutput.high();
    Serial.println(F("Keyboard unlocked."));
  }  // end if
}  // end unlock

void KeyboardController::generateSeed(byte* const seedArr,
                                      const uint8_t arrLength) {
  if (arrLength < SEED_LENGTH) {
    return;
  }

  if (EEPROM.read(SEED_ADDRESS) != 0) {
    for (int i = 0; i < SEED_LENGTH; ++i) {
      seedArr[i] = EEPROM.read(SEED_ADDRESS + i);
    }

    return;
  }

  srand(millis());

  for (int i = 0; i < SEED_LENGTH; ++i) {
    seedArr[i] = (rand() % (0xFF - 1)) + 1;

    EEPROM.update(SEED_ADDRESS + i, seedArr[i]);
  }
}

byte KeyboardController::generateSalt() {
  byte salt = EEPROM.read(SALT_ADDRESS);

  if (salt != 0) {
    return salt;
  }

  srand(millis());
  salt = (rand() % (0xFF - 1)) + 1;

  EEPROM.update(SALT_ADDRESS, salt);

  return salt;
}

bool KeyboardController::isSeedChecked() {
  return EEPROM.read(SEED_CHECKED_ADDRESS);
}

void KeyboardController::seedChecked() {
  EEPROM.update(SEED_CHECKED_ADDRESS, true);
}

void KeyboardController::cypherEncryption(byte* const dataArr,
                                          const uint8_t arrLength,
                                          const byte salt) {
  if (arrLength <= 0) {
    return;
  }

  dataArr[0] ^= salt;

  for (size_t i = 1; i < arrLength; ++i) {
    dataArr[i] ^= dataArr[i - 1];
  }
}

void KeyboardController::cypherDecryption(byte* const dataArr,
                                          const uint8_t arrLength,
                                          const byte salt) {
  if (arrLength <= 0) {
    return;
  }

  uint8_t prevEncrypted = dataArr[0];
  dataArr[0] ^= salt;

  for (size_t i = 1; i < arrLength; ++i) {
    const uint8_t currentEncrypted = dataArr[i];
    dataArr[i] ^= prevEncrypted;
    prevEncrypted = currentEncrypted;
  }
}

void KeyboardController::cypherEncryption(byte* const dataArr,
                                          const uint8_t dataArrLength,
                                          byte* const seedArr,
                                          const uint8_t seedArrLength) {
  if (dataArrLength == 0 || seedArrLength == 0) {
    return;
  }

  dataArr[0] ^= seedArr[0];

  for (size_t i = 1; i < dataArrLength; ++i) {
    dataArr[i] ^= seedArr[i % seedArrLength];
    dataArr[i] ^= dataArr[i - 1];
  }
}

void KeyboardController::cypherDecryption(byte* const dataArr,
                                          const uint8_t dataArrLength,
                                          byte* const seedArr,
                                          const uint8_t seedArrLength) {
  if (dataArrLength == 0 || seedArrLength == 0) {
    return;
  }

  // Decrypt the first element.
  dataArr[0] ^= seedArr[0];

  // For each subsequent element, use the previous encrypted element
  // to recover the original value.
  for (size_t i = 1; i < dataArrLength; ++i) {
    dataArr[i] ^= seedArr[i % seedArrLength];
    dataArr[i] ^= dataArr[i - 1];
  }
}

void KeyboardController::loop() {
  m_keyboardPowerOutput.loop();
}  // end loop