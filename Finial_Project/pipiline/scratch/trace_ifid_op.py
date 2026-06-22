def trace_ifid_op():
    content = open('c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/Pipeline_CPU.msim.vcd').read()
    current_time = "0"
    state = {'q&': '0', 'r&': '0', 's&': '0', 't&': '0'}
    for line in content.split('\n'):
        line = line.strip()
        if line.startswith('#'):
            current_time = line[1:]
        if (line.startswith('0') or line.startswith('1')) and len(line) > 1:
            val = line[0]
            sym = line[1:]
            if sym in state:
                state[sym] = val
                print(f"{float(current_time)/1000.0:6.1f} ns: q&={state['q&']} r&={state['r&']} s&={state['s&']} t&={state['t&']}")

if __name__ == "__main__":
    trace_ifid_op()
