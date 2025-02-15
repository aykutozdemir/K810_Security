#ifndef __MemoryUsage_h__
#define __MemoryUsage_h__

#include "Arduino.h"
#include <stdint.h>

/*! \mainpage
SRAM memory
\verbatim
+---------------+------------------+---------------------------------------------+-----------------+
|               |                  |                                             |                 |
|               |                  |                                             |                 |
|    static     |                  |                                             |                 |
|     data      |       heap       |                   free ram                  |      stack      |
|               |                  |                                             |                 |
|               |                  |                                             |                 |
|               |                  |                                             |                 |
+---------------+------------------+---------------------------------------------+-----------------+
       _end or __heap_start     __brkval                                         SP             RAMEND
\endverbatim

Source : http://www.nongnu.org/avr-libc/user-manual/malloc.html
*/

extern uint8_t _end;
extern uint8_t __stack;
extern uint8_t *__brkval;
extern uint8_t *__data_start;
extern uint8_t *__data_end;
extern uint8_t *__heap_start;
extern uint8_t *__heap_end;
extern uint8_t *__bss_start;
extern uint8_t *__bss_end;

class MemoryUsage
{
public:
       static void stackPaint(void);

       static int freeRam(void);

       static int minimumFreeRam(void);

       static void ramDisplay(Print &out);
};

#endif
