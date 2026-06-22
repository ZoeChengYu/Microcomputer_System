import re

def fix_vwf_properly(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    new_nodes = {
        "SW[15]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 125.0;
\t\tLEVEL 1 FOR 60.0;
\t\tLEVEL 0 FOR 1815.0;
\t}""",
        "SW[14]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 2000.0;
\t}""",
        "SW[13]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 35.0;
\t\tLEVEL 1 FOR 30.0;
\t\tLEVEL 0 FOR 1935.0;
\t}""",
        "SW[12]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 1 FOR 35.0;
\t\tLEVEL 0 FOR 90.0;
\t\tLEVEL 1 FOR 60.0;
\t\tLEVEL 0 FOR 1815.0;
\t}""",
        "SW[11]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 65.0;
\t\tLEVEL 1 FOR 90.0;
\t\tLEVEL 0 FOR 30.0;
\t\tLEVEL 1 FOR 1815.0;
\t}""",
        "SW[10]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 65.0;
\t\tLEVEL 1 FOR 60.0;
\t\tLEVEL 0 FOR 60.0;
\t\tLEVEL 1 FOR 1815.0;
\t}""",
        "SW[9]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 65.0;
\t\tLEVEL 1 FOR 60.0;
\t\tLEVEL 0 FOR 30.0;
\t\tLEVEL 1 FOR 1845.0;
\t}""",
        "SW[8]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 65.0;
\t\tLEVEL 1 FOR 60.0;
\t\tLEVEL 0 FOR 60.0;
\t\tLEVEL 1 FOR 1815.0;
\t}""",
        "SW[7]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 2000.0;
\t}""",
        "SW[6]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 2000.0;
\t}""",
        "SW[5]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 1 FOR 35.0;
\t\tLEVEL 0 FOR 1965.0;
\t}""",
        "SW[4]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 1 FOR 35.0;
\t\tLEVEL 0 FOR 1965.0;
\t}""",
        "SW[3]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 2000.0;
\t}""",
        "SW[2]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 35.0;
\t\tLEVEL 1 FOR 30.0;
\t\tLEVEL 0 FOR 1935.0;
\t}""",
        "SW[1]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 35.0;
\t\tLEVEL 1 FOR 30.0;
\t\tLEVEL 0 FOR 1935.0;
\t}""",
        "SW[0]": """\tNODE
\t{
\t\tREPEAT = 1;
\t\tLEVEL 0 FOR 2000.0;
\t}"""
    }

    # Replace each TRANSITION_LIST block
    for sig, node_content in new_nodes.items():
        pattern = r'(TRANSITION_LIST\("' + re.escape(sig) + r'"\)\s*\{)(.*?)(\n\})'
        replacement = r'\1\n' + node_content + r'\3'
        content = re.sub(pattern, replacement, content, flags=re.DOTALL)
        
    with open(filepath, 'w') as f:
        f.write(content)
        
    print("Waveform.vwf SW transition timings successfully fixed properly!")

if __name__ == "__main__":
    fix_vwf_properly("c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/Waveform.vwf")
