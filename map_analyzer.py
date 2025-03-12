import subprocess
import re
import argparse

# Mapping of single-letter type codes to full names
type_names = {
    't': 'Local Text (Code)',
    'T': 'Global Text (Code)',
    'b': 'Local BSS (Uninitialized Data)',
    'B': 'Global BSS (Uninitialized Data)',
    'd': 'Local Data (Initialized Data)',
    'D': 'Global Data (Initialized Data)',
}

def run_avr_nm(file_path):
    # Run the avr-nm command and capture the output
    result = subprocess.run(['avr-nm', '-S', file_path], capture_output=True, text=True)
    return result.stdout

def parse_nm_output(nm_output):
    # Regular expression to match the nm output lines
    pattern = re.compile(r'([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+([tTbBdD])\s+(.+)')
    symbols = []

    for line in nm_output.splitlines():
        match = pattern.match(line)
        if match:
            address_hex, size_hex, symbol_type, name = match.groups()
            address_dec = int(address_hex, 16)
            size_dec = int(size_hex, 16)
            type_name = type_names.get(symbol_type, 'Unknown')
            symbols.append((address_dec, size_dec, type_name, name))

    return symbols

def format_symbols(symbols, filter_types):
    # Filter symbols by type
    filtered_symbols = [s for s in symbols if s[2] in filter_types]
    
    # Sort symbols by size in descending order
    filtered_symbols.sort(key=lambda x: x[1], reverse=True)
    
    # Format the symbols into a readable output
    formatted_output = []
    for address, size, type_name, name in filtered_symbols:
        formatted_output.append(f"Address: {address}, Size: {size}, Type: {type_name}, Name: {name}")
    return "\n".join(formatted_output)

def main():
    parser = argparse.ArgumentParser(description="Analyze ELF file symbols.")
    parser.add_argument('--file', type=str, default='./.pio/build/promicro16/firmware.elf', help='Path to the ELF file')
    parser.add_argument('--filter', type=str, default='tTbBdD', help='Filter by symbol types (e.g., tTbBdD for all)')
    args = parser.parse_args()

    nm_output = run_avr_nm(args.file)
    symbols = parse_nm_output(nm_output)
    filter_types = [type_names.get(c, 'Unknown') for c in args.filter]
    formatted_output = format_symbols(symbols, filter_types)
    print(formatted_output)

if __name__ == "__main__":
    main()