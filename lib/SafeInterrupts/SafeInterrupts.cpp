#include "SafeInterrupts.h"

// Initialize static variable
volatile uint8_t SafeInterrupts::interruptState = 0;