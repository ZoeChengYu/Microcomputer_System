def count_hex_changes():
    content = open('c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/Pipeline_CPU.msim.vcd').read()
    hex_syms = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<"]
    
    count = 0
    for line in content.split('\n'):
        line = line.strip()
        if (line.startswith('0') or line.startswith('1')) and len(line) > 1:
            sym = line[1:]
            if sym in hex_syms:
                count += 1
                
    print(f"Total changes to HEX segments = {count}")

if __name__ == "__main__":
    count_hex_changes()
