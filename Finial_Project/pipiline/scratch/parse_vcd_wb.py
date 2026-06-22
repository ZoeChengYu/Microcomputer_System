import sys

def parse_vcd_wb(filepath):
    # Register symbols
    r0_syms = ["a&", "b&", "c&", "d&", "e&", "f&", "g&", "h&"]
    r1_syms = ["U&", "V&", "W&", "X&", "Y&", "Z&", "[&", "\\&"]
    r2_syms = ["C&", "D&", "E&", "F&", "G&", "H&", "I&", "J&"]
    r3_syms = ["i&", "j&", "k&", "l&", "m&", "n&", "o&", "p&"]
    
    # EXEWB signals
    exewb_res_syms = ["!'", "\"'", "#'", "$'", "%'", "&'", "''", "('"]
    exewb_rs_syms = ["w&", "x&"]
    
    # We track state of these symbols
    state = {}
    all_syms = r0_syms + r1_syms + r2_syms + r3_syms + exewb_res_syms + exewb_rs_syms
    for sym in all_syms:
        state[sym] = '0'
        
    # Write enables
    we_syms = {
        "##": "WE_R3",
        "n\"": "WE_R1",
        "r\"": "WE_R2"
    }
    for sym in we_syms:
        state[sym] = '0'
        
    def get_val(syms):
        bin_str = "".join(state[s] for s in syms)
        try:
            return int(bin_str, 2)
        except ValueError:
            return None

    current_time = "0"
    print(f"{'Time':<10} | {'WB_Rs':<5} | {'WB_Res':<6} | {'WE_R3':<5} | {'WE_R1':<5} | {'WE_R2':<5} | {'R0':<4} | {'R1':<4} | {'R2':<4} | {'R3':<4}")
    print("-" * 80)

    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            if line.startswith('#'):
                current_time = line[1:]
                continue
            if (line.startswith('0') or line.startswith('1') or line.startswith('x') or line.startswith('z') or line.startswith('X') or line.startswith('Z')) and len(line) > 1:
                val = line[0]
                sym = line[1:]
                if sym in state:
                    state[sym] = val
                    
                    # Print status
                    try:
                        t_ns = float(current_time) / 1000.0
                    except ValueError:
                        continue
                        
                    # Let's print whenever a register or WB signal changes
                    r0 = get_val(r0_syms)
                    r1 = get_val(r1_syms)
                    r2 = get_val(r2_syms)
                    r3 = get_val(r3_syms)
                    wb_res = get_val(exewb_res_syms)
                    wb_rs = get_val(exewb_rs_syms)
                    
                    if all(v is not None for v in [r0, r1, r2, r3, wb_res, wb_rs]):
                        we_r3 = state['##']
                        we_r1 = state['n"']
                        we_r2 = state['r"']
                        print(f"{t_ns:7.1f} ns | R{wb_rs:<4} | 0x{wb_res:02X} | {we_r3:<5} | {we_r1:<5} | {we_r2:<5} | {r0:<4} | {r1:<4} | {r2:<4} | {r3:<4}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python parse_vcd_wb.py <vcd_file>")
        sys.exit(1)
    parse_vcd_wb(sys.argv[1])
