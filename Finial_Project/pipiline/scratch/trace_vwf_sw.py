import re

def trace_vwf_sw(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
        
    transition_blocks = re.findall(r'TRANSITION_LIST\("([^"]+)"\)\s*\{(.*?)\n\}', content, re.DOTALL)
    
    signals = {}
    for sig_name, block in transition_blocks:
        if 'SW[' in sig_name:
            # Find the value at t=0
            # Typically looks like:
            # LEVEL 0 FOR 1000.0;
            # or LEVEL 1 FOR 1000.0;
            match = re.search(r'LEVEL (\d|X|Z) FOR ([\d.]+)', block)
            if match:
                val = match.group(1)
                signals[sig_name] = val
                
    # Reconstruct the 16-bit SW value
    sw_bin = ""
    for idx in reversed(range(16)):
        sig_name = f"SW[{idx}]"
        sw_bin += signals.get(sig_name, '0')
        
    print(f"SW at 0 ns (binary) = {sw_bin}")
    try:
        sw_hex = f"0x{int(sw_bin, 2):04X}"
        print(f"SW at 0 ns (hex)    = {sw_hex}")
        # Decode: Rt, Rs, Opcode, Data
        rt = int(sw_bin[0:2], 2)
        rs = int(sw_bin[2:4], 2)
        op = int(sw_bin[4:8], 2)
        data = int(sw_bin[8:16], 2)
        print(f"Decoded: Rt=R{rt}, Rs=R{rs}, Opcode={op}, Data=0x{data:02X} ({data})")
    except ValueError:
        print("Could not parse SW binary value")

if __name__ == "__main__":
    trace_vwf_sw("c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/Waveform.vwf")
