import re

def shift_vwf(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # We want to replace transition blocks for SW signals
    # We will search for TRANSITION_LIST("SW[xx]") blocks and modify their levels.
    
    # 1. SW[15]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[15\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 125.0 \2 60.0 \3 1815.0 \4',
        content, flags=re.DOTALL
    )
    
    # 2. SW[13]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[13\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 30.0 \3 1935.0 \4',
        content, flags=re.DOTALL
    )
    
    # 3. SW[12]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[12\]"\)\s*\{.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 90.0 \3 60.0 \4 1815.0 \5',
        content, flags=re.DOTALL
    )
    
    # 4. SW[11]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[11\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;)',
        r'\1 65.0 \2 90.0 \3 30.0 \4 1815.0 \5',
        content, flags=re.DOTALL
    )
    
    # 5. SW[10]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[10\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;)',
        r'\1 65.0 \2 60.0 \3 60.0 \4 1815.0 \5',
        content, flags=re.DOTALL
    )
    
    # 6. SW[9]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[9\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;)',
        r'\1 65.0 \2 60.0 \3 30.0 \4 1845.0 \5',
        content, flags=re.DOTALL
    )
    
    # 7. SW[8]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[8\]"\)\s*\{.*?LEVEL 0 FOR )50\.0(;.*?LEVEL 1 FOR )60\.0(;.*?LEVEL 0 FOR )60\.0(;.*?LEVEL 1 FOR )1830\.0(;)',
        r'\1 65.0 \2 60.0 \3 60.0 \4 1815.0 \5',
        content, flags=re.DOTALL
    )
    
    # 8. SW[5]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[5\]"\)\s*\{.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 1965.0 \3',
        content, flags=re.DOTALL
    )
    
    # 9. SW[4]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[4\]"\)\s*\{.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 1965.0 \3',
        content, flags=re.DOTALL
    )
    
    # 10. SW[2]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[2\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 30.0 \3 1935.0 \4',
        content, flags=re.DOTALL
    )
    
    # 11. SW[1]
    content = re.sub(
        r'(TRANSITION_LIST\("SW\[1\]"\)\s*\{.*?LEVEL 0 FOR )\d+\.\d+(;.*?LEVEL 1 FOR )\d+\.\d+(;.*?LEVEL 0 FOR )\d+\.\d+(;)',
        r'\1 35.0 \2 30.0 \3 1935.0 \4',
        content, flags=re.DOTALL
    )
    
    with open(filepath, 'w') as f:
        f.write(content)
        
    print("Waveform.vwf SW transition timings successfully shifted!")

if __name__ == "__main__":
    shift_vwf("c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/Waveform.vwf")
