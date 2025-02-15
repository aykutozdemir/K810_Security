#ifndef BUTTONCONTROLLER_H
#define BUTTONCONTROLLER_H

#include <ezButton.h>

class ButtonController final {
public:
  enum State : uint8_t {
    NO_PRESS,
    SHORT_PRESS,
    LONG_PRESS,
    VERY_LONG_PRESS
  };

  explicit ButtonController(const uint8_t buttonPin);

  bool isPressing() const;

  State state() const;

  void loop();

private:
  ezButton m_button;

  unsigned long m_pressedTime;

  State m_state;
};  // end ButtonController class

#endif