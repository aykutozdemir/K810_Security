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

    # Standard AVR vector names lookup table
    VECTOR_NAMES = {
        "0": "RESET_vect",
        "1": "INT0_vect",
        "2": "INT1_vect",
        "3": "INT2_vect",
        "4": "INT3_vect",
        "7": "INT6_vect",
        "9": "PCINT0_vect",
        "10": "USB_GEN_vect",
        "11": "USB_COM_vect",
        "12": "WDT_vect",
        "16": "TIMER1_CAPT_vect",
        "17": "TIMER1_COMPA_vect",
        "18": "TIMER1_COMPB_vect",
        "19": "TIMER1_COMPC_vect",
        "20": "TIMER1_OVF_vect",
        "21": "TIMER0_COMPA_vect",
        "22": "TIMER0_COMPB_vect",
        "23": "TIMER0_OVF_vect",
        "24": "SPI_STC_vect",
        "25": "USART1_RX_vect",
        "26": "USART1_UDRE_vect",
        "27": "USART1_TX_vect",
        "28": "ANALOG_COMP_vect",
        "29": "ADC_vect",
        "30": "EE_READY_vect",
        "31": "TIMER3_CAPT_vect",
        "32": "TIMER3_COMPA_vect",
        "33": "TIMER3_COMPB_vect",
        "34": "TIMER3_COMPC_vect",
        "35": "TIMER3_OVF_vect",
        "36": "TWI_vect",
        "37": "SPM_READY_vect",
        "38": "TIMER4_COMPA_vect",
        "39": "TIMER4_COMPB_vect",
        "40": "TIMER4_COMPD_vect",
        "41": "TIMER4_OVF_vect",
        "42": "TIMER4_FPF_vect"
    }

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
    start_addr = None

    print("=" * 40)  # Separator before analysis
    for line in asm_lines:
        match = function_pattern.match(line)
        opcode_match = opcode_pattern.match(line)

        if match:
            name = match.group(2)
            addr = int(match.group(1), 16)

            # Finalize the previous ISR if it exists
            if prev_name and prev_name.startswith("__vector_"):
                if current_opcodes:
                    end_addr = int(current_opcodes[-1], 16)
                    size = end_addr - start_addr + 2  # Add 2 for the last instruction
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
                start_addr = addr

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
        elif line.strip() == "" and prev_name and prev_name.startswith("__vector_"):
            # End of function at empty line
            if current_opcodes:
                end_addr = int(current_opcodes[-1], 16)
                size = end_addr - start_addr + 2  # Add 2 for the last instruction
                isr_functions[prev_name] = {
                    "push_count": push_count,
                    "pop_count": pop_count,
                    "balance_issue": push_count != pop_count,
                    "size": size,
                    "registers": used_registers  # Keep original order
                }
                prev_name = None
                current_opcodes = []
                push_count = 0
                pop_count = 0
                used_registers = []
                start_addr = None

    # Finalize the last ISR if it exists
    if prev_name and prev_name.startswith("__vector_"):
        if current_opcodes:
            end_addr = int(current_opcodes[-1], 16)
            size = end_addr - start_addr + 2  # Add 2 for the last instruction
            isr_functions[prev_name] = {
                "push_count": push_count,
                "pop_count": pop_count,
                "balance_issue": push_count != pop_count,
                "size": size,
                "registers": used_registers  # Keep original order
            }

    # Report ISR details
    for isr, details in isr_functions.items():
        # Extract vector number from ISR name (e.g., __vector_17 -> 17)
        vector_num = isr.split('_')[-1]
        # Get the standard vector name from our lookup table
        vector_name = VECTOR_NAMES.get(vector_num, f"VECTOR_{vector_num}_vect")
        print(f"ISR __vector_{vector_num}: {vector_name}: Size = {details['size']} bytes")
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
