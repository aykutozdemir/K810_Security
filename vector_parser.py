#!/usr/bin/env python3

import os
import re
import subprocess
import pandas as pd
import matplotlib.pyplot as plt

# Microcontroller Settings (Modify if needed)
MCU_CLOCK_HZ = 16000000  # ATmega32U4 runs at 16 MHz
CYCLES_PER_INSTRUCTION = 1  # Most AVR instructions take 1 cycle

# Paths
PROJECT_PATH = os.getcwd()  # Assumes script is in the PlatformIO project directory
BUILD_DIR = os.path.join(PROJECT_PATH, ".pio", "build", "promicro16")
ELF_FILE = os.path.join(BUILD_DIR, "firmware.elf")
ASM_FILE = os.path.join(BUILD_DIR, "firmware.asm")

# Ensure PlatformIO build exists
if not os.path.exists(BUILD_DIR):
    print("PlatformIO build directory not found. Please run 'pio run' first. BUILD_DIR: ", BUILD_DIR)
    exit(1)

# Generate Assembly File from ELF
def generate_asm():
    print("Generating ASM file...")
    cmd = f"avr-objdump -d {ELF_FILE} > {ASM_FILE}"
    subprocess.run(cmd, shell=True, check=True)
    print(f"Assembly file saved at: {ASM_FILE}")

# Regex pattern to match any function labels
function_pattern = re.compile(r"^([0-9a-fA-F]+) <(.+)>:")
# Regex pattern to match instruction lines
opcode_pattern = re.compile(r"^\s*([0-9a-fA-F]+):\s+([0-9a-fA-F\s]+)\s+")

# Extract ISR function sizes and execution estimates
def analyze_asm():
    print("Analyzing ISR function sizes and execution times...")

    # Read ASM file
    with open(ASM_FILE, "r") as f:
        asm_lines = f.readlines()

    isr_functions = {}
    prev_addr = None
    prev_name = None
    current_opcodes = []

    for line in asm_lines:
        match = function_pattern.match(line)
        opcode_match = opcode_pattern.match(line)

        if match:
            addr = int(match.group(1), 16)
            name = match.group(2)

            # Check if the current function is an ISR
            if prev_name and prev_name.startswith("__vector_"):
                # Set the end address to the last opcode address
                if current_opcodes:
                    last_opcode_addr = int(current_opcodes[-1], 16)
                    isr_functions[prev_name]["end"] = last_opcode_addr
                    isr_functions[prev_name]["size"] = last_opcode_addr - isr_functions[prev_name]["start"] + 2
                    isr_functions[prev_name]["cycles"] = len(current_opcodes) * CYCLES_PER_INSTRUCTION
                    isr_functions[prev_name]["execution_time_us"] = (
                        isr_functions[prev_name]["cycles"] / MCU_CLOCK_HZ * 1e6
                    )

            # Start new function tracking
            if name.startswith("__vector_"):
                isr_functions[name] = {"start": addr, "end": None, "size": None}
                prev_addr = addr
                prev_name = name
                current_opcodes = []

        elif opcode_match and prev_name and prev_name.startswith("__vector_"):
            current_opcodes.append(opcode_match.group(1))  # Collect opcode addresses

        elif line.strip() == "" and prev_name and prev_name.startswith("__vector_"):
            # If an empty line is encountered, finalize the current function
            if current_opcodes:
                last_opcode_addr = int(current_opcodes[-1], 16)
                isr_functions[prev_name]["end"] = last_opcode_addr
                isr_functions[prev_name]["size"] = last_opcode_addr - isr_functions[prev_name]["start"] + 2
                isr_functions[prev_name]["cycles"] = len(current_opcodes) * CYCLES_PER_INSTRUCTION
                isr_functions[prev_name]["execution_time_us"] = (
                    isr_functions[prev_name]["cycles"] / MCU_CLOCK_HZ * 1e6
                )
            prev_name = None  # Reset to avoid reprocessing

    # Convert to DataFrame for better visualization
    df = pd.DataFrame.from_dict(isr_functions, orient="index")
    df.reset_index(inplace=True)
    df.columns = ["ISR Name", "Start Address", "End Address", "Size (Bytes)", "Cycles", "Execution Time (µs)"]

    # Display results
    print(df)

    # Optionally, plot the execution times
    df.plot(x="ISR Name", y="Execution Time (µs)", kind="bar")
    plt.title("ISR Execution Time")
    plt.ylabel("Execution Time (µs)")
    # plt.show()

    # Summary Report
    total_cycles = df["Cycles"].sum()
    total_execution_time = df["Execution Time (µs)"].sum()
    print("\nSummary Report:")
    print(f"Total ISR Execution Cycles: {total_cycles}")
    print(f"Total Execution Time: {total_execution_time:.2f} µs")

if __name__ == "__main__":
    generate_asm()
    analyze_asm()