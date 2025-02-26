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

# Add custom target that can be called with "pio run -t disasm"
env.AddCustomTarget(
    name="disasm",
    dependencies=["$BUILD_DIR/firmware.elf"],
    actions=[generate_disasm],
    title="Generate Disassembly",
    description="Generate disassembly file from ELF"
)

# Also generate disassembly after each build
env.AddPostAction("$BUILD_DIR/firmware.elf", generate_disasm) 