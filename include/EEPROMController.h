/**
 * @file EEPROMController.h
 * @brief Controller for EEPROM operations using I2C.
 *
 * This file defines the EEPROMController class, which provides functionality for
 * interacting with EEPROM memory via I2C, including formatting operations.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef EEPROMCONTROLLER_H
#define EEPROMCONTROLLER_H

#include "I2C.h"

/**
 * @brief Class for managing operations on EEPROM memory.
 *
 * This class provides functionality to interact with EEPROM memory via I2C,
 * including formatting operations for both internal and external memory areas.
 */
class EEPROMController final
{
public:
  /**
   * @brief Enumeration of possible controller states.
   */
  enum State : uint_fast8_t
  {
    IDLE,                ///< Controller is idle, no operation in progress
    FORMATTING_EXTERNAL, ///< Currently formatting external EEPROM memory
    FORMATTING_INTERNAL  ///< Currently formatting internal EEPROM memory
  };

  /**
   * @brief Constructor that initializes the EEPROM controller.
   * @param i2c Reference to the I2C interface used for communication.
   */
  explicit EEPROMController(I2C &i2c);

  /**
   * @brief Get the current state of the controller.
   * @return Current state (IDLE, FORMATTING_EXTERNAL, or FORMATTING_INTERNAL).
   */
  State state() const;

  /**
   * @brief Initiate formatting of the EEPROM memory.
   */
  void format();

  /**
   * @brief Perform ongoing EEPROM operations.
   *
   * This should be called regularly in the main program loop to continue
   * any in-progress operations such as formatting.
   */
  void loop();

private:
  /**
   * @brief Check if a write operation to EEPROM has completed.
   * @return True if write is complete, false if still in progress.
   */
  bool checkWriteComplete() const;

  /**
   * @brief Format the internal EEPROM pages.
   */
  void formatInternalPages();

  /**
   * @brief Format the external EEPROM page.
   */
  void formatExternalPage();

  I2C *p_i2c;                ///< Pointer to the I2C interface
  State m_state;             ///< Current state of the controller
  uint16_t m_currentCounter; ///< Counter used during formatting operations
}; // end EEPROMController class

#endif