/**
 * @file main.cpp
 * @brief Main entry point for the K810 Security device
 *
 * This file contains the main entry point for the K810 Security device.
 * It creates an instance of the K810Security class and runs the application.
 */

#include "K810Security.h"

// Create the main application instance
K810Security k810Security;

/**
 * @brief Arduino setup function
 * Initializes the application
 */
void setup()
{
    k810Security.setup();
}

/**
 * @brief Arduino main loop function
 * Runs the main application loop
 */
void loop()
{
    k810Security.loop();
}