#include "SafeInterrupts.h"

// Initialize static variables
volatile uint8_t SafeInterrupts::interruptState = 0;
volatile uint8_t SafeInterrupts::savedSREG = 0;