/**
 * @file DriverBase.h
 * @brief Base class for hardware and peripheral drivers.
 *
 * This file defines the DriverBase class, which provides a common interface and
 * functionality for various hardware and peripheral drivers. It includes methods
 * for initialization, loop processing, and error handling.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */
#ifndef DRIVER_BASE_H
#define DRIVER_BASE_H

#include <Arduino.h>
#include "Utilities.h"
#include "Traceable.h"

/**
 * @brief Base class for all drivers
 *
 * This class provides common functionality for all drivers, reducing code duplication and flash usage.
 */
class DriverBase : public Traceable
{
public:
    /**
     * @brief Default constructor
     */
    DriverBase(const __FlashStringHelper *const functionName) : Traceable(functionName) {}

    /**
     * @brief Destructor
     */
    ~DriverBase() {}

    /**
     * @brief Setup method to be called during initialization
     */
    void setup() {}

    /**
     * @brief Loop method to be called in the main loop
     */
    void loop() {}

protected:
    /**
     * @brief Template class for managing state with change time tracking
     *
     * @tparam T The type of the state enum
     */
    template <typename T>
    class StateManager
    {
    public:
        /**
         * @brief Constructor
         *
         * @param initialState The initial state
         */
        explicit StateManager(const T initialState) : m_state(initialState), m_lastChangeTime(millis()) {}

        /**
         * @brief Get the current state
         *
         * @return The current state
         */
        T state() const
        {
            return m_state;
        }

        /**
         * @brief Change the state using Utilities::changeState
         *
         * @param newState The new state
         * @return true if the state was changed, false otherwise
         */
        bool setState(const T newState)
        {
            if (Utilities::changeState(m_state, newState))
            {
                m_lastChangeTime = millis();
                return true;
            }
            return false;
        }

        /**
         * @brief Get the time elapsed since the last state change
         *
         * @return Time in milliseconds since the last state change
         */
        unsigned long timeInState() const
        {
            return millis() - m_lastChangeTime;
        }

        /**
         * @brief Check if the state has been active for at least the specified time
         *
         * @param timeMs Time in milliseconds
         * @return true if the state has been active for at least timeMs
         */
        bool isStateTimeElapsed(const unsigned long timeMs) const
        {
            return timeInState() >= timeMs;
        }

    private:
        T m_state;                      // Current state
        unsigned long m_lastChangeTime; // Time of last state change
    };
};

#endif // DRIVER_BASE_H