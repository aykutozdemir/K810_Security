#ifndef EEPROMCONTROLLER_H
#define EEPROMCONTROLLER_H

// Arduino core
#include <Wire.h>

class EEPROMController final
{
public:
  enum State : uint_fast8_t
  {
    IDLE,
    FORMATTING_EXTERNAL,
    FORMATTING_INTERNAL
  };

  explicit EEPROMController(TwoWire &wire);

  State state() const;

  void format();

  void loop();

private:
  bool checkWriteComplete() const;

  void formatInternalPages();

  void formatExternalPage();

  TwoWire *p_wire;

  State m_state;

  uint16_t m_currentCounter;
}; // end KeyboardController class

#endif