#ifndef BUTTONCONTROLLER_H
#define BUTTONCONTROLLER_H

// Third-party libraries
#include <ezButton.h>

class ButtonController final
{
public:
  enum State : uint_fast8_t
  {
    NO_PRESS,
    SHORT_PRESS,
    LONG_PRESS,
    VERY_LONG_PRESS
  };

  explicit ButtonController(const uint8_t buttonPin);

  bool isPressing() const;

  bool isPressingRaw() const;

  State state() const;

  void loop();

private:
  ezButton m_button;

  uint16_t m_pressedTime;

  State m_state;
}; // end ButtonController class

#endif