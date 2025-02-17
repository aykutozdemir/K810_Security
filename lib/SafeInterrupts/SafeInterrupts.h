#ifndef SAFEINTERRUPTS_H
#define SAFEINTERRUPTS_H

#include <avr/interrupt.h>

#ifdef cli
#undef cli
#endif

#ifdef sei
#undef sei
#endif

class SafeInterrupts final
{
private:
    static volatile uint8_t interruptDepth; // Track depth of nested disable calls

public:
    // Disable global interrupts safely
    static inline void disable()
    {
        if (interruptDepth == 0)
        {
            asm volatile("cli"); // Directly disable interrupts
        }
        interruptDepth++;
    }

    // Enable global interrupts safely
    static inline void enable()
    {
        if (interruptDepth > 0)
        {
            interruptDepth--; // Decrease depth counter
        }
        if (interruptDepth == 0)
        {
            asm volatile("sei"); // Only re-enable when all disable calls are cleared
        }
    }

    // Scoped interrupt guard (disables on enter, restores on exit)
    class ScopedDisable final
    {
    public:
        inline ScopedDisable() { SafeInterrupts::disable(); }
        inline ~ScopedDisable() { SafeInterrupts::enable(); }
    };
};

// Override cli() and sei() globally
#define cli() SafeInterrupts::disable()
#define sei() SafeInterrupts::enable()

#endif