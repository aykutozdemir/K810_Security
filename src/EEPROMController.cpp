// Project headers
#include "EEPROMController.h"
#include <EEPROM.h>
#include "Utilities.h"
#include "TraceLevel.h"

// Arduino core
#include <Arduino.h>
#include <USBAPI.h>

#undef CLASS_TRACE_LEVEL
#define CLASS_TRACE_LEVEL DEBUG_EEPROM_CONTROLLER

// Constants
constexpr uint8_t EXT_EEPROM_I2C_ADDRESS = 0x50 >> 1;
constexpr uint8_t EXT_EEPROM_PAGE_SIZE = 32;
constexpr uint16_t EXT_EEPROM_TOTAL_SIZE = 8192;
constexpr uint8_t INT_EEPROM_PAGE_SIZE = 32;

EEPROMController::EEPROMController(I2C &i2c)
    : Traceable(F("EEPROMController")), p_i2c(&i2c), m_state(IDLE), m_currentCounter(0)
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
    m_state = FORMATTING_INTERNAL; // TODO: Change to external
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
      TRACE_INFO()
          << F("External eeprom formatting done")
          << endl;
      break;
    }

    formatExternalPage();
    break;

  case FORMATTING_INTERNAL:
    if (m_currentCounter >= EEPROM.length())
    {
      m_state = IDLE;
      m_currentCounter = 0;
      TRACE_INFO()
          << F("Internal eeprom formatting done")
          << endl;
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

  TRACE_DEBUG()
      << F("External eeprom page: ")
      << m_currentCounter
      << endl;

  ++m_currentCounter;
}

void EEPROMController::formatInternalPages()
{
  for (int i = 0; (i < INT_EEPROM_PAGE_SIZE) && (m_currentCounter < EEPROM.length()); ++i)
  {
    EEPROM.update(m_currentCounter, 0x00);
    ++m_currentCounter;
  }

  TRACE_DEBUG()
      << F("Internal eeprom counter: ")
      << m_currentCounter
      << endl;
}