import re
import sys

def parse_node_tokens(toks):
    repeat_count = 1
    idx = 0
    brace_depth = 0
    while idx < len(toks):
        tok = toks[idx]
        if tok == '{':
            brace_depth += 1
        elif tok == '}':
            brace_depth -= 1
        elif tok == 'REPEAT' and brace_depth == 0:
            assert toks[idx+1] == '='
            repeat_count = int(toks[idx+2])
            assert toks[idx+3] == ';'
        idx += 1
        
    events = []
    t = 0.0
    idx = 0
    brace_depth = 0
    while idx < len(toks):
        tok = toks[idx]
        if tok == '{':
            brace_depth += 1
            idx += 1
        elif tok == '}':
            brace_depth -= 1
            idx += 1
        elif brace_depth > 0:
            idx += 1
        elif tok == 'LEVEL':
            val = toks[idx+1]
            assert toks[idx+2] == 'FOR'
            dur = float(toks[idx+3])
            assert toks[idx+4] == ';'
            events.append((t, val))
            t += dur
            idx += 5
        elif tok == 'NODE':
            assert toks[idx+1] == '{'
            sub_brace_depth = 1
            sub_toks = []
            sub_idx = idx + 2
            while sub_brace_depth > 0 and sub_idx < len(toks):
                if toks[sub_idx] == '{':
                    sub_brace_depth += 1
                elif toks[sub_idx] == '}':
                    sub_brace_depth -= 1
                if sub_brace_depth > 0:
                    sub_toks.append(toks[sub_idx])
                sub_idx += 1
            
            sub_events, sub_dur = parse_node_tokens(sub_toks)
            for st, sv in sub_events:
                events.append((t + st, sv))
            t += sub_dur
            idx = sub_idx
        else:
            idx += 1
            
    final_events = []
    for r in range(repeat_count):
        for et, ev in events:
            final_events.append((r * t + et, ev))
            
    return final_events, repeat_count * t

def parse_vwf(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    transition_blocks = re.findall(r'TRANSITION_LIST\("([^"]+)"\)\s*\{(.*?)\n\}', content, re.DOTALL)
    
    signals = {}
    for sig_name, block in transition_blocks:
        tokens = re.findall(r'(REPEAT|LEVEL|FOR|NODE|=|\d+\.\d+|\d+|\w+|[{}@;])', block)
        events, _ = parse_node_tokens(tokens)
        events.sort(key=lambda x: x[0])
        signals[sig_name] = events
        
    return signals

def evaluate_signal(events, t):
    current_val = 'X'
    for ev_time, val in events:
        if ev_time <= t:
            current_val = val
        else:
            break
    return current_val

def get_bus_value(signals, bus_name, width, t, binary=False):
    val_str = ""
    for idx in reversed(range(width)):
        sig_name = f"{bus_name}[{idx}]"
        if sig_name in signals:
            val = evaluate_signal(signals[sig_name], t)
        else:
            val = '0'
        val_str += str(val)
    
    if 'X' in val_str:
        return val_str
    
    if binary:
        return val_str
    
    try:
        val_int = int(val_str, 2)
        return f"{val_int:02X}" if width > 4 else f"{val_int:X}"
    except ValueError:
        return val_str

def segment_to_hex(seg_str):
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
        "0000011": "b",
        "1000110": "C",
        "0100001": "d",
        "0000110": "E",
        "0001110": "F",
        "0001000": "A",
        "1111111": " ",
    }
    return table.get(seg_str, f"?({seg_str})")

def analyze_file(filepath):
    print(f"=== Analyzing {filepath} ===")
    signals = parse_vwf(filepath)
    
    key_events = signals.get("KEY[0]", [])
    if not key_events:
        key_events = signals.get("KEY", [])
        
    falling_edges = []
    prev_val = None
    for t, val in key_events:
        if prev_val == '1' and val == '0':
            falling_edges.append(t)
        prev_val = val
        
    print(f"Detected {len(falling_edges)} falling edges of KEY[0] (clock triggers).")
    
    print(f"{'Time':<8} | {'SW[15:0] (Bin)':<18} | {'Opcode':<6} | {'Rs_sel':<6} | {'Rt_sel':<6} | {'Data':<4} | {'HEX5':<4} | {'HEX4':<4} | {'HEX6':<4} | {'HEX1/0':<6} | {'HEX3/2':<6} | {'LEDG':<4}")
    print("-" * 110)
    
    for i, t_edge in enumerate(falling_edges):
        t_in = t_edge - 0.1 if t_edge > 0.1 else 0.0
        t_out = falling_edges[i+1] - 0.1 if i+1 < len(falling_edges) else 999.9
        
        sw_bin = get_bus_value(signals, "SW", 16, t_in, binary=True)
        rt_sel = sw_bin[0:2]
        rs_sel = sw_bin[2:4]
        op = sw_bin[4:8]
        data = f"{int(sw_bin[8:16], 2):02X}"
        
        op_names = {
            "0000": "LOAD",
            "0001": "MOVE",
            "0010": "ADD",
            "0011": "AND",
            "0100": "SLT",
            "0101": "SUB-AB",
            "0110": "NOR",
            "1000": "DIV",
            "1001": "SUB-BA",
            "1111": "NOP"
        }
        op_name = op_names.get(op, op)
        
        hex0_seg = get_bus_value(signals, "HEX0", 7, t_out, binary=True)
        hex1_seg = get_bus_value(signals, "HEX1", 7, t_out, binary=True)
        hex2_seg = get_bus_value(signals, "HEX2", 7, t_out, binary=True)
        hex3_seg = get_bus_value(signals, "HEX3", 7, t_out, binary=True)
        hex4_seg = get_bus_value(signals, "HEX4", 7, t_out, binary=True)
        hex5_seg = get_bus_value(signals, "HEX5", 7, t_out, binary=True)
        hex6_seg = get_bus_value(signals, "HEX6", 7, t_out, binary=True)
        
        hex0 = segment_to_hex(hex0_seg)
        hex1 = segment_to_hex(hex1_seg)
        hex2 = segment_to_hex(hex2_seg)
        hex3 = segment_to_hex(hex3_seg)
        hex4 = segment_to_hex(hex4_seg)
        hex5 = segment_to_hex(hex5_seg)
        hex6 = segment_to_hex(hex6_seg)
        
        ledg0 = evaluate_signal(signals.get("LEDG[0]", []), t_out)
        ledg1 = evaluate_signal(signals.get("LEDG[1]", []), t_out)
        ledg = f"{ledg1}{ledg0}"
        
        print(f"{t_edge:5.1f} ns | {sw_bin[0:2]} {sw_bin[2:4]} {sw_bin[4:8]} {sw_bin[8:16]} | {op_name:<6} | R{int(rs_sel, 2)}    | R{int(rt_sel, 2)}    | {data}   | {hex5:<4} | {hex4:<4} | {hex6:<4} | {hex1}{hex0:<4} | {hex3}{hex2:<4} | {ledg}")

if __name__ == "__main__":
    analyze_file(sys.argv[1])
