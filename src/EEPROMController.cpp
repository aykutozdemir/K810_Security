// Arduino core
#include <Arduino.h>
#include <USBAPI.h>

// Project headers
#include "EEPROMController.h"
#include <EEPROM.h>

// Constants
constexpr uint8_t EXT_EEPROM_I2C_ADDRESS = 0x50;
constexpr uint8_t EXT_EEPROM_PAGE_SIZE = 32;
constexpr uint16_t EXT_EEPROM_TOTAL_SIZE = 8192;
constexpr uint8_t INT_EEPROM_PAGE_SIZE = 32;

EEPROMController::EEPROMController(TwoWire &wire)
    : p_wire(&wire), m_state(IDLE), m_currentCounter(0)
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
    m_state = FORMATTING_EXTERNAL;
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
  p_wire->beginTransmission(EXT_EEPROM_I2C_ADDRESS);

  const uint8_t result = p_wire->endTransmission();

  return result == 0;
}

void EEPROMController::formatExternalPage()
{
  const uint16_t startAddress = m_currentCounter * EXT_EEPROM_PAGE_SIZE;

  p_wire->beginTransmission(EXT_EEPROM_I2C_ADDRESS);
  p_wire->write((startAddress >> 8) & 0xFF);
  p_wire->write(startAddress & 0xFF);
  for (uint8_t i = 0; i < EXT_EEPROM_PAGE_SIZE; i++)
  {
    p_wire->write(0x00);
  }
  p_wire->endTransmission();

  Serial.print(F("Ext eeprom pg: "));
  Serial.println(m_currentCounter);

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
  Serial.println(m_currentCounter - 1);
}