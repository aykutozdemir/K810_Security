#include "SafeInterrupts.h"

// Initialize static variable
volatile uint8_t SafeInterrupts::interruptDepth = 0;