#ifndef EEPROMCONTROLLER_H
#define EEPROMCONTROLLER_H

#include <Wire.h>

class EEPROMController final
{
public:
  enum State : uint8_t
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
  bool checkWriteComplete();

  void formatInternalPages();

  void formatExternalPage();

  TwoWire &m_wire;

  State m_state;

  uint16_t m_currentCounter;
}; // end KeyboardController class

#endif