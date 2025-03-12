# Utilities Library

This library provides common utility functions and base classes to reduce code duplication and flash usage across the project.

## Features

### Utility Functions

The `Utilities` namespace provides common functions for:

- Secure memory operations (cleaning, constant-time comparison)
- Serial output formatting (printing OK/error messages, hex values)
- Hex string conversion
- Safe interrupt handling

### Controller Base Class

The `ControllerBase` class provides a common foundation for all controller classes with:

- Standard lifecycle methods (setup, loop)
- State management helpers
- Debug output utilities

## Usage

### Utility Functions

```cpp
#include "Utilities.h"

// Clean memory securely
byte sensitiveData[32];
Utilities::secureClean(sensitiveData, sizeof(sensitiveData));

// Compare data in constant time (prevents timing attacks)
bool isEqual = Utilities::constantTimeCompare(data1, data2, 32);

// Print formatted output
Utilities::printOK(serialCommands);
Utilities::printError(serialCommands, F("Invalid input"));
Utilities::printHexArray(serialCommands, byteArray, 16, ':');

// Convert hex string to bytes
byte result[8];
bool success = Utilities::hexStringToBytes("0123456789ABCDEF", result, 8);
```

### Controller Base Class

```cpp
#include "ControllerBase.h"

class MyController : public ControllerBase {
public:
    enum State {
        IDLE,
        RUNNING,
        ERROR
    };

    MyController() : m_state(IDLE) {}

    virtual void setup() override {
        // Initialization code
    }

    virtual void loop() override {
        // Main processing code
    }

    void setState(State newState) {
        if (changeState(m_state, newState)) {
            // State changed, perform actions
            debugPrint(F("State changed to:"), (int)newState);
        }
    }

private:
    State m_state;
};
```

## Benefits

- Reduces code duplication
- Decreases flash memory usage
- Improves code maintainability
- Centralizes common functionality
- Provides consistent interfaces
