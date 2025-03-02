@echo off
REM Compile the firmware using PlatformIO
echo Compiling firmware...
pio run

REM Check if the compilation was successful
IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
    exit /b 1
)

REM Disassemble the compiled firmware to generate the assembly file
echo Generating firmware.asm...
avr-objdump -d .pio\build\promicro16\firmware.elf > firmware.asm

REM Check if the disassembly was successful
IF %ERRORLEVEL% EQU 0 (
    echo firmware.asm generated successfully.
) ELSE (
    echo Failed to generate firmware.asm.
    exit /b 1
)