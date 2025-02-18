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
    static volatile uint8_t interruptState; // Use single byte with bit fields
    static constexpr uint8_t DEPTH_MASK = 0x7F; // Lower 7 bits for depth
    static constexpr uint8_t STATE_MASK = 0x80; // Top bit for interrupt state

public:
    // Disable global interrupts safely
    static inline void disable()
    {
        uint8_t depth = interruptState & DEPTH_MASK;
        if (depth == 0)
        {
            asm volatile("cli"); // Directly disable interrupts
            interruptState |= STATE_MASK; // Mark interrupts as disabled
        }
        if (depth < DEPTH_MASK)
        {
            interruptState = (interruptState & STATE_MASK) | (depth + 1);
        }
    }

    // Enable global interrupts safely
    static inline void enable()
    {
        uint8_t depth = interruptState & DEPTH_MASK;
        if (depth > 0)
        {
            depth--;
            interruptState = (interruptState & STATE_MASK) | depth;
            if (depth == 0 && (interruptState & STATE_MASK))
            {
                asm volatile("sei"); // Only re-enable when all disable calls are cleared
                interruptState &= DEPTH_MASK; // Clear disabled state
            }
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