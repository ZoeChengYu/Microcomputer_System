def trace_c():
    content = open('c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/Pipeline_CPU.msim.vcd').read()
    current_time = "0"
    for line in content.split('\n'):
        line = line.strip()
        if line.startswith('#'):
            current_time = line[1:]
        if 'c"' in line:
            print(f"{current_time}: {line}")

if __name__ == "__main__":
    trace_c()
