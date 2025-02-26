#ifndef SAFEINTERRUPTS_H
#define SAFEINTERRUPTS_H

#include <avr/interrupt.h>
#include <util/atomic.h>

#ifdef cli
#undef cli
#endif

#ifdef sei
#undef sei
#endif

class SafeInterrupts final
{
private:
    static volatile uint8_t interruptState;
    static volatile uint8_t savedSREG;
    static constexpr uint8_t DEPTH_MASK = 0x7F;
    static constexpr uint8_t STATE_MASK = 0x80;

public:
    static inline void disable()
    {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE)
        {
            uint8_t depth = interruptState & DEPTH_MASK;
            if (depth == 0)
            {
                savedSREG = SREG;
                asm volatile("cli");
                interruptState |= STATE_MASK;
            }
            if (depth < DEPTH_MASK)
            {
                interruptState = (interruptState & STATE_MASK) | (depth + 1);
            }
        }
    }

    static inline void enable()
    {
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE)
        {
            uint8_t depth = interruptState & DEPTH_MASK;
            if (depth > 0)
            {
                depth--;
                interruptState = (interruptState & STATE_MASK) | depth;
                if (depth == 0 && (interruptState & STATE_MASK))
                {
                    SREG = savedSREG;
                    interruptState &= DEPTH_MASK;
                }
            }
        }
    }

    class ScopedDisable final
    {
    private:
        bool alreadyDisabled;

    public:
        inline ScopedDisable()
        {
            alreadyDisabled = (interruptState & STATE_MASK);
            SafeInterrupts::disable();
        }

        inline ~ScopedDisable()
        {
            if (!alreadyDisabled)
            {
                SafeInterrupts::enable();
            }
        }
    };
};

#define cli() SafeInterrupts::disable()
#define sei() SafeInterrupts::enable()

#endif
