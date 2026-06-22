import sys

def parse_vcd_ifid(filepath):
    # IF/ID signals
    op_syms = ["q&", "r&", "s&", "t&"]
    rs_syms = ["}&", "~&"]
    rt_syms = ["u&", "v&"]
    data_syms = ["L'", "M'", "N'", "O'", "P'", "Q'", "R'", "S'"]
    
    # We track state of these symbols
    state = {}
    all_syms = op_syms + rs_syms + rt_syms + data_syms
    for sym in all_syms:
        state[sym] = '0'
        
    def get_val(syms):
        bin_str = "".join(state[s] for s in syms)
        try:
            return int(bin_str, 2)
        except ValueError:
            return None

    current_time = "0"
    print(f"{'Time':<10} | {'Opcode':<6} | {'Rs':<4} | {'Rt':<4} | {'Data (Hex)':<10}")
    print("-" * 50)

    op_names = {
        0: "LOAD",
        1: "MOVE",
        2: "ADD",
        3: "AND",
        4: "SLT",
        5: "SUB-AB",
        6: "NOR",
        8: "DIV",
        9: "SUB-BA",
        15: "NOP"
    }

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
                    
                    try:
                        t_ns = float(current_time) / 1000.0
                    except ValueError:
                        continue
                        
                    op = get_val(op_syms)
                    rs = get_val(rs_syms)
                    rt = get_val(rt_syms)
                    data = get_val(data_syms)
                    
                    if all(v is not None for v in [op, rs, rt, data]):
                        op_name = op_names.get(op, str(op))
                        print(f"{t_ns:7.1f} ns | {op_name:<6} | R{rs:<2} | R{rt:<2} | 0x{data:02X}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python parse_vcd_ifid.py <vcd_file>")
        sys.exit(1)
    parse_vcd_ifid(sys.argv[1])
