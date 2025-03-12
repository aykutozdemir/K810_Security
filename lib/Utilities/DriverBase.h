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

/**
 * @brief Base class for all drivers
 *
 * This class provides common functionality for all drivers, reducing code duplication and flash usage.
 */
class DriverBase
{
public:
    /**
     * @brief Print callback function type
     */
    typedef void (*PrintCallback)(const __FlashStringHelper *, const char *);

    /**
     * @brief Default constructor
     */
    DriverBase() : m_printCallback(nullptr) {}

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

    /**
     * @brief Sets the print callback function
     *
     * @param callback The callback function to use for printing
     */
    void setPrintCallback(const PrintCallback callback)
    {
        m_printCallback = callback;
    }

    /**
     * @brief Gets the current print callback function
     *
     * @return The current print callback function
     */
    PrintCallback getPrintCallback() const
    {
        return m_printCallback;
    }

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

    /**
     * @brief Prints a debug message with a value
     *
     * @param msgProgmem The message to print (stored in flash)
     * @param msg The msg to print
     * @param println Whether to print a newline after the value
     */
    void debugPrint(const __FlashStringHelper *msgProgmem,
                    const char *msg = nullptr,
                    const bool println = true)
    {
        if (m_printCallback)
        {
            if (msgProgmem != nullptr)
            {
                m_printCallback(msgProgmem, nullptr);
            }

            if (msg != nullptr)
            {
                m_printCallback(nullptr, msg);
            }

            if (println)
            {
                m_printCallback(nullptr, nullptr); // For newline
            }
        }
    }

private:
    PrintCallback m_printCallback;
};

#endif // DRIVER_BASE_H