# K810_Security

## PlatformIO Build Instructions

### Prerequisites
- Python and pip installed
- PlatformIO installed (`pip install platformio`)

### Compilation
To compile the project, use one of these commands:
```bash
pio run
# or
platformio run
```

### Additional Useful Commands
- `pio run -t upload` - Compile and upload to the board
- `pio run -t clean` - Clean the build directory
- `pio run -t program` - Compile and program the board
- `pio device monitor` - Open the serial monitor

The compiled firmware will be placed in the `.pio/build/promicro16/` directory.

## Build Scripts

The project includes several Python scripts that enhance the build process:

### generate_version.py
Automatically increments and manages build version numbers. The version is stored in `version.txt` and is included in the firmware as a build flag.

### asembly_analyzer.py
Analyzes the assembly code of the compiled firmware, providing:
- Disassembly of the firmware
- Analysis of Interrupt Service Routines (ISRs)
- Register usage statistics
- Stack push/pop balance checking

Usage:
```bash
pio run -t disasm  # Generate and analyze disassembly
```

### map_analyzer.py
Analyzes the memory map of the compiled firmware, showing:
- Symbol sizes and addresses
- Memory usage by function
- Type of memory (code, data, BSS)

Usage:
```bash
python map_analyzer.py [--file path/to/firmware.elf] [--filter tTbBdD]
```

### custom_build.py
Applies custom build flags and optimizations:
- Disables unused parameter warnings
- Applies C++ specific optimizations
- Configures build environment for Arduino framework
