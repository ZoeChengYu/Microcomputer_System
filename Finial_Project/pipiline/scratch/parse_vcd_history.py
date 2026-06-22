import re
import sys

def parse_vcd_history(filepath):
    # Mapping of register bits to their VCD symbols
    r0_syms = ["a&", "b&", "c&", "d&", "e&", "f&", "g&", "h&"] # MSB to LSB
    r1_syms = ["U&", "V&", "W&", "X&", "Y&", "Z&", "[&", "\\&"] # MSB to LSB
    r2_syms = ["C&", "D&", "E&", "F&", "G&", "H&", "I&", "J&"] # MSB to LSB
    r3_syms = ["i&", "j&", "k&", "l&", "m&", "n&", "o&", "p&"] # MSB to LSB
    
    # We want to track the current state of each symbol
    state = {}
    for sym in r0_syms + r1_syms + r2_syms + r3_syms:
        state[sym] = '0'
        
    def get_reg_val(syms):
        bin_str = "".join(state[s] for s in syms)
        try:
            val = int(bin_str, 2)
            return val
        except ValueError:
            return None

    last_regs = (0, 0, 0, 0)
    current_time = "0"
    
    print(f"{'Time':<10} | {'R0':<8} | {'R1':<8} | {'R2':<8} | {'R3':<8}")
    print("-" * 50)
    print(f"{current_time:<10} | {last_regs[0]:<8} | {last_regs[1]:<8} | {last_regs[2]:<8} | {last_regs[3]:<8}")

    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            
            # Check for time stamp
            if line.startswith('#'):
                current_time = line[1:]
                continue
                
            # Look for value change
            if (line.startswith('0') or line.startswith('1') or line.startswith('x') or line.startswith('z') or line.startswith('X') or line.startswith('Z')) and len(line) > 1:
                val = line[0]
                sym = line[1:]
                if sym in state:
                    state[sym] = val
                    
                    # Compute new register values
                    r0 = get_reg_val(r0_syms)
                    r1 = get_reg_val(r1_syms)
                    r2 = get_reg_val(r2_syms)
                    r3 = get_reg_val(r3_syms)
                    
                    current_regs = (r0, r1, r2, r3)
                    if current_regs != last_regs:
                        # Print only if valid integers
                        if all(v is not None for v in current_regs):
                            # Convert time to ns (assuming ps scale, e.g., 30000 ps = 30 ns)
                            try:
                                t_ns = float(current_time) / 1000.0
                                time_str = f"{t_ns:.1f} ns"
                            except ValueError:
                                time_str = f"{current_time} ps"
                            print(f"{time_str:<10} | {r0:<8} | {r1:<8} | {r2:<8} | {r3:<8}")
                            last_regs = current_regs

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python parse_vcd_history.py <vcd_file>")
        sys.exit(1)
    parse_vcd_history(sys.argv[1])
