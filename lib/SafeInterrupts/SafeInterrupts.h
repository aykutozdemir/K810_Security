/**
 * @file SafeInterrupts.h
 * @brief Safe interrupt handling utilities for Arduino.
 *
 * This file provides utilities for safely enabling, disabling, and managing interrupts
 * in Arduino applications. It includes a scoped interrupt disabler to help prevent
 * issues related to interrupt handling in critical sections of code.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

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

/**
 * @brief Class for safely managing interrupts with nesting support
 *
 * This class provides methods to safely enable and disable interrupts with
 * proper nesting support to prevent issues in nested critical sections.
 */
class SafeInterrupts final
{
private:
    static volatile uint8_t interruptState;     ///< Current interrupt state and nesting depth
    static volatile uint8_t savedSREG;          ///< Saved SREG value when interrupts are disabled
    static constexpr uint8_t DEPTH_MASK = 0x7F; ///< Mask for extracting nesting depth
    static constexpr uint8_t STATE_MASK = 0x80; ///< Mask for extracting interrupt state

public:
    /**
     * @brief Safely disables interrupts with nesting support
     *
     * This method keeps track of the nesting depth and only actually disables
     * interrupts when the depth is 0 (first call). Subsequent calls only
     * increment the nesting counter.
     */
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

    /**
     * @brief Safely enables interrupts with nesting support
     *
     * This method decrements the nesting counter and only actually enables
     * interrupts when the depth reaches 0 (last call).
     */
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

    /**
     * @brief RAII class for automatically managing interrupt state
     *
     * This class disables interrupts in its constructor and enables them
     * in its destructor, providing automatic management of interrupt state
     * based on scope.
     */
    class ScopedDisable final
    {
    private:
        bool alreadyDisabled; ///< Whether interrupts were already disabled when constructed

    public:
        /**
         * @brief Constructor that disables interrupts
         */
        inline ScopedDisable()
        {
            alreadyDisabled = (interruptState & STATE_MASK);
            SafeInterrupts::disable();
        }

        /**
         * @brief Destructor that re-enables interrupts if they weren't already disabled
         */
        inline ~ScopedDisable()
        {
            if (!alreadyDisabled)
            {
                SafeInterrupts::enable();
            }
        }
    };
};

/**
 * @brief Macro to safely disable interrupts with nesting support
 */
#define cli() SafeInterrupts::disable()

/**
 * @brief Macro to safely enable interrupts with nesting support
 */
#define sei() SafeInterrupts::enable()

#endif
