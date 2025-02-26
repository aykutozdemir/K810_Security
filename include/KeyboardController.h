#ifndef KEYBOARDCONTROLLER_H
#define KEYBOARDCONTROLLER_H

// Arduino core
#include <Arduino.h>

// Third-party libraries
#include <ezOutput.h>

#define SEED_LENGTH 16

class KeyboardController final
{
public:
  enum State : uint_fast8_t
  {
    LOCKED,
    UNLOCKED
  };

  explicit KeyboardController(const uint8_t keyboardPowerPin);

  State state() const;

  void lock();

  void unlock();

  static void generateSeed(byte *const seedArr,
                           const uint8_t arrLength);

  static byte generateSalt();

  static bool isSeedChecked();

  static void seedChecked();

  static void cypherEncryption(byte *const dataArr,
                               const uint8_t arrLength,
                               const byte salt);

  static void cypherDecryption(byte *const dataArr,
                               const uint8_t arrLength,
                               const byte salt);

  static void cypherEncryption(byte *const dataArr,
                               const uint8_t dataArrLength,
                               byte *const seedArr,
                               const uint8_t seedArrLength,
                               const byte salt);

  static void cypherDecryption(byte *const dataArr,
                               const uint8_t dataArrLength,
                               byte *const seedArr,
                               const uint8_t seedArrLength,
                               const byte salt);

  void loop();

private:
  ezOutput m_keyboardPowerOutput;

  State m_state;
}; // end KeyboardController class

#endif
