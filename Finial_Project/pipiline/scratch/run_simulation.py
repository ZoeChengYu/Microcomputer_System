import subprocess
import sys
import os

def run_cmd(cmd, cwd):
    print(f"Executing: {cmd}")
    res = subprocess.run(cmd, shell=True, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if res.returncode != 0:
        print(f"Error: Command failed with code {res.returncode}")
        print(res.stdout)
        print(res.stderr)
        return False
    print("Success!")
    return True

def main():
    cwd = "c:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline"
    q_eda = "d:/altera_lite/25.1std/quartus/bin64/quartus_eda.exe"
    vsim = "d:/altera_lite/25.1std/questa_fse/win64/vsim.exe"
    
    # 1. Generate testbench
    cmd1 = f'"{q_eda}" --gen_testbench --tool=modelsim_oem --format=vhdl --write_settings_files=off Pipeline_CPU -c Pipeline_CPU --vector_source="C:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/Waveform.vwf" --testbench_file="C:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/Waveform.vwf.vht"'
    if not run_cmd(cmd1, cwd):
        sys.exit(1)
        
    # 2. Generate netlist
    cmd2 = f'"{q_eda}" --write_settings_files=off --simulation --functional=on --flatten_buses=off --tool=modelsim_oem --format=vhdl --output_directory="C:/Users/ChengYu/Desktop/micro/Finial_Project/pipiline/simulation/qsim/" Pipeline_CPU -c Pipeline_CPU'
    if not run_cmd(cmd2, cwd):
        sys.exit(1)
        
    # 3. Run simulation
    cmd3 = f'"{vsim}" -c -do Pipeline_CPU.do'
    if not run_cmd(cmd3, os.path.join(cwd, "simulation/qsim")):
        sys.exit(1)
        
    print("Simulation completed successfully!")

if __name__ == "__main__":
    main()
