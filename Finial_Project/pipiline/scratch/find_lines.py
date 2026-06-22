def find_lines():
    with open('c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/Waveform.vwf', 'r') as f:
        lines = f.readlines()
        
    for idx, line in enumerate(lines):
        if 'TRANSITION_LIST' in line and 'SW[' in line:
            print(f"Line {idx+1}: {line.strip()}")
            # Print the next 10 lines of the block
            for j in range(1, 10):
                if idx+j < len(lines):
                    print(f"  {idx+1+j}: {lines[idx+j].strip()}")
            print()

if __name__ == "__main__":
    find_lines()
