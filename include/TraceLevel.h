#ifndef TRACE_LEVEL_H
#define TRACE_LEVEL_H

/**
 * @brief Enumeration of debug levels in order of severity.
 *
 * These levels determine the verbosity of the logs:
 * - OFF: No debug output
 * - ERROR: Critical errors only
 * - WARN: Warnings and errors
 * - INFO: General information, warnings, and errors
 * - DEBUG: Detailed debug information
 * - TRACE: Most verbose level for detailed tracing
 */
#define TRACE_LEVEL_OFF     0
#define TRACE_LEVEL_ERROR   1
#define TRACE_LEVEL_WARN    2
#define TRACE_LEVEL_INFO    3
#define TRACE_LEVEL_DEBUG   4
#define TRACE_LEVEL_TRACE   5

// Class-specific Debug Settings
#define DEBUG_K810_SECURITY         TRACE_LEVEL_INFO
#define DEBUG_HC05                  TRACE_LEVEL_OFF
#define DEBUG_SOFT_SERIAL           TRACE_LEVEL_OFF
#define DEBUG_EEPROM_CONTROLLER     TRACE_LEVEL_OFF
#define DEBUG_CRC_PACKAGE           TRACE_LEVEL_OFF
#define DEBUG_UTILITIES             TRACE_LEVEL_OFF
#define DEBUG_I2C                   TRACE_LEVEL_OFF
#define DEBUG_KEYBOARD_CONTROLLER   TRACE_LEVEL_OFF

#endif // TRACE_LEVEL_H