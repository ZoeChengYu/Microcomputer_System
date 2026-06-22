import re
import sys

def parse_vcd(filepath):
    # Mapping of register bits to their VCD symbols
    r0_syms = ["a&", "b&", "c&", "d&", "e&", "f&", "g&", "h&"] # MSB to LSB
    r1_syms = ["U&", "V&", "W&", "X&", "Y&", "Z&", "[&", "\\&"] # MSB to LSB. Note backslash escaping.
    r2_syms = ["C&", "D&", "E&", "F&", "G&", "H&", "I&", "J&"] # MSB to LSB
    r3_syms = ["i&", "j&", "k&", "l&", "m&", "n&", "o&", "p&"] # MSB to LSB
    
    # We want to track the current state of each symbol
    # Initialize all to '0'
    state = {}
    for sym in r0_syms + r1_syms + r2_syms + r3_syms:
        state[sym] = '0'
        
    with open(filepath, 'r') as f:
        # VCD line by line
        for line in f:
            line = line.strip()
            if not line:
                continue
            
            # Look for value change
            # Format is typically:
            # 0! (binary change: value followed by symbol, like 0C&)
            # or b00000000 ! (bus change)
            # In our case, the wires are 1-bit, so it's <val><symbol>, e.g., 0a& or 1a& or Xa&
            if (line.startswith('0') or line.startswith('1') or line.startswith('x') or line.startswith('z') or line.startswith('X') or line.startswith('Z')) and len(line) > 1:
                val = line[0]
                sym = line[1:]
                if sym in state:
                    state[sym] = val
                    
    # Reconstruct the registers
    def get_reg_val(syms):
        bin_str = "".join(state[s] for s in syms)
        try:
            val = int(bin_str, 2)
            return f"0x{val:02X} ({val})"
        except ValueError:
            return f"0x?? ({bin_str})"
            
    print(f"R0 = {get_reg_val(r0_syms)}")
    print(f"R1 = {get_reg_val(r1_syms)}")
    print(f"R2 = {get_reg_val(r2_syms)}")
    print(f"R3 = {get_reg_val(r3_syms)}")

if __name__ == "__main__":
    parse_vcd(sys.argv[1])
