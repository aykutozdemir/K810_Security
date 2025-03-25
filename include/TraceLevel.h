#ifndef TRACE_LEVEL_H
#define TRACE_LEVEL_H

#include "Traceable.h"

// Class-specific Debug Settings
#define DEBUG_K810_SECURITY Traceable::Level::INFO
#define DEBUG_HC05 Traceable::Level::OFF
#define DEBUG_SOFT_SERIAL Traceable::Level::OFF
#define DEBUG_EEPROM_CONTROLLER Traceable::Level::OFF
#define DEBUG_CRC_PACKAGE Traceable::Level::OFF
#define DEBUG_UTILITIES Traceable::Level::OFF
#define DEBUG_I2C Traceable::Level::OFF
#define DEBUG_KEYBOARD_CONTROLLER Traceable::Level::OFF

#endif // TRACE_LEVEL_H