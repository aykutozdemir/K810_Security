/**
 * @file KeyboardController.h
 * @brief Keyboard security and encryption management.
 *
 * This file defines the KeyboardController class, which manages keyboard access control
 * and provides encryption/decryption utilities for secure communication with the keyboard.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef KEYBOARDCONTROLLER_H
#define KEYBOARDCONTROLLER_H

// Arduino core
#include <Arduino.h>

// Third-party libraries
#include <FastPin.h>

/**
 * @brief Length of the seed used for encryption/decryption operations.
 */
#define SEED_LENGTH 16

/**
 * @brief Class to control keyboard power and manage encryption for secure communication.
 *
 * This class provides functionality to control the power state of the keyboard,
 * manage locking/unlocking, and handle encryption/decryption of data for secure
 * communication with the keyboard.
 */
class KeyboardController final
{
public:
  /**
   * @brief Enumeration of possible keyboard controller states.
   */
  enum State : uint_fast8_t
  {
    LOCKED,  ///< Keyboard is locked (secured)
    UNLOCKED ///< Keyboard is unlocked (accessible)
  };

  /**
   * @brief Constructor that initializes the keyboard controller.
   * @param keyboardPowerPin The pin used to control power to the keyboard.
   */
  explicit KeyboardController(const uint8_t keyboardPowerPin);

  /**
   * @brief Get the current state of the keyboard.
   * @return Current state (LOCKED or UNLOCKED).
   */
  State state() const;

  /**
   * @brief Lock the keyboard by cutting power.
   */
  void lock();

  /**
   * @brief Unlock the keyboard by providing power.
   */
  void unlock();

  /**
   * @brief Generate a random seed for encryption.
   * @param seedArr Pointer to the array to store the generated seed.
   * @param arrLength Length of the seed array.
   */
  static void generateSeed(byte *const seedArr,
                           const uint8_t arrLength);

  /**
   * @brief Generate a random salt value for encryption.
   * @return A random salt byte.
   */
  static byte generateSalt();

  /**
   * @brief Check if the seed has been verified.
   * @return True if the seed has been verified, false otherwise.
   */
  static bool isSeedChecked();

  /**
   * @brief Mark the seed as checked/verified.
   */
  static void seedChecked();

  /**
   * @brief Encrypt data using the internal seed.
   * @param dataArr Pointer to the data array to encrypt.
   * @param arrLength Length of the data array.
   * @param salt Salt value for encryption.
   */
  static void cypherEncryption(byte *const dataArr,
                               const uint8_t arrLength,
                               const byte salt);

  /**
   * @brief Decrypt data using the internal seed.
   * @param dataArr Pointer to the data array to decrypt.
   * @param arrLength Length of the data array.
   * @param salt Salt value for decryption.
   */
  static void cypherDecryption(byte *const dataArr,
                               const uint8_t arrLength,
                               const byte salt);

  /**
   * @brief Encrypt data using a provided seed.
   * @param dataArr Pointer to the data array to encrypt.
   * @param dataArrLength Length of the data array.
   * @param seedArr Pointer to the seed array.
   * @param seedArrLength Length of the seed array.
   * @param salt Salt value for encryption.
   */
  static void cypherEncryption(byte *const dataArr,
                               const uint8_t dataArrLength,
                               const byte *const seedArr,
                               const uint8_t seedArrLength,
                               const byte salt);

  /**
   * @brief Decrypt data using a provided seed.
   * @param dataArr Pointer to the data array to decrypt.
   * @param dataArrLength Length of the data array.
   * @param seedArr Pointer to the seed array.
   * @param seedArrLength Length of the seed array.
   * @param salt Salt value for decryption.
   */
  static void cypherDecryption(byte *const dataArr,
                               const uint8_t dataArrLength,
                               const byte *const seedArr,
                               const uint8_t seedArrLength,
                               const byte salt);

  /**
   * @brief Get the version of the keyboard controller.
   * @return Version number as a uint16_t.
   */
  static uint16_t getVersion();

  /**
   * @brief Perform regular maintenance tasks.
   *
   * This should be called in the main program loop.
   */
  void loop();

private:
  FastPin m_keyboardPowerOutput; ///< Pin controlling keyboard power
  State m_state;                 ///< Current state of the keyboard controller
}; // end KeyboardController class

#endif
