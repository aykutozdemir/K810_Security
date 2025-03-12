/**
 * @file SafeInterrupts.cpp
 * @brief Implementation of safe interrupt handling utilities.
 *
 * This file contains the implementation of utilities for safely managing interrupts
 * in Arduino applications.
 *
 * @author Aykut ÖZDEMİR
 * @date 2025
 */

#include "SafeInterrupts.h"

// Initialize static variables
volatile uint8_t SafeInterrupts::interruptState = 0;
volatile uint8_t SafeInterrupts::savedSREG = 0;