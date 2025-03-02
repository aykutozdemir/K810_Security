#!/usr/bin/env python
# -*- coding: utf-8 -*-

Import("env")

def generate_disasm(source, target, env):
    import os
    
    # Get the build directory and program name
    build_dir = env.subst("$BUILD_DIR")
    program = os.path.join(build_dir, "firmware.elf")
    
    # Create disassembly command
    cmd = f"avr-objdump -d -S {program} > {build_dir}/firmware.disasm"
    
    # Execute the command
    env.Execute(cmd)
    print(f"Generated disassembly at {build_dir}/firmware.disasm")

def analyze_asm(source, target, env):
    import re
    import os

    # Paths
    BUILD_DIR = env.subst("$BUILD_DIR")
    ASM_FILE = os.path.join(BUILD_DIR, "firmware.disasm")

    # Regex pattern to match function labels
    function_pattern = re.compile(r"^([0-9a-fA-F]+) <(.+)>:")
    # Regex pattern to match instruction lines
    opcode_pattern = re.compile(r"^\s*([0-9a-fA-F]+):\s+([0-9a-fA-F\s]+)\s+")
    # Patterns for push and pop instructions
    push_pattern = re.compile(r"\bpush\b")
    pop_pattern = re.compile(r"\bpop\b")
    # Pattern to match register usage (e.g., r0, r1, ..., r31)
    register_pattern = re.compile(r"\br([0-9]|1[0-9]|2[0-9]|3[0-1])\b")

    # Read ASM file
    with open(ASM_FILE, "r") as f:
        asm_lines = f.readlines()

    isr_functions = {}
    prev_name = None
    current_opcodes = []
    push_count = 0
    pop_count = 0
    used_registers = []

    print("=" * 40)  # Separator before analysis
    for line in asm_lines:
        match = function_pattern.match(line)
        opcode_match = opcode_pattern.match(line)

        if match:
            name = match.group(2)

            # Finalize the previous ISR if it exists
            if prev_name and prev_name.startswith("__vector_"):
                if current_opcodes:
                    start_addr = int(current_opcodes[0], 16)
                    end_addr = int(current_opcodes[-1], 16)
                    size = end_addr - start_addr + 2  # Assuming each instruction is 2 bytes
                    isr_functions[prev_name] = {
                        "push_count": push_count,
                        "pop_count": pop_count,
                        "balance_issue": push_count != pop_count,
                        "size": size,
                        "registers": used_registers  # Keep original order
                    }

            # Start new function tracking
            if name.startswith("__vector_"):
                isr_functions[name] = {"start": None, "end": None, "size": None, "push_count": 0, "pop_count": 0, "registers": []}
                prev_name = name
                current_opcodes = []
                push_count = 0
                pop_count = 0
                used_registers = []

        elif opcode_match and prev_name and prev_name.startswith("__vector_"):
            current_opcodes.append(opcode_match.group(1))  # Collect opcode addresses
            if push_pattern.search(line):
                push_count += 1
            if pop_pattern.search(line):
                pop_count += 1
            # Find all registers used in the line (maintain order)
            for reg in register_pattern.findall(line):
                if reg not in used_registers:
                    used_registers.append(reg)

    # Finalize the last ISR if it exists
    if prev_name and prev_name.startswith("__vector_"):
        if current_opcodes:
            start_addr = int(current_opcodes[0], 16)
            end_addr = int(current_opcodes[-1], 16)
            size = end_addr - start_addr + 2  # Assuming each instruction is 2 bytes
            isr_functions[prev_name] = {
                "push_count": push_count,
                "pop_count": pop_count,
                "balance_issue": push_count != pop_count,
                "size": size,
                "registers": used_registers  # Keep original order
            }

    # Report ISR details
    for isr, details in isr_functions.items():
        print(f"ISR {isr}: Size = {details['size']} bytes")
        # Format registers back to rX format for display (no sorting applied)
        formatted_registers = [f"r{reg}" for reg in details['registers']]
        print(f"  Registers used: {', '.join(formatted_registers)}")
        if details.get("balance_issue"):
            print(f"  Balance issue: {details['push_count']} pushes, {details['pop_count']} pops")
    print("=" * 40)  # Separator after analysis

# Add custom target that can be called with "pio run -t disasm"
env.AddCustomTarget(
    name="disasm",
    dependencies=["$BUILD_DIR/firmware.elf"],
    actions=[generate_disasm],
    title="Generate Disassembly",
    description="Generate disassembly file from ELF"
)

# Add post-action to first generate disassembly, then analyze it
env.AddPostAction("$BUILD_DIR/firmware.elf", [generate_disasm, analyze_asm])
