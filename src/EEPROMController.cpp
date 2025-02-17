#include "USBAPI.h"
#include "EEPROMController.h"
#include <Arduino.h>
#include <EEPROM.h>

// Use constexpr instead of #define for type safety
constexpr uint8_t EXT_EEPROM_I2C_ADDRESS = 0x50;
constexpr uint8_t EXT_EEPROM_PAGE_SIZE = 32;
constexpr uint16_t EXT_EEPROM_TOTAL_SIZE = 8192;
constexpr uint8_t INT_EEPROM_PAGE_SIZE = 32;

EEPROMController::EEPROMController(TwoWire &wire)
    : m_wire(wire), m_state(IDLE), m_currentCounter(0)
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
      Serial.println(F("External EEPROM formatting completed."));
      break;
    }

    formatExternalPage();
    break;

  case FORMATTING_INTERNAL:
    if (m_currentCounter >= EEPROM.length())
    {
      m_state = IDLE;
      m_currentCounter = 0;
      Serial.println(F("Internal EEPROM formatting completed."));
      break;
    }

    formatInternalPages();
    break;
  } // end switch
} // end loop

bool EEPROMController::checkWriteComplete()
{
  m_wire.beginTransmission(EXT_EEPROM_I2C_ADDRESS);

  const uint8_t result = m_wire.endTransmission();

  return result == 0;
}

void EEPROMController::formatExternalPage()
{
  const uint16_t startAddress = m_currentCounter * EXT_EEPROM_PAGE_SIZE;

  m_wire.beginTransmission(EXT_EEPROM_I2C_ADDRESS);
  m_wire.write((startAddress >> 8) & 0xFF);
  m_wire.write(startAddress & 0xFF);
  for (uint8_t i = 0; i < EXT_EEPROM_PAGE_SIZE; i++)
  {
    m_wire.write(0x00);
  } // end for
  m_wire.endTransmission();

  Serial.print(F("External EEPROM page formatted, page: "));
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

  Serial.print(F("Internal EEPROM formatted, counter: "));
  Serial.println(m_currentCounter - 1);
}