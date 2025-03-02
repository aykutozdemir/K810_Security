#!/bin/bash

# Compile the firmware using PlatformIO
echo "Compiling firmware..."
pio run

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Disassemble the compiled firmware to generate the assembly file
echo "Generating firmware.asm..."
avr-objdump -d .pio/build/promicro16/firmware.elf > firmware.asm

# Check if the disassembly was successful
if [ $? -eq 0 ]; then
    echo "firmware.asm generated successfully."
else
    echo "Failed to generate firmware.asm."
    exit 1
fi