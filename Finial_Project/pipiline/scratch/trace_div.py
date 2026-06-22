def trace_div():
    content = open('c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/Pipeline_CPU.msim.vcd').read()
    current_time = "0"
    for line in content.split('\n'):
        line = line.strip()
        if line.startswith('#'):
            current_time = line[1:]
        if 'K%' in line or 'S ' in line or 'T ' in line:
            # K% = div_state.DIV_RUN~q
            # S = LEDG [1] (Exe_Busy)
            # T = LEDG [0] (Hazard)
            print(f"{float(current_time)/1000.0:6.1f} ns: {line}")

if __name__ == "__main__":
    trace_div()
