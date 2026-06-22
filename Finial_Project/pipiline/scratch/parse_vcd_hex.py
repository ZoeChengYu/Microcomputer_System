import sys

def segment_to_hex(seg_str):
    # active-low: 0 = segment ON, 1 = segment OFF
    # Segments order: gfedcba (bit 6 = g, bit 0 = a)
    table = {
        "1000000": "0",
        "1111001": "1",
        "0100100": "2",
        "0110000": "3",
        "0011001": "4",
        "0010010": "5",
        "0000010": "6",
        "1111000": "7",
        "0000000": "8",
        "0010000": "9",
        "0001000": "A",
        "0000011": "b",
        "1000110": "C",
        "0100001": "d",
        "0000110": "E",
        "0001110": "F",
        "1111111": " "
    }
    return table.get(seg_str, f"?({seg_str})")

def parse_vcd_hex(filepath):
    # Mapping of HEX segments to VCD symbols (bits 6 to 0)
    hex0_syms = ["!", "\"", "#", "$", "%", "&", "'"]
    hex1_syms = ["(", ")", "*", "+", ",", "-", "."]
    hex2_syms = ["/", "0", "1", "2", "3", "4", "5"]
    hex3_syms = ["6", "7", "8", "9", ":", ";", "<"]
    
    state = {}
    for sym in hex0_syms + hex1_syms + hex2_syms + hex3_syms:
        state[sym] = '1' # active-low default off
        
    def get_hex_val(syms):
        seg_str = "".join(state[s] for s in syms)
        return segment_to_hex(seg_str)

    current_time = "0"
    last_disp = ("", "")
    
    print(f"{'Time':<10} | {'Rs Display (HEX1/0)':<20} | {'Rt Display (HEX3/2)':<20}")
    print("-" * 60)

    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            if line.startswith('#'):
                current_time = line[1:]
                continue
            if (line.startswith('0') or line.startswith('1')) and len(line) > 1:
                val = line[0]
                sym = line[1:]
                if sym in state:
                    state[sym] = val
                    
                    try:
                        t_ns = float(current_time) / 1000.0
                    except ValueError:
                        continue
                        
                    h0 = get_hex_val(hex0_syms)
                    h1 = get_hex_val(hex1_syms)
                    h2 = get_hex_val(hex2_syms)
                    h3 = get_hex_val(hex3_syms)
                    
                    current_disp = (f"{h1}{h0}", f"{h3}{h2}")
                    if current_disp != last_disp:
                        print(f"{t_ns:7.1f} ns | {current_disp[0]:<19} | {current_disp[1]:<19}")
                        last_disp = current_disp

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python parse_vcd_hex.py <vcd_file>")
        sys.exit(1)
    parse_vcd_hex(sys.argv[1])
