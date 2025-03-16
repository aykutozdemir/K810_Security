// Project headers
#include "EEPROMController.h"
#include <EEPROM.h>
#include "Utilities.h"

// Arduino core
#include <Arduino.h>
#include <USBAPI.h>

// Constants
constexpr uint8_t EXT_EEPROM_I2C_ADDRESS = 0x50 >> 1;
constexpr uint8_t EXT_EEPROM_PAGE_SIZE = 32;
constexpr uint16_t EXT_EEPROM_TOTAL_SIZE = 8192;
constexpr uint8_t INT_EEPROM_PAGE_SIZE = 32;

EEPROMController::EEPROMController(I2C &i2c)
    : p_i2c(&i2c), m_state(IDLE), m_currentCounter(0)
{
} // end EEPROMController

EEPROMController::State EEPROMController::state() const
{
  return m_state;
} // end state

void EEPROMController::format()
{
  if (m_state == IDLE)
  {
    m_state = FORMATTING_INTERNAL; //TODO: Change to external
    m_currentCounter = 0;
  } // end if
} // end format

void EEPROMController::loop()
{
  switch (m_state)
  {
  case IDLE:
    break;

  case FORMATTING_EXTERNAL:
    if (!checkWriteComplete())
    {
      break;
    }

    if (m_currentCounter >= (EXT_EEPROM_TOTAL_SIZE / EXT_EEPROM_PAGE_SIZE))
    {
      m_state = FORMATTING_INTERNAL;
      m_currentCounter = 0;
      Serial.println(F("Ext eeprom frmt done"));
      break;
    }

    formatExternalPage();
    break;

  case FORMATTING_INTERNAL:
    if (m_currentCounter >= EEPROM.length())
    {
      m_state = IDLE;
      m_currentCounter = 0;
      Serial.println(F("Int eeprom frmt done"));
      break;
    }

    formatInternalPages();
    break;
  } // end switch
} // end loop

bool EEPROMController::checkWriteComplete() const
{
  const uint8_t result = p_i2c->write(EXT_EEPROM_I2C_ADDRESS);

  return result == 0;
}

void EEPROMController::formatExternalPage()
{
  const uint16_t startAddress = m_currentCounter * EXT_EEPROM_PAGE_SIZE;
  const uint8_t pageData[EXT_EEPROM_PAGE_SIZE] = {0x00};

  p_i2c->write16(EXT_EEPROM_I2C_ADDRESS, startAddress, pageData, EXT_EEPROM_PAGE_SIZE);

  Serial.print(F("Ext eeprom pg: "));
  Serial.print(m_currentCounter, HEX);
  Serial.println();

  ++m_currentCounter;
}

void EEPROMController::formatInternalPages()
{
  for (int i = 0; (i < INT_EEPROM_PAGE_SIZE) && (m_currentCounter < EEPROM.length()); ++i)
  {
    EEPROM.update(m_currentCounter, 0x00);
    ++m_currentCounter;
  }

  Serial.print(F("Int eeprom cnt: "));
  Serial.print(m_currentCounter - 1, HEX);
  Serial.println();
}