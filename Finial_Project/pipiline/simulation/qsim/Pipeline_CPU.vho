-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

-- DATE "06/22/2026 17:42:07"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Altera FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Pipeline_CPU IS
    PORT (
	SW : IN std_logic_vector(15 DOWNTO 0);
	KEY : IN std_logic_vector(0 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	LEDR : OUT std_logic_vector(7 DOWNTO 0);
	LEDG : OUT std_logic_vector(1 DOWNTO 0)
	);
END Pipeline_CPU;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Pipeline_CPU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(1 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \IFID_opcode[1]~1_combout\ : std_logic;
SIGNAL \IDEXE_opcode[1]~feeder_combout\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \IFID_opcode[3]~3_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \IFID_opcode[0]~0_combout\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \IFID_opcode[2]~2_combout\ : std_logic;
SIGNAL \Mux38~3_combout\ : std_logic;
SIGNAL \IFID_valid~feeder_combout\ : std_logic;
SIGNAL \IFID_valid~q\ : std_logic;
SIGNAL \process_4~0_combout\ : std_logic;
SIGNAL \div_count[2]~0_combout\ : std_logic;
SIGNAL \process_4~1_combout\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \IFID_rs_id[0]~feeder_combout\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \fwd_rt_exe~0_combout\ : std_logic;
SIGNAL \reads_rt_v~0_combout\ : std_logic;
SIGNAL \IDEXE_valid~q\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \fwd_rt_exe~combout\ : std_logic;
SIGNAL \Mux37~2_combout\ : std_logic;
SIGNAL \Mux39~5_combout\ : std_logic;
SIGNAL \IDEXE_rt_val[7]~feeder_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \EXEWB_opcode~3_combout\ : std_logic;
SIGNAL \EXEWB_opcode~1_combout\ : std_logic;
SIGNAL \EXEWB_opcode~0_combout\ : std_logic;
SIGNAL \EXEWB_opcode~2_combout\ : std_logic;
SIGNAL \Equal11~0_combout\ : std_logic;
SIGNAL \EXEWB_valid~0_combout\ : std_logic;
SIGNAL \EXEWB_valid~q\ : std_logic;
SIGNAL \EXEWB_rs_id~1_combout\ : std_logic;
SIGNAL \EXEWB_rs_id~0_combout\ : std_logic;
SIGNAL \fwd_rs_wb~0_combout\ : std_logic;
SIGNAL \reads_rs_v~0_combout\ : std_logic;
SIGNAL \fwd_rs_wb~1_combout\ : std_logic;
SIGNAL \fwd_rs_exe~0_combout\ : std_logic;
SIGNAL \fwd_rs_exe~1_combout\ : std_logic;
SIGNAL \Rs_val_fwd[0]~0_combout\ : std_logic;
SIGNAL \Mux60~1_combout\ : std_logic;
SIGNAL \R0[3]~0_combout\ : std_logic;
SIGNAL \Rs_val_fwd[7]~6_combout\ : std_logic;
SIGNAL \R1[7]~feeder_combout\ : std_logic;
SIGNAL \Mux60~0_combout\ : std_logic;
SIGNAL \Rs_val_fwd[7]~7_combout\ : std_logic;
SIGNAL \fwd_rs_wb~combout\ : std_logic;
SIGNAL \Rs_val_fwd[7]~5_combout\ : std_logic;
SIGNAL \Rs_val_fwd[7]~8_combout\ : std_logic;
SIGNAL \Mux37~1_combout\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \Mux32~0_combout\ : std_logic;
SIGNAL \Mux32~1_combout\ : std_logic;
SIGNAL \Add0~33_combout\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Mux72~2_combout\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \div_quot[4]~29_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Mux60~2_combout\ : std_logic;
SIGNAL \Rs_val_fwd[1]~30_combout\ : std_logic;
SIGNAL \Rs_val_fwd[1]~31_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \div_quot[1]~26_combout\ : std_logic;
SIGNAL \div_quot[1]~18_combout\ : std_logic;
SIGNAL \Mux38~4_combout\ : std_logic;
SIGNAL \Rs_val_fwd[1]~29_combout\ : std_logic;
SIGNAL \Rs_val_fwd[1]~32_combout\ : std_logic;
SIGNAL \Mux38~0_combout\ : std_logic;
SIGNAL \Mux38~1_combout\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \div_quot[0]~25_combout\ : std_logic;
SIGNAL \div_quot[0]~17_combout\ : std_logic;
SIGNAL \R2[0]~feeder_combout\ : std_logic;
SIGNAL \R1[0]~feeder_combout\ : std_logic;
SIGNAL \Rs_val_fwd[0]~1_combout\ : std_logic;
SIGNAL \Rs_val_fwd[0]~2_combout\ : std_logic;
SIGNAL \Rs_val_fwd[0]~3_combout\ : std_logic;
SIGNAL \Rs_val_fwd[0]~4_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~3_cout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Mux39~4_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \IFID_data[0]~feeder_combout\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \div_quot[5]~28_combout\ : std_logic;
SIGNAL \div_quot[5]~20_combout\ : std_logic;
SIGNAL \Rs_val_fwd[5]~14_combout\ : std_logic;
SIGNAL \Rs_val_fwd[5]~15_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \Mux34~0_combout\ : std_logic;
SIGNAL \Mux34~1_combout\ : std_logic;
SIGNAL \Mux34~2_combout\ : std_logic;
SIGNAL \Mux34~3_combout\ : std_logic;
SIGNAL \Rs_val_fwd[5]~13_combout\ : std_logic;
SIGNAL \Rs_val_fwd[5]~16_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \IFID_data[4]~feeder_combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Mux35~1_combout\ : std_logic;
SIGNAL \Rs_val_fwd[3]~22_combout\ : std_logic;
SIGNAL \Rs_val_fwd[3]~23_combout\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \div_quot[3]~31_combout\ : std_logic;
SIGNAL \div_quot[3]~23_combout\ : std_logic;
SIGNAL \Rt_val_fwd[3]~23_combout\ : std_logic;
SIGNAL \Rt_val_fwd[3]~24_combout\ : std_logic;
SIGNAL \fwd_rt_wb~0_combout\ : std_logic;
SIGNAL \fwd_rt_wb~1_combout\ : std_logic;
SIGNAL \Rt_val_fwd[3]~25_combout\ : std_logic;
SIGNAL \Rt_val_fwd[3]~26_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \IFID_data[3]~feeder_combout\ : std_logic;
SIGNAL \Mux36~0_combout\ : std_logic;
SIGNAL \Mux36~1_combout\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \div_quot[2]~30_combout\ : std_logic;
SIGNAL \div_quot[2]~22_combout\ : std_logic;
SIGNAL \Mux37~6_combout\ : std_logic;
SIGNAL \Rt_val_fwd[2]~19_combout\ : std_logic;
SIGNAL \Rt_val_fwd[2]~20_combout\ : std_logic;
SIGNAL \Rt_val_fwd[2]~21_combout\ : std_logic;
SIGNAL \Rt_val_fwd[2]~22_combout\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \Mux37~3_combout\ : std_logic;
SIGNAL \Mux37~4_combout\ : std_logic;
SIGNAL \Mux37~5_combout\ : std_logic;
SIGNAL \EXEWB_result~2_combout\ : std_logic;
SIGNAL \Rs_val_fwd[2]~26_combout\ : std_logic;
SIGNAL \Rs_val_fwd[2]~27_combout\ : std_logic;
SIGNAL \Rs_val_fwd[2]~25_combout\ : std_logic;
SIGNAL \Rs_val_fwd[2]~28_combout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Mux36~2_combout\ : std_logic;
SIGNAL \Mux36~3_combout\ : std_logic;
SIGNAL \Rs_val_fwd[3]~21_combout\ : std_logic;
SIGNAL \Rs_val_fwd[3]~24_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Mux35~2_combout\ : std_logic;
SIGNAL \Mux35~3_combout\ : std_logic;
SIGNAL \R2[4]~feeder_combout\ : std_logic;
SIGNAL \Rt_val_fwd[4]~15_combout\ : std_logic;
SIGNAL \Rt_val_fwd[4]~16_combout\ : std_logic;
SIGNAL \Rt_val_fwd[4]~17_combout\ : std_logic;
SIGNAL \Rt_val_fwd[4]~18_combout\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Mux34~4_combout\ : std_logic;
SIGNAL \EXEWB_result~5_combout\ : std_logic;
SIGNAL \Rt_val_fwd[5]~11_combout\ : std_logic;
SIGNAL \Rt_val_fwd[5]~12_combout\ : std_logic;
SIGNAL \Rt_val_fwd[5]~13_combout\ : std_logic;
SIGNAL \Rt_val_fwd[5]~14_combout\ : std_logic;
SIGNAL \IDEXE_rt_val[5]~feeder_combout\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \Mux33~1_combout\ : std_logic;
SIGNAL \Mux33~2_combout\ : std_logic;
SIGNAL \Mux33~3_combout\ : std_logic;
SIGNAL \R2[6]~feeder_combout\ : std_logic;
SIGNAL \Rt_val_fwd[6]~7_combout\ : std_logic;
SIGNAL \Rt_val_fwd[6]~8_combout\ : std_logic;
SIGNAL \Rt_val_fwd[6]~9_combout\ : std_logic;
SIGNAL \Rt_val_fwd[6]~10_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~14_combout\ : std_logic;
SIGNAL \Mux39~1_combout\ : std_logic;
SIGNAL \Mux39~2_combout\ : std_logic;
SIGNAL \Mux39~3_combout\ : std_logic;
SIGNAL \Mux39~6_combout\ : std_logic;
SIGNAL \EXEWB_result~0_combout\ : std_logic;
SIGNAL \Rt_val_fwd[0]~0_combout\ : std_logic;
SIGNAL \Rt_val_fwd[0]~1_combout\ : std_logic;
SIGNAL \Rt_val_fwd[0]~2_combout\ : std_logic;
SIGNAL \Rt_val_fwd[0]~31_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Mux38~2_combout\ : std_logic;
SIGNAL \EXEWB_result~1_combout\ : std_logic;
SIGNAL \Rt_val_fwd[1]~3_combout\ : std_logic;
SIGNAL \Rt_val_fwd[1]~4_combout\ : std_logic;
SIGNAL \Rt_val_fwd[1]~5_combout\ : std_logic;
SIGNAL \Rt_val_fwd[1]~6_combout\ : std_logic;
SIGNAL \Equal15~0_combout\ : std_logic;
SIGNAL \Equal15~1_combout\ : std_logic;
SIGNAL \div_quot~16_combout\ : std_logic;
SIGNAL \div_quot[4]~21_combout\ : std_logic;
SIGNAL \Mux35~4_combout\ : std_logic;
SIGNAL \EXEWB_result~4_combout\ : std_logic;
SIGNAL \Rs_val_fwd[4]~18_combout\ : std_logic;
SIGNAL \Rs_val_fwd[4]~19_combout\ : std_logic;
SIGNAL \Rs_val_fwd[4]~17_combout\ : std_logic;
SIGNAL \Rs_val_fwd[4]~20_combout\ : std_logic;
SIGNAL \Mux72~3_combout\ : std_logic;
SIGNAL \Mux72~0_combout\ : std_logic;
SIGNAL \Mux72~1_combout\ : std_logic;
SIGNAL \Mux72~4_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \div_rem[5]~0_combout\ : std_logic;
SIGNAL \div_rem[5]~1_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~19_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add3~17_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Add3~15_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \LessThan1~1_cout\ : std_logic;
SIGNAL \LessThan1~3_cout\ : std_logic;
SIGNAL \LessThan1~5_cout\ : std_logic;
SIGNAL \LessThan1~7_cout\ : std_logic;
SIGNAL \LessThan1~9_cout\ : std_logic;
SIGNAL \LessThan1~11_cout\ : std_logic;
SIGNAL \LessThan1~13_cout\ : std_logic;
SIGNAL \LessThan1~14_combout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \div_quot[6]~27_combout\ : std_logic;
SIGNAL \div_quot[6]~19_combout\ : std_logic;
SIGNAL \Mux33~4_combout\ : std_logic;
SIGNAL \EXEWB_result~6_combout\ : std_logic;
SIGNAL \Rs_val_fwd[6]~10_combout\ : std_logic;
SIGNAL \Rs_val_fwd[6]~11_combout\ : std_logic;
SIGNAL \Rs_val_fwd[6]~9_combout\ : std_logic;
SIGNAL \Rs_val_fwd[6]~12_combout\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Mux32~2_combout\ : std_logic;
SIGNAL \Mux32~3_combout\ : std_logic;
SIGNAL \Rt_val_fwd[7]~30_combout\ : std_logic;
SIGNAL \Equal15~2_combout\ : std_logic;
SIGNAL \div_count[2]~1_combout\ : std_logic;
SIGNAL \Decoder0~7_combout\ : std_logic;
SIGNAL \div_quot[7]~32_combout\ : std_logic;
SIGNAL \div_quot[7]~24_combout\ : std_logic;
SIGNAL \Mux32~4_combout\ : std_logic;
SIGNAL \EXEWB_result~7_combout\ : std_logic;
SIGNAL \Rt_val_fwd[7]~27_combout\ : std_logic;
SIGNAL \Rt_val_fwd[7]~28_combout\ : std_logic;
SIGNAL \Rt_val_fwd[7]~29_combout\ : std_logic;
SIGNAL \Equal15~3_combout\ : std_logic;
SIGNAL \div_divisor[0]~0_combout\ : std_logic;
SIGNAL \div_divisor[0]~1_combout\ : std_logic;
SIGNAL \div_count[0]~3_combout\ : std_logic;
SIGNAL \div_count[1]~2_combout\ : std_logic;
SIGNAL \div_state~7_combout\ : std_logic;
SIGNAL \div_state~8_combout\ : std_logic;
SIGNAL \div_state.DIV_RUN~q\ : std_logic;
SIGNAL \EXEWB_result~3_combout\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux20~1_combout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \Mux22~1_combout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \Mux23~1_combout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;
SIGNAL \Mux21~1_combout\ : std_logic;
SIGNAL \Mux79~0_combout\ : std_logic;
SIGNAL \Mux78~0_combout\ : std_logic;
SIGNAL \Mux77~0_combout\ : std_logic;
SIGNAL \Mux76~0_combout\ : std_logic;
SIGNAL \Mux75~0_combout\ : std_logic;
SIGNAL \Mux74~0_combout\ : std_logic;
SIGNAL \Mux73~0_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux18~1_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux17~1_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux16~1_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux19~1_combout\ : std_logic;
SIGNAL \Mux86~0_combout\ : std_logic;
SIGNAL \Mux85~0_combout\ : std_logic;
SIGNAL \Mux84~0_combout\ : std_logic;
SIGNAL \Mux83~0_combout\ : std_logic;
SIGNAL \Mux82~0_combout\ : std_logic;
SIGNAL \Mux81~0_combout\ : std_logic;
SIGNAL \Mux80~0_combout\ : std_logic;
SIGNAL \Mux28~0_combout\ : std_logic;
SIGNAL \Mux28~1_combout\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \Mux31~1_combout\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \Mux29~1_combout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \Mux30~1_combout\ : std_logic;
SIGNAL \Mux93~0_combout\ : std_logic;
SIGNAL \Mux92~0_combout\ : std_logic;
SIGNAL \Mux91~0_combout\ : std_logic;
SIGNAL \Mux90~0_combout\ : std_logic;
SIGNAL \Mux89~0_combout\ : std_logic;
SIGNAL \Mux88~0_combout\ : std_logic;
SIGNAL \Mux87~0_combout\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \Mux25~1_combout\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \Mux27~1_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux24~1_combout\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \Mux26~1_combout\ : std_logic;
SIGNAL \Mux100~0_combout\ : std_logic;
SIGNAL \Mux99~0_combout\ : std_logic;
SIGNAL \Mux98~0_combout\ : std_logic;
SIGNAL \Mux97~0_combout\ : std_logic;
SIGNAL \Mux96~0_combout\ : std_logic;
SIGNAL \Mux95~0_combout\ : std_logic;
SIGNAL \Mux94~0_combout\ : std_logic;
SIGNAL \Mux107~0_combout\ : std_logic;
SIGNAL \Mux106~0_combout\ : std_logic;
SIGNAL \Mux105~0_combout\ : std_logic;
SIGNAL \Mux104~0_combout\ : std_logic;
SIGNAL \Mux103~0_combout\ : std_logic;
SIGNAL \Mux102~0_combout\ : std_logic;
SIGNAL \Mux101~0_combout\ : std_logic;
SIGNAL \Mux114~0_combout\ : std_logic;
SIGNAL \Mux113~0_combout\ : std_logic;
SIGNAL \Mux112~0_combout\ : std_logic;
SIGNAL \Mux111~0_combout\ : std_logic;
SIGNAL \Mux110~0_combout\ : std_logic;
SIGNAL \Mux109~0_combout\ : std_logic;
SIGNAL \Mux108~0_combout\ : std_logic;
SIGNAL \Mux121~0_combout\ : std_logic;
SIGNAL \Mux120~0_combout\ : std_logic;
SIGNAL \Mux119~0_combout\ : std_logic;
SIGNAL \Mux118~0_combout\ : std_logic;
SIGNAL \Mux117~0_combout\ : std_logic;
SIGNAL \Mux116~0_combout\ : std_logic;
SIGNAL \Mux115~0_combout\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \process_3~0_combout\ : std_logic;
SIGNAL \process_3~1_combout\ : std_logic;
SIGNAL R2 : std_logic_vector(7 DOWNTO 0);
SIGNAL div_rem : std_logic_vector(7 DOWNTO 0);
SIGNAL IDEXE_rs_id : std_logic_vector(1 DOWNTO 0);
SIGNAL R1 : std_logic_vector(7 DOWNTO 0);
SIGNAL IDEXE_opcode : std_logic_vector(3 DOWNTO 0);
SIGNAL R0 : std_logic_vector(7 DOWNTO 0);
SIGNAL R3 : std_logic_vector(7 DOWNTO 0);
SIGNAL IFID_opcode : std_logic_vector(3 DOWNTO 0);
SIGNAL IFID_rt_id : std_logic_vector(1 DOWNTO 0);
SIGNAL EXEWB_rs_id : std_logic_vector(1 DOWNTO 0);
SIGNAL EXEWB_opcode : std_logic_vector(3 DOWNTO 0);
SIGNAL IFID_rs_id : std_logic_vector(1 DOWNTO 0);
SIGNAL EXEWB_result : std_logic_vector(7 DOWNTO 0);
SIGNAL div_count : std_logic_vector(2 DOWNTO 0);
SIGNAL IDEXE_rs_val : std_logic_vector(7 DOWNTO 0);
SIGNAL IDEXE_rt_val : std_logic_vector(7 DOWNTO 0);
SIGNAL IDEXE_data : std_logic_vector(7 DOWNTO 0);
SIGNAL div_quot : std_logic_vector(7 DOWNTO 0);
SIGNAL IFID_data : std_logic_vector(7 DOWNTO 0);
SIGNAL div_divisor : std_logic_vector(7 DOWNTO 0);
SIGNAL div_dividend : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_div_state.DIV_RUN~q\ : std_logic;
SIGNAL \ALT_INV_Mux73~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux80~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux87~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux94~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux108~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux101~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux115~0_combout\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
ww_KEY <= KEY;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_div_state.DIV_RUN~q\ <= NOT \div_state.DIV_RUN~q\;
\ALT_INV_Mux73~0_combout\ <= NOT \Mux73~0_combout\;
\ALT_INV_Mux80~0_combout\ <= NOT \Mux80~0_combout\;
\ALT_INV_Mux87~0_combout\ <= NOT \Mux87~0_combout\;
\ALT_INV_Mux94~0_combout\ <= NOT \Mux94~0_combout\;
\ALT_INV_Mux108~0_combout\ <= NOT \Mux108~0_combout\;
\ALT_INV_Mux101~0_combout\ <= NOT \Mux101~0_combout\;
\ALT_INV_Mux115~0_combout\ <= NOT \Mux115~0_combout\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux79~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux78~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux77~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux76~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux75~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux74~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux73~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux86~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux85~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux84~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux83~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux82~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux81~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux80~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux93~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux92~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux91~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux90~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux89~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux88~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux87~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux100~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux99~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux98~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux97~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux96~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux95~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux94~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux107~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux106~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux105~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux104~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux103~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux102~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux101~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux114~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux113~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux112~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux111~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux110~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux109~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux108~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux121~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux120~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux119~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux118~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux117~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux116~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux115~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[2]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[3]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[4]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[5]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[6]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[7]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \process_3~1_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \div_state.DIV_RUN~q\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: FF_X111_Y31_N5
\IFID_rt_id[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[14]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_rt_id(0));

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LCCOMB_X107_Y31_N18
\IFID_opcode[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_opcode[1]~1_combout\ = !\SW[9]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[9]~input_o\,
	combout => \IFID_opcode[1]~1_combout\);

-- Location: FF_X107_Y31_N19
\IFID_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_opcode[1]~1_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_opcode(1));

-- Location: LCCOMB_X113_Y33_N12
\IDEXE_opcode[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IDEXE_opcode[1]~feeder_combout\ = IFID_opcode(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => IFID_opcode(1),
	combout => \IDEXE_opcode[1]~feeder_combout\);

-- Location: FF_X113_Y33_N13
\IDEXE_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IDEXE_opcode[1]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_opcode(1));

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: LCCOMB_X107_Y31_N22
\IFID_opcode[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_opcode[3]~3_combout\ = !\SW[11]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[11]~input_o\,
	combout => \IFID_opcode[3]~3_combout\);

-- Location: FF_X107_Y31_N23
\IFID_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_opcode[3]~3_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_opcode(3));

-- Location: FF_X111_Y33_N9
\IDEXE_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_opcode(3),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_opcode(3));

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LCCOMB_X107_Y31_N4
\IFID_opcode[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_opcode[0]~0_combout\ = !\SW[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[8]~input_o\,
	combout => \IFID_opcode[0]~0_combout\);

-- Location: FF_X107_Y31_N5
\IFID_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_opcode[0]~0_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_opcode(0));

-- Location: FF_X111_Y33_N1
\IDEXE_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_opcode(0),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_opcode(0));

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: LCCOMB_X107_Y31_N28
\IFID_opcode[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_opcode[2]~2_combout\ = !\SW[10]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[10]~input_o\,
	combout => \IFID_opcode[2]~2_combout\);

-- Location: FF_X107_Y31_N29
\IFID_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_opcode[2]~2_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_opcode(2));

-- Location: FF_X111_Y33_N7
\IDEXE_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_opcode(2),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_opcode(2));

-- Location: LCCOMB_X113_Y33_N26
\Mux38~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~3_combout\ = (IDEXE_opcode(1) & (!IDEXE_opcode(3) & (IDEXE_opcode(0) & IDEXE_opcode(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(1),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(0),
	datad => IDEXE_opcode(2),
	combout => \Mux38~3_combout\);

-- Location: LCCOMB_X114_Y40_N0
\IFID_valid~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_valid~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \IFID_valid~feeder_combout\);

-- Location: FF_X114_Y40_N1
IFID_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_valid~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_valid~q\);

-- Location: LCCOMB_X107_Y31_N2
\process_4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_4~0_combout\ = (IFID_opcode(1) & (IFID_opcode(0) & (\IFID_valid~q\ & IFID_opcode(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(1),
	datab => IFID_opcode(0),
	datac => \IFID_valid~q\,
	datad => IFID_opcode(2),
	combout => \process_4~0_combout\);

-- Location: LCCOMB_X109_Y32_N16
\div_count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_count[2]~0_combout\ = (\div_state.DIV_RUN~q\ & ((div_count(2)) # ((div_count(1) & div_count(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \div_state.DIV_RUN~q\,
	combout => \div_count[2]~0_combout\);

-- Location: LCCOMB_X110_Y32_N0
\process_4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_4~1_combout\ = (!IFID_opcode(3) & \process_4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IFID_opcode(3),
	datac => \process_4~0_combout\,
	combout => \process_4~1_combout\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: LCCOMB_X110_Y31_N24
\IFID_rs_id[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_rs_id[0]~feeder_combout\ = \SW[12]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[12]~input_o\,
	combout => \IFID_rs_id[0]~feeder_combout\);

-- Location: FF_X110_Y31_N25
\IFID_rs_id[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_rs_id[0]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_rs_id(0));

-- Location: FF_X111_Y31_N7
\IDEXE_rs_id[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_rs_id(0),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_id(0));

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: FF_X111_Y31_N31
\IFID_rt_id[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[15]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_rt_id(1));

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: FF_X113_Y31_N5
\IFID_rs_id[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[13]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_rs_id(1));

-- Location: FF_X111_Y31_N1
\IDEXE_rs_id[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_rs_id(1),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_id(1));

-- Location: LCCOMB_X111_Y31_N30
\fwd_rt_exe~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rt_exe~0_combout\ = (IDEXE_rs_id(0) & (IFID_rt_id(0) & (IFID_rt_id(1) $ (!IDEXE_rs_id(1))))) # (!IDEXE_rs_id(0) & (!IFID_rt_id(0) & (IFID_rt_id(1) $ (!IDEXE_rs_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rs_id(0),
	datab => IFID_rt_id(0),
	datac => IFID_rt_id(1),
	datad => IDEXE_rs_id(1),
	combout => \fwd_rt_exe~0_combout\);

-- Location: LCCOMB_X107_Y31_N6
\reads_rt_v~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reads_rt_v~0_combout\ = (IFID_opcode(3) & ((IFID_opcode(2) & ((!IFID_opcode(1)) # (!IFID_opcode(0)))) # (!IFID_opcode(2) & ((IFID_opcode(0)) # (IFID_opcode(1)))))) # (!IFID_opcode(3) & (IFID_opcode(2) & ((IFID_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \reads_rt_v~0_combout\);

-- Location: FF_X111_Y31_N13
IDEXE_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \IFID_valid~q\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IDEXE_valid~q\);

-- Location: LCCOMB_X112_Y33_N8
\Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (!IDEXE_opcode(0) & (!IDEXE_opcode(2) & (!IDEXE_opcode(1) & !IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(2),
	datac => IDEXE_opcode(1),
	datad => IDEXE_opcode(3),
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X111_Y31_N12
fwd_rt_exe : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rt_exe~combout\ = (\fwd_rt_exe~0_combout\ & (\reads_rt_v~0_combout\ & (\IDEXE_valid~q\ & !\Equal8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_exe~0_combout\,
	datab => \reads_rt_v~0_combout\,
	datac => \IDEXE_valid~q\,
	datad => \Equal8~0_combout\,
	combout => \fwd_rt_exe~combout\);

-- Location: LCCOMB_X113_Y33_N8
\Mux37~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~2_combout\ = (IDEXE_opcode(0) & (IDEXE_opcode(3) & (IDEXE_opcode(2) & !IDEXE_opcode(1)))) # (!IDEXE_opcode(0) & (IDEXE_opcode(1) & (IDEXE_opcode(3) $ (IDEXE_opcode(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => IDEXE_opcode(0),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux37~2_combout\);

-- Location: LCCOMB_X112_Y33_N20
\Mux39~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~5_combout\ = (!IDEXE_opcode(1)) # (!IDEXE_opcode(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(2),
	datac => IDEXE_opcode(1),
	combout => \Mux39~5_combout\);

-- Location: LCCOMB_X113_Y33_N18
\IDEXE_rt_val[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IDEXE_rt_val[7]~feeder_combout\ = \Rt_val_fwd[7]~30_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Rt_val_fwd[7]~30_combout\,
	combout => \IDEXE_rt_val[7]~feeder_combout\);

-- Location: FF_X113_Y33_N19
\IDEXE_rt_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IDEXE_rt_val[7]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(7));

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X114_Y40_N9
\IFID_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(7));

-- Location: FF_X113_Y33_N15
\IDEXE_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(7),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(7));

-- Location: LCCOMB_X110_Y31_N12
\EXEWB_opcode~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_opcode~3_combout\ = (!\div_state.DIV_RUN~q\ & IDEXE_opcode(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datac => IDEXE_opcode(3),
	combout => \EXEWB_opcode~3_combout\);

-- Location: FF_X110_Y31_N13
\EXEWB_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_opcode~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_opcode(3));

-- Location: LCCOMB_X110_Y31_N20
\EXEWB_opcode~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_opcode~1_combout\ = (!\div_state.DIV_RUN~q\ & IDEXE_opcode(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datad => IDEXE_opcode(1),
	combout => \EXEWB_opcode~1_combout\);

-- Location: FF_X110_Y31_N21
\EXEWB_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_opcode~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_opcode(1));

-- Location: LCCOMB_X110_Y31_N30
\EXEWB_opcode~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_opcode~0_combout\ = (!\div_state.DIV_RUN~q\ & IDEXE_opcode(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datad => IDEXE_opcode(0),
	combout => \EXEWB_opcode~0_combout\);

-- Location: FF_X110_Y31_N31
\EXEWB_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_opcode~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_opcode(0));

-- Location: LCCOMB_X110_Y31_N2
\EXEWB_opcode~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_opcode~2_combout\ = (!\div_state.DIV_RUN~q\ & IDEXE_opcode(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datac => IDEXE_opcode(2),
	combout => \EXEWB_opcode~2_combout\);

-- Location: FF_X110_Y31_N3
\EXEWB_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_opcode~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_opcode(2));

-- Location: LCCOMB_X110_Y31_N26
\Equal11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal11~0_combout\ = (!EXEWB_opcode(3) & (!EXEWB_opcode(1) & (!EXEWB_opcode(0) & !EXEWB_opcode(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_opcode(3),
	datab => EXEWB_opcode(1),
	datac => EXEWB_opcode(0),
	datad => EXEWB_opcode(2),
	combout => \Equal11~0_combout\);

-- Location: LCCOMB_X110_Y31_N28
\EXEWB_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_valid~0_combout\ = (\IDEXE_valid~q\ & !\div_state.DIV_RUN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IDEXE_valid~q\,
	datad => \div_state.DIV_RUN~q\,
	combout => \EXEWB_valid~0_combout\);

-- Location: FF_X110_Y31_N29
EXEWB_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_valid~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \EXEWB_valid~q\);

-- Location: LCCOMB_X110_Y31_N8
\EXEWB_rs_id~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_rs_id~1_combout\ = (IDEXE_rs_id(1) & !\div_state.DIV_RUN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IDEXE_rs_id(1),
	datad => \div_state.DIV_RUN~q\,
	combout => \EXEWB_rs_id~1_combout\);

-- Location: FF_X110_Y31_N9
\EXEWB_rs_id[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_rs_id~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_rs_id(1));

-- Location: LCCOMB_X110_Y31_N14
\EXEWB_rs_id~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_rs_id~0_combout\ = (IDEXE_rs_id(0) & !\div_state.DIV_RUN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IDEXE_rs_id(0),
	datad => \div_state.DIV_RUN~q\,
	combout => \EXEWB_rs_id~0_combout\);

-- Location: FF_X110_Y31_N15
\EXEWB_rs_id[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_rs_id~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_rs_id(0));

-- Location: LCCOMB_X110_Y31_N22
\fwd_rs_wb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rs_wb~0_combout\ = (IFID_rs_id(1) & (EXEWB_rs_id(1) & (EXEWB_rs_id(0) $ (!IFID_rs_id(0))))) # (!IFID_rs_id(1) & (!EXEWB_rs_id(1) & (EXEWB_rs_id(0) $ (!IFID_rs_id(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(1),
	datab => EXEWB_rs_id(1),
	datac => EXEWB_rs_id(0),
	datad => IFID_rs_id(0),
	combout => \fwd_rs_wb~0_combout\);

-- Location: LCCOMB_X107_Y31_N16
\reads_rs_v~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reads_rs_v~0_combout\ = (IFID_opcode(1) & (IFID_opcode(3) $ (((IFID_opcode(2)))))) # (!IFID_opcode(1) & (IFID_opcode(3) & ((IFID_opcode(0)) # (IFID_opcode(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(1),
	datac => IFID_opcode(0),
	datad => IFID_opcode(2),
	combout => \reads_rs_v~0_combout\);

-- Location: LCCOMB_X110_Y31_N0
\fwd_rs_wb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rs_wb~1_combout\ = (!\Equal11~0_combout\ & (\EXEWB_valid~q\ & (\fwd_rs_wb~0_combout\ & \reads_rs_v~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => \EXEWB_valid~q\,
	datac => \fwd_rs_wb~0_combout\,
	datad => \reads_rs_v~0_combout\,
	combout => \fwd_rs_wb~1_combout\);

-- Location: LCCOMB_X111_Y31_N0
\fwd_rs_exe~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rs_exe~0_combout\ = (IFID_rs_id(0) & (IDEXE_rs_id(0) & (IFID_rs_id(1) $ (!IDEXE_rs_id(1))))) # (!IFID_rs_id(0) & (!IDEXE_rs_id(0) & (IFID_rs_id(1) $ (!IDEXE_rs_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(0),
	datab => IFID_rs_id(1),
	datac => IDEXE_rs_id(1),
	datad => IDEXE_rs_id(0),
	combout => \fwd_rs_exe~0_combout\);

-- Location: LCCOMB_X111_Y31_N6
\fwd_rs_exe~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rs_exe~1_combout\ = (\IDEXE_valid~q\ & !\Equal8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IDEXE_valid~q\,
	datad => \Equal8~0_combout\,
	combout => \fwd_rs_exe~1_combout\);

-- Location: LCCOMB_X114_Y32_N16
\Rs_val_fwd[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[0]~0_combout\ = (!\fwd_rs_wb~1_combout\ & (((!\fwd_rs_exe~1_combout\) # (!\fwd_rs_exe~0_combout\)) # (!\reads_rs_v~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rs_wb~1_combout\,
	datab => \reads_rs_v~0_combout\,
	datac => \fwd_rs_exe~0_combout\,
	datad => \fwd_rs_exe~1_combout\,
	combout => \Rs_val_fwd[0]~0_combout\);

-- Location: LCCOMB_X110_Y31_N4
\Mux60~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux60~1_combout\ = (!\Equal11~0_combout\ & (EXEWB_rs_id(1) & (!EXEWB_rs_id(0) & \EXEWB_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => EXEWB_rs_id(1),
	datac => EXEWB_rs_id(0),
	datad => \EXEWB_valid~q\,
	combout => \Mux60~1_combout\);

-- Location: FF_X112_Y29_N13
\R2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(7),
	sload => VCC,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(7));

-- Location: LCCOMB_X111_Y31_N14
\R0[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \R0[3]~0_combout\ = (!EXEWB_rs_id(0) & (\EXEWB_valid~q\ & (!\Equal11~0_combout\ & !EXEWB_rs_id(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_rs_id(0),
	datab => \EXEWB_valid~q\,
	datac => \Equal11~0_combout\,
	datad => EXEWB_rs_id(1),
	combout => \R0[3]~0_combout\);

-- Location: FF_X112_Y29_N19
\R0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(7),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(7));

-- Location: LCCOMB_X112_Y29_N0
\Rs_val_fwd[7]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[7]~6_combout\ = (IFID_rs_id(1) & ((R2(7)) # ((IFID_rs_id(0))))) # (!IFID_rs_id(1) & (((R0(7) & !IFID_rs_id(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R2(7),
	datab => R0(7),
	datac => IFID_rs_id(1),
	datad => IFID_rs_id(0),
	combout => \Rs_val_fwd[7]~6_combout\);

-- Location: LCCOMB_X111_Y29_N8
\R1[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \R1[7]~feeder_combout\ = EXEWB_result(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => EXEWB_result(7),
	combout => \R1[7]~feeder_combout\);

-- Location: LCCOMB_X110_Y31_N18
\Mux60~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux60~0_combout\ = (!\Equal11~0_combout\ & (!EXEWB_rs_id(1) & (EXEWB_rs_id(0) & \EXEWB_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => EXEWB_rs_id(1),
	datac => EXEWB_rs_id(0),
	datad => \EXEWB_valid~q\,
	combout => \Mux60~0_combout\);

-- Location: FF_X111_Y29_N9
\R1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \R1[7]~feeder_combout\,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(7));

-- Location: LCCOMB_X112_Y29_N22
\Rs_val_fwd[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[7]~7_combout\ = (\Rs_val_fwd[7]~6_combout\ & ((R3(7)) # ((!IFID_rs_id(0))))) # (!\Rs_val_fwd[7]~6_combout\ & (((IFID_rs_id(0) & R1(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(7),
	datab => \Rs_val_fwd[7]~6_combout\,
	datac => IFID_rs_id(0),
	datad => R1(7),
	combout => \Rs_val_fwd[7]~7_combout\);

-- Location: LCCOMB_X114_Y32_N22
fwd_rs_wb : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rs_wb~combout\ = (\fwd_rs_wb~1_combout\ & (((!\fwd_rs_exe~1_combout\) # (!\reads_rs_v~0_combout\)) # (!\fwd_rs_exe~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rs_exe~0_combout\,
	datab => \reads_rs_v~0_combout\,
	datac => \fwd_rs_wb~1_combout\,
	datad => \fwd_rs_exe~1_combout\,
	combout => \fwd_rs_wb~combout\);

-- Location: LCCOMB_X113_Y32_N20
\Rs_val_fwd[7]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[7]~5_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(7))) # (!\fwd_rs_wb~combout\ & ((\Mux32~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(7),
	datab => \fwd_rs_wb~combout\,
	datac => \Rs_val_fwd[0]~0_combout\,
	datad => \Mux32~3_combout\,
	combout => \Rs_val_fwd[7]~5_combout\);

-- Location: LCCOMB_X113_Y32_N18
\Rs_val_fwd[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[7]~8_combout\ = (\Rs_val_fwd[7]~5_combout\) # ((\Rs_val_fwd[0]~0_combout\ & \Rs_val_fwd[7]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datac => \Rs_val_fwd[7]~7_combout\,
	datad => \Rs_val_fwd[7]~5_combout\,
	combout => \Rs_val_fwd[7]~8_combout\);

-- Location: FF_X110_Y33_N19
\IDEXE_rs_val[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[7]~8_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(7));

-- Location: LCCOMB_X113_Y33_N30
\Mux37~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~1_combout\ = (!IDEXE_opcode(1) & ((IDEXE_opcode(0)) # (IDEXE_opcode(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(1),
	datac => IDEXE_opcode(0),
	datad => IDEXE_opcode(2),
	combout => \Mux37~1_combout\);

-- Location: LCCOMB_X113_Y33_N20
\Mux37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = ((IDEXE_opcode(1) & !IDEXE_opcode(0))) # (!IDEXE_opcode(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(1),
	datac => IDEXE_opcode(0),
	datad => IDEXE_opcode(2),
	combout => \Mux37~0_combout\);

-- Location: LCCOMB_X113_Y33_N24
\Mux32~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux32~0_combout\ = (\Mux37~1_combout\ & ((IDEXE_rs_val(7) & (IDEXE_rt_val(7) & !\Mux37~0_combout\)) # (!IDEXE_rs_val(7) & (!IDEXE_rt_val(7) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rs_val(7),
	datab => IDEXE_rt_val(7),
	datac => \Mux37~1_combout\,
	datad => \Mux37~0_combout\,
	combout => \Mux32~0_combout\);

-- Location: LCCOMB_X113_Y33_N14
\Mux32~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux32~1_combout\ = (\Mux39~5_combout\ & (((\Mux32~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux32~0_combout\ & ((IDEXE_data(7)))) # (!\Mux32~0_combout\ & (IDEXE_rt_val(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux39~5_combout\,
	datab => IDEXE_rt_val(7),
	datac => IDEXE_data(7),
	datad => \Mux32~0_combout\,
	combout => \Mux32~1_combout\);

-- Location: LCCOMB_X112_Y33_N24
\Add0~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~33_combout\ = IDEXE_rt_val(7) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_rt_val(7),
	combout => \Add0~33_combout\);

-- Location: LCCOMB_X112_Y33_N26
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IDEXE_opcode(3),
	datad => IDEXE_rs_val(7),
	combout => \Add0~32_combout\);

-- Location: FF_X112_Y32_N17
\div_dividend[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[6]~12_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(6));

-- Location: FF_X113_Y32_N19
\div_dividend[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[7]~8_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(7));

-- Location: LCCOMB_X113_Y32_N8
\Mux72~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux72~2_combout\ = (div_count(0) & ((div_dividend(6)) # ((div_count(1))))) # (!div_count(0) & (((div_dividend(7) & !div_count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_dividend(6),
	datab => div_dividend(7),
	datac => div_count(0),
	datad => div_count(1),
	combout => \Mux72~2_combout\);

-- Location: LCCOMB_X109_Y32_N28
\Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (div_count(1) & (div_count(0) & (!\LessThan1~14_combout\ & !div_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(0),
	datac => \LessThan1~14_combout\,
	datad => div_count(2),
	combout => \Decoder0~4_combout\);

-- Location: LCCOMB_X109_Y32_N10
\div_quot[4]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[4]~29_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~4_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \process_4~0_combout\,
	datac => IFID_opcode(3),
	datad => \Decoder0~4_combout\,
	combout => \div_quot[4]~29_combout\);

-- Location: FF_X110_Y33_N31
\IDEXE_rt_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[1]~6_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(1));

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X114_Y40_N5
\IFID_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(1));

-- Location: FF_X110_Y32_N9
\IDEXE_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(1),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(1));

-- Location: FF_X111_Y29_N13
\R1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(1),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(1));

-- Location: LCCOMB_X110_Y31_N6
\Mux60~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux60~2_combout\ = (!\Equal11~0_combout\ & (EXEWB_rs_id(1) & (EXEWB_rs_id(0) & \EXEWB_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => EXEWB_rs_id(1),
	datac => EXEWB_rs_id(0),
	datad => \EXEWB_valid~q\,
	combout => \Mux60~2_combout\);

-- Location: FF_X111_Y29_N27
\R3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(1),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(1));

-- Location: FF_X112_Y29_N11
\R0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(1),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(1));

-- Location: FF_X112_Y29_N17
\R2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(1),
	sload => VCC,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(1));

-- Location: LCCOMB_X112_Y29_N2
\Rs_val_fwd[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[1]~30_combout\ = (IFID_rs_id(0) & (((IFID_rs_id(1))))) # (!IFID_rs_id(0) & ((IFID_rs_id(1) & ((R2(1)))) # (!IFID_rs_id(1) & (R0(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(0),
	datab => R0(1),
	datac => IFID_rs_id(1),
	datad => R2(1),
	combout => \Rs_val_fwd[1]~30_combout\);

-- Location: LCCOMB_X111_Y29_N30
\Rs_val_fwd[1]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[1]~31_combout\ = (IFID_rs_id(0) & ((\Rs_val_fwd[1]~30_combout\ & ((R3(1)))) # (!\Rs_val_fwd[1]~30_combout\ & (R1(1))))) # (!IFID_rs_id(0) & (((\Rs_val_fwd[1]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(0),
	datab => R1(1),
	datac => R3(1),
	datad => \Rs_val_fwd[1]~30_combout\,
	combout => \Rs_val_fwd[1]~31_combout\);

-- Location: LCCOMB_X107_Y32_N20
\Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (div_count(1) & (div_count(2) & (!div_count(0) & !\LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \LessThan1~14_combout\,
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X107_Y32_N22
\div_quot[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[1]~26_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~1_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~1_combout\,
	combout => \div_quot[1]~26_combout\);

-- Location: LCCOMB_X107_Y32_N12
\div_quot[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[1]~18_combout\ = (\div_quot[1]~26_combout\ & (div_quot(1))) # (!\div_quot[1]~26_combout\ & ((\div_quot~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_quot[1]~26_combout\,
	datac => div_quot(1),
	datad => \div_quot~16_combout\,
	combout => \div_quot[1]~18_combout\);

-- Location: FF_X107_Y32_N13
\div_quot[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[1]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(1));

-- Location: LCCOMB_X110_Y32_N10
\Mux38~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~4_combout\ = (\Mux38~2_combout\) # ((div_quot(1) & \Mux38~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_quot(1),
	datac => \Mux38~3_combout\,
	datad => \Mux38~2_combout\,
	combout => \Mux38~4_combout\);

-- Location: LCCOMB_X113_Y32_N24
\Rs_val_fwd[1]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[1]~29_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(1))) # (!\fwd_rs_wb~combout\ & ((\Mux38~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datab => EXEWB_result(1),
	datac => \fwd_rs_wb~combout\,
	datad => \Mux38~4_combout\,
	combout => \Rs_val_fwd[1]~29_combout\);

-- Location: LCCOMB_X112_Y32_N10
\Rs_val_fwd[1]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[1]~32_combout\ = (\Rs_val_fwd[1]~29_combout\) # ((\Rs_val_fwd[0]~0_combout\ & \Rs_val_fwd[1]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rs_val_fwd[0]~0_combout\,
	datac => \Rs_val_fwd[1]~31_combout\,
	datad => \Rs_val_fwd[1]~29_combout\,
	combout => \Rs_val_fwd[1]~32_combout\);

-- Location: FF_X111_Y33_N3
\IDEXE_rs_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[1]~32_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(1));

-- Location: LCCOMB_X110_Y32_N6
\Mux38~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~0_combout\ = (\Mux37~1_combout\ & ((IDEXE_rs_val(1) & (IDEXE_rt_val(1) & !\Mux37~0_combout\)) # (!IDEXE_rs_val(1) & (!IDEXE_rt_val(1) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rs_val(1),
	datab => IDEXE_rt_val(1),
	datac => \Mux37~1_combout\,
	datad => \Mux37~0_combout\,
	combout => \Mux38~0_combout\);

-- Location: LCCOMB_X110_Y32_N8
\Mux38~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~1_combout\ = (\Mux39~5_combout\ & (((\Mux38~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux38~0_combout\ & ((IDEXE_data(1)))) # (!\Mux38~0_combout\ & (IDEXE_rt_val(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux39~5_combout\,
	datab => IDEXE_rt_val(1),
	datac => IDEXE_data(1),
	datad => \Mux38~0_combout\,
	combout => \Mux38~1_combout\);

-- Location: LCCOMB_X111_Y33_N6
\Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = IDEXE_rt_val(1) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_rt_val(1),
	combout => \Add0~9_combout\);

-- Location: LCCOMB_X111_Y33_N4
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datad => IDEXE_rs_val(1),
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X107_Y32_N2
\Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (div_count(1) & (div_count(2) & (div_count(0) & !\LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \LessThan1~14_combout\,
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X107_Y32_N28
\div_quot[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[0]~25_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~0_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~0_combout\,
	combout => \div_quot[0]~25_combout\);

-- Location: LCCOMB_X107_Y32_N26
\div_quot[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[0]~17_combout\ = (\div_quot[0]~25_combout\ & (div_quot(0))) # (!\div_quot[0]~25_combout\ & ((\div_quot~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot[0]~25_combout\,
	datac => div_quot(0),
	datad => \div_quot~16_combout\,
	combout => \div_quot[0]~17_combout\);

-- Location: FF_X107_Y32_N27
\div_quot[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(0));

-- Location: FF_X112_Y31_N17
\R3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(0),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(0));

-- Location: LCCOMB_X114_Y31_N26
\R2[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \R2[0]~feeder_combout\ = EXEWB_result(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => EXEWB_result(0),
	combout => \R2[0]~feeder_combout\);

-- Location: FF_X114_Y31_N27
\R2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \R2[0]~feeder_combout\,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(0));

-- Location: FF_X111_Y31_N17
\R0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(0),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(0));

-- Location: LCCOMB_X114_Y31_N8
\R1[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \R1[0]~feeder_combout\ = EXEWB_result(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => EXEWB_result(0),
	combout => \R1[0]~feeder_combout\);

-- Location: FF_X114_Y31_N9
\R1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \R1[0]~feeder_combout\,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(0));

-- Location: LCCOMB_X113_Y31_N0
\Rs_val_fwd[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[0]~1_combout\ = (IFID_rs_id(1) & (((IFID_rs_id(0))))) # (!IFID_rs_id(1) & ((IFID_rs_id(0) & ((R1(0)))) # (!IFID_rs_id(0) & (R0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(0),
	datab => R1(0),
	datac => IFID_rs_id(1),
	datad => IFID_rs_id(0),
	combout => \Rs_val_fwd[0]~1_combout\);

-- Location: LCCOMB_X113_Y31_N30
\Rs_val_fwd[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[0]~2_combout\ = (IFID_rs_id(1) & ((\Rs_val_fwd[0]~1_combout\ & (R3(0))) # (!\Rs_val_fwd[0]~1_combout\ & ((R2(0)))))) # (!IFID_rs_id(1) & (((\Rs_val_fwd[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(0),
	datab => R2(0),
	datac => IFID_rs_id(1),
	datad => \Rs_val_fwd[0]~1_combout\,
	combout => \Rs_val_fwd[0]~2_combout\);

-- Location: LCCOMB_X114_Y32_N24
\Rs_val_fwd[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[0]~3_combout\ = (\Rs_val_fwd[0]~0_combout\ & (\Rs_val_fwd[0]~2_combout\)) # (!\Rs_val_fwd[0]~0_combout\ & (((EXEWB_result(0) & \fwd_rs_wb~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~2_combout\,
	datab => EXEWB_result(0),
	datac => \fwd_rs_wb~combout\,
	datad => \Rs_val_fwd[0]~0_combout\,
	combout => \Rs_val_fwd[0]~3_combout\);

-- Location: LCCOMB_X112_Y32_N14
\Rs_val_fwd[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[0]~4_combout\ = (\Rs_val_fwd[0]~3_combout\) # ((!\fwd_rs_wb~combout\ & (!\Rs_val_fwd[0]~0_combout\ & \Mux39~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rs_wb~combout\,
	datab => \Rs_val_fwd[0]~0_combout\,
	datac => \Mux39~6_combout\,
	datad => \Rs_val_fwd[0]~3_combout\,
	combout => \Rs_val_fwd[0]~4_combout\);

-- Location: FF_X110_Y33_N21
\IDEXE_rs_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[0]~4_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(0));

-- Location: LCCOMB_X111_Y33_N2
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datad => IDEXE_rs_val(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X111_Y33_N12
\Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~3_cout\ = CARRY(!IDEXE_opcode(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datad => VCC,
	cout => \Add0~3_cout\);

-- Location: LCCOMB_X111_Y33_N14
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\Add0~1_combout\ & ((\Add0~0_combout\ & (!\Add0~3_cout\)) # (!\Add0~0_combout\ & ((\Add0~3_cout\) # (GND))))) # (!\Add0~1_combout\ & ((\Add0~0_combout\ & (\Add0~3_cout\ & VCC)) # (!\Add0~0_combout\ & (!\Add0~3_cout\))))
-- \Add0~5\ = CARRY((\Add0~1_combout\ & ((!\Add0~3_cout\) # (!\Add0~0_combout\))) # (!\Add0~1_combout\ & (!\Add0~0_combout\ & !\Add0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \Add0~0_combout\,
	datad => VCC,
	cin => \Add0~3_cout\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X109_Y33_N16
\Mux39~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~4_combout\ = (IDEXE_opcode(0) & (div_quot(0))) # (!IDEXE_opcode(0) & ((\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(0),
	datac => div_quot(0),
	datad => \Add0~4_combout\,
	combout => \Mux39~4_combout\);

-- Location: LCCOMB_X109_Y33_N28
\Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (IDEXE_rs_val(0)) # ((IDEXE_rt_val(0)) # (!IDEXE_opcode(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_rs_val(0),
	datac => IDEXE_opcode(0),
	datad => IDEXE_rt_val(0),
	combout => \Add0~7_combout\);

-- Location: LCCOMB_X109_Y33_N4
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (IDEXE_opcode(0) & (((\Add0~4_combout\)))) # (!IDEXE_opcode(0) & (IDEXE_rt_val(0) & ((IDEXE_rs_val(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(0),
	datab => IDEXE_opcode(0),
	datac => \Add0~4_combout\,
	datad => IDEXE_rs_val(0),
	combout => \Add0~6_combout\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y40_N6
\IFID_data[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_data[0]~feeder_combout\ = \SW[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[0]~input_o\,
	combout => \IFID_data[0]~feeder_combout\);

-- Location: FF_X114_Y40_N7
\IFID_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_data[0]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(0));

-- Location: FF_X109_Y33_N15
\IDEXE_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(0),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(0));

-- Location: LCCOMB_X109_Y33_N14
\Mux39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = (IDEXE_opcode(0) & (IDEXE_data(0))) # (!IDEXE_opcode(0) & ((IDEXE_rt_val(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(0),
	datac => IDEXE_data(0),
	datad => IDEXE_rt_val(0),
	combout => \Mux39~0_combout\);

-- Location: LCCOMB_X110_Y33_N24
\Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = IDEXE_rt_val(6) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(6),
	datab => IDEXE_opcode(3),
	datad => IDEXE_opcode(2),
	combout => \Add0~13_combout\);

-- Location: LCCOMB_X109_Y32_N14
\Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~3_combout\ = (div_count(1) & (!div_count(0) & (!\LessThan1~14_combout\ & !div_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(0),
	datac => \LessThan1~14_combout\,
	datad => div_count(2),
	combout => \Decoder0~3_combout\);

-- Location: LCCOMB_X110_Y32_N28
\div_quot[5]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[5]~28_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~3_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~3_combout\,
	combout => \div_quot[5]~28_combout\);

-- Location: LCCOMB_X111_Y32_N28
\div_quot[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[5]~20_combout\ = (\div_quot[5]~28_combout\ & ((div_quot(5)))) # (!\div_quot[5]~28_combout\ & (\div_quot~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot~16_combout\,
	datac => div_quot(5),
	datad => \div_quot[5]~28_combout\,
	combout => \div_quot[5]~20_combout\);

-- Location: FF_X111_Y32_N29
\div_quot[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[5]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(5));

-- Location: FF_X111_Y29_N19
\R3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(5),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(5));

-- Location: FF_X112_Y29_N21
\R2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(5),
	sload => VCC,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(5));

-- Location: FF_X112_Y29_N31
\R0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(5),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(5));

-- Location: LCCOMB_X111_Y29_N22
\Rs_val_fwd[5]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[5]~14_combout\ = (IFID_rs_id(0) & (((IFID_rs_id(1))))) # (!IFID_rs_id(0) & ((IFID_rs_id(1) & (R2(5))) # (!IFID_rs_id(1) & ((R0(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R2(5),
	datab => R0(5),
	datac => IFID_rs_id(0),
	datad => IFID_rs_id(1),
	combout => \Rs_val_fwd[5]~14_combout\);

-- Location: FF_X111_Y29_N17
\R1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(5),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(5));

-- Location: LCCOMB_X111_Y29_N4
\Rs_val_fwd[5]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[5]~15_combout\ = (IFID_rs_id(0) & ((\Rs_val_fwd[5]~14_combout\ & (R3(5))) # (!\Rs_val_fwd[5]~14_combout\ & ((R1(5)))))) # (!IFID_rs_id(0) & (((\Rs_val_fwd[5]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(0),
	datab => R3(5),
	datac => \Rs_val_fwd[5]~14_combout\,
	datad => R1(5),
	combout => \Rs_val_fwd[5]~15_combout\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: FF_X114_Y40_N13
\IFID_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(5));

-- Location: FF_X112_Y33_N29
\IDEXE_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(5),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(5));

-- Location: LCCOMB_X112_Y33_N18
\Mux34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux34~0_combout\ = (\Mux37~0_combout\ & (!IDEXE_rt_val(5) & (\Mux37~1_combout\ & !IDEXE_rs_val(5)))) # (!\Mux37~0_combout\ & (((IDEXE_rt_val(5) & IDEXE_rs_val(5))) # (!\Mux37~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux37~0_combout\,
	datab => IDEXE_rt_val(5),
	datac => \Mux37~1_combout\,
	datad => IDEXE_rs_val(5),
	combout => \Mux34~0_combout\);

-- Location: LCCOMB_X112_Y33_N28
\Mux34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux34~1_combout\ = (\Mux39~5_combout\ & (((\Mux34~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux34~0_combout\ & ((IDEXE_data(5)))) # (!\Mux34~0_combout\ & (IDEXE_rt_val(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(5),
	datab => \Mux39~5_combout\,
	datac => IDEXE_data(5),
	datad => \Mux34~0_combout\,
	combout => \Mux34~1_combout\);

-- Location: LCCOMB_X111_Y32_N2
\Mux34~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux34~2_combout\ = (\Mux37~2_combout\ & (((\Add0~28_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux34~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux37~2_combout\,
	datab => IDEXE_opcode(3),
	datac => \Add0~28_combout\,
	datad => \Mux34~1_combout\,
	combout => \Mux34~2_combout\);

-- Location: LCCOMB_X111_Y32_N16
\Mux34~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux34~3_combout\ = (\Mux34~2_combout\) # ((div_quot(5) & \Mux38~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => div_quot(5),
	datac => \Mux38~3_combout\,
	datad => \Mux34~2_combout\,
	combout => \Mux34~3_combout\);

-- Location: LCCOMB_X111_Y32_N14
\Rs_val_fwd[5]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[5]~13_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(5))) # (!\fwd_rs_wb~combout\ & ((\Mux34~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datab => EXEWB_result(5),
	datac => \fwd_rs_wb~combout\,
	datad => \Mux34~3_combout\,
	combout => \Rs_val_fwd[5]~13_combout\);

-- Location: LCCOMB_X112_Y32_N6
\Rs_val_fwd[5]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[5]~16_combout\ = (\Rs_val_fwd[5]~13_combout\) # ((\Rs_val_fwd[5]~15_combout\ & \Rs_val_fwd[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[5]~15_combout\,
	datab => \Rs_val_fwd[0]~0_combout\,
	datad => \Rs_val_fwd[5]~13_combout\,
	combout => \Rs_val_fwd[5]~16_combout\);

-- Location: FF_X111_Y33_N11
\IDEXE_rs_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[5]~16_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(5));

-- Location: LCCOMB_X111_Y33_N0
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datad => IDEXE_rs_val(5),
	combout => \Add0~14_combout\);

-- Location: FF_X110_Y33_N27
\IDEXE_rs_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[4]~20_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(4));

-- Location: LCCOMB_X111_Y33_N30
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IDEXE_opcode(3),
	datad => IDEXE_rs_val(4),
	combout => \Add0~16_combout\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X114_Y40_N22
\IFID_data[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_data[4]~feeder_combout\ = \SW[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[4]~input_o\,
	combout => \IFID_data[4]~feeder_combout\);

-- Location: FF_X114_Y40_N23
\IFID_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_data[4]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(4));

-- Location: FF_X110_Y33_N1
\IDEXE_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(4),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(4));

-- Location: LCCOMB_X113_Y33_N22
\Mux35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = (\Mux37~1_combout\ & ((IDEXE_rt_val(4) & (IDEXE_rs_val(4) & !\Mux37~0_combout\)) # (!IDEXE_rt_val(4) & (!IDEXE_rs_val(4) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(4),
	datab => IDEXE_rs_val(4),
	datac => \Mux37~1_combout\,
	datad => \Mux37~0_combout\,
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X110_Y33_N0
\Mux35~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~1_combout\ = (\Mux39~5_combout\ & (((\Mux35~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux35~0_combout\ & ((IDEXE_data(4)))) # (!\Mux35~0_combout\ & (IDEXE_rt_val(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(4),
	datab => \Mux39~5_combout\,
	datac => IDEXE_data(4),
	datad => \Mux35~0_combout\,
	combout => \Mux35~1_combout\);

-- Location: FF_X114_Y31_N19
\R1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(3),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(3));

-- Location: FF_X114_Y31_N29
\R2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(3),
	sload => VCC,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(3));

-- Location: FF_X113_Y31_N9
\R0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(3),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(3));

-- Location: LCCOMB_X112_Y31_N14
\Rs_val_fwd[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[3]~22_combout\ = (IFID_rs_id(0) & (((IFID_rs_id(1))))) # (!IFID_rs_id(0) & ((IFID_rs_id(1) & (R2(3))) # (!IFID_rs_id(1) & ((R0(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R2(3),
	datab => IFID_rs_id(0),
	datac => R0(3),
	datad => IFID_rs_id(1),
	combout => \Rs_val_fwd[3]~22_combout\);

-- Location: LCCOMB_X112_Y31_N18
\Rs_val_fwd[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[3]~23_combout\ = (\Rs_val_fwd[3]~22_combout\ & (((R3(3)) # (!IFID_rs_id(0))))) # (!\Rs_val_fwd[3]~22_combout\ & (R1(3) & ((IFID_rs_id(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(3),
	datab => \Rs_val_fwd[3]~22_combout\,
	datac => R3(3),
	datad => IFID_rs_id(0),
	combout => \Rs_val_fwd[3]~23_combout\);

-- Location: LCCOMB_X107_Y32_N24
\Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (!div_count(1) & (div_count(2) & (!div_count(0) & !\LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \LessThan1~14_combout\,
	combout => \Decoder0~6_combout\);

-- Location: LCCOMB_X107_Y32_N14
\div_quot[3]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[3]~31_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~6_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~6_combout\,
	combout => \div_quot[3]~31_combout\);

-- Location: LCCOMB_X112_Y32_N12
\div_quot[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[3]~23_combout\ = (\div_quot[3]~31_combout\ & ((div_quot(3)))) # (!\div_quot[3]~31_combout\ & (\div_quot~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot~16_combout\,
	datac => div_quot(3),
	datad => \div_quot[3]~31_combout\,
	combout => \div_quot[3]~23_combout\);

-- Location: FF_X112_Y32_N13
\div_quot[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[3]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(3));

-- Location: LCCOMB_X112_Y31_N10
\Rt_val_fwd[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[3]~23_combout\ = (IFID_rt_id(0) & ((R1(3)) # ((IFID_rt_id(1))))) # (!IFID_rt_id(0) & (((R0(3) & !IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(3),
	datab => IFID_rt_id(0),
	datac => R0(3),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[3]~23_combout\);

-- Location: LCCOMB_X112_Y31_N20
\Rt_val_fwd[3]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[3]~24_combout\ = (\Rt_val_fwd[3]~23_combout\ & ((R3(3)) # ((!IFID_rt_id(1))))) # (!\Rt_val_fwd[3]~23_combout\ & (((R2(3) & IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[3]~23_combout\,
	datab => R3(3),
	datac => R2(3),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[3]~24_combout\);

-- Location: LCCOMB_X111_Y31_N4
\fwd_rt_wb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rt_wb~0_combout\ = (EXEWB_rs_id(0) & (IFID_rt_id(0) & (IFID_rt_id(1) $ (!EXEWB_rs_id(1))))) # (!EXEWB_rs_id(0) & (!IFID_rt_id(0) & (IFID_rt_id(1) $ (!EXEWB_rs_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_rs_id(0),
	datab => IFID_rt_id(1),
	datac => IFID_rt_id(0),
	datad => EXEWB_rs_id(1),
	combout => \fwd_rt_wb~0_combout\);

-- Location: LCCOMB_X111_Y31_N2
\fwd_rt_wb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fwd_rt_wb~1_combout\ = (!\Equal11~0_combout\ & (\reads_rt_v~0_combout\ & (\fwd_rt_wb~0_combout\ & \EXEWB_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => \reads_rt_v~0_combout\,
	datac => \fwd_rt_wb~0_combout\,
	datad => \EXEWB_valid~q\,
	combout => \fwd_rt_wb~1_combout\);

-- Location: LCCOMB_X111_Y31_N24
\Rt_val_fwd[3]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[3]~25_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & ((EXEWB_result(3)))) # (!\fwd_rt_wb~1_combout\ & (\Rt_val_fwd[3]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[3]~24_combout\,
	datab => EXEWB_result(3),
	datac => \fwd_rt_exe~combout\,
	datad => \fwd_rt_wb~1_combout\,
	combout => \Rt_val_fwd[3]~25_combout\);

-- Location: LCCOMB_X112_Y32_N8
\Rt_val_fwd[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[3]~26_combout\ = (\Rt_val_fwd[3]~25_combout\) # ((\fwd_rt_exe~combout\ & \Mux36~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[3]~25_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \Mux36~3_combout\,
	combout => \Rt_val_fwd[3]~26_combout\);

-- Location: FF_X110_Y33_N23
\IDEXE_rt_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[3]~26_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(3));

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LCCOMB_X114_Y40_N26
\IFID_data[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_data[3]~feeder_combout\ = \SW[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[3]~input_o\,
	combout => \IFID_data[3]~feeder_combout\);

-- Location: FF_X114_Y40_N27
\IFID_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IFID_data[3]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(3));

-- Location: FF_X110_Y32_N5
\IDEXE_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(3),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(3));

-- Location: LCCOMB_X110_Y32_N18
\Mux36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux36~0_combout\ = (\Mux37~1_combout\ & ((IDEXE_rt_val(3) & (IDEXE_rs_val(3) & !\Mux37~0_combout\)) # (!IDEXE_rt_val(3) & (!IDEXE_rs_val(3) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux37~1_combout\,
	datab => IDEXE_rt_val(3),
	datac => IDEXE_rs_val(3),
	datad => \Mux37~0_combout\,
	combout => \Mux36~0_combout\);

-- Location: LCCOMB_X110_Y32_N4
\Mux36~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux36~1_combout\ = (\Mux39~5_combout\ & (((\Mux36~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux36~0_combout\ & ((IDEXE_data(3)))) # (!\Mux36~0_combout\ & (IDEXE_rt_val(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux39~5_combout\,
	datab => IDEXE_rt_val(3),
	datac => IDEXE_data(3),
	datad => \Mux36~0_combout\,
	combout => \Mux36~1_combout\);

-- Location: LCCOMB_X111_Y33_N10
\Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = IDEXE_rt_val(3) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(2),
	datab => IDEXE_opcode(3),
	datad => IDEXE_rt_val(3),
	combout => \Add0~19_combout\);

-- Location: LCCOMB_X109_Y32_N30
\Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (!div_count(1) & (div_count(0) & (!\LessThan1~14_combout\ & div_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(0),
	datac => \LessThan1~14_combout\,
	datad => div_count(2),
	combout => \Decoder0~5_combout\);

-- Location: LCCOMB_X110_Y32_N22
\div_quot[2]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[2]~30_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~5_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~5_combout\,
	combout => \div_quot[2]~30_combout\);

-- Location: LCCOMB_X111_Y32_N22
\div_quot[2]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[2]~22_combout\ = (\div_quot[2]~30_combout\ & ((div_quot(2)))) # (!\div_quot[2]~30_combout\ & (\div_quot~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot~16_combout\,
	datac => div_quot(2),
	datad => \div_quot[2]~30_combout\,
	combout => \div_quot[2]~22_combout\);

-- Location: FF_X111_Y32_N23
\div_quot[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[2]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(2));

-- Location: LCCOMB_X111_Y32_N8
\Mux37~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~6_combout\ = (\Mux37~5_combout\) # ((div_quot(2) & \Mux38~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_quot(2),
	datac => \Mux38~3_combout\,
	datad => \Mux37~5_combout\,
	combout => \Mux37~6_combout\);

-- Location: FF_X112_Y29_N27
\R0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(2),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(2));

-- Location: FF_X112_Y29_N25
\R2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(2),
	sload => VCC,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(2));

-- Location: LCCOMB_X112_Y29_N14
\Rt_val_fwd[2]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[2]~19_combout\ = (IFID_rt_id(0) & (((IFID_rt_id(1))))) # (!IFID_rt_id(0) & ((IFID_rt_id(1) & ((R2(2)))) # (!IFID_rt_id(1) & (R0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(2),
	datab => R2(2),
	datac => IFID_rt_id(0),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[2]~19_combout\);

-- Location: FF_X112_Y31_N3
\R1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(2),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(2));

-- Location: LCCOMB_X112_Y31_N12
\Rt_val_fwd[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[2]~20_combout\ = (\Rt_val_fwd[2]~19_combout\ & (((R3(2))) # (!IFID_rt_id(0)))) # (!\Rt_val_fwd[2]~19_combout\ & (IFID_rt_id(0) & ((R1(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[2]~19_combout\,
	datab => IFID_rt_id(0),
	datac => R3(2),
	datad => R1(2),
	combout => \Rt_val_fwd[2]~20_combout\);

-- Location: LCCOMB_X111_Y32_N6
\Rt_val_fwd[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[2]~21_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(2))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[2]~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_wb~1_combout\,
	datab => EXEWB_result(2),
	datac => \fwd_rt_exe~combout\,
	datad => \Rt_val_fwd[2]~20_combout\,
	combout => \Rt_val_fwd[2]~21_combout\);

-- Location: LCCOMB_X111_Y32_N18
\Rt_val_fwd[2]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[2]~22_combout\ = (\Rt_val_fwd[2]~21_combout\) # ((\fwd_rt_exe~combout\ & \Mux37~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fwd_rt_exe~combout\,
	datac => \Mux37~6_combout\,
	datad => \Rt_val_fwd[2]~21_combout\,
	combout => \Rt_val_fwd[2]~22_combout\);

-- Location: FF_X110_Y33_N11
\IDEXE_rt_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[2]~22_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(2));

-- Location: LCCOMB_X110_Y33_N22
\Add0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = IDEXE_rt_val(2) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(2),
	datab => IDEXE_opcode(3),
	datad => IDEXE_opcode(2),
	combout => \Add0~21_combout\);

-- Location: LCCOMB_X111_Y33_N16
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = ((\Add0~9_combout\ $ (\Add0~8_combout\ $ (\Add0~5\)))) # (GND)
-- \Add0~11\ = CARRY((\Add0~9_combout\ & (\Add0~8_combout\ & !\Add0~5\)) # (!\Add0~9_combout\ & ((\Add0~8_combout\) # (!\Add0~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~9_combout\,
	datab => \Add0~8_combout\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X111_Y33_N18
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\Add0~20_combout\ & ((\Add0~21_combout\ & (!\Add0~11\)) # (!\Add0~21_combout\ & (\Add0~11\ & VCC)))) # (!\Add0~20_combout\ & ((\Add0~21_combout\ & ((\Add0~11\) # (GND))) # (!\Add0~21_combout\ & (!\Add0~11\))))
-- \Add0~23\ = CARRY((\Add0~20_combout\ & (\Add0~21_combout\ & !\Add0~11\)) # (!\Add0~20_combout\ & ((\Add0~21_combout\) # (!\Add0~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datab => \Add0~21_combout\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X114_Y40_N25
\IFID_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(2));

-- Location: FF_X112_Y33_N1
\IDEXE_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(2),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(2));

-- Location: LCCOMB_X113_Y33_N16
\Mux37~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~3_combout\ = (\Mux37~1_combout\ & ((IDEXE_rt_val(2) & (IDEXE_rs_val(2) & !\Mux37~0_combout\)) # (!IDEXE_rt_val(2) & (!IDEXE_rs_val(2) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(2),
	datab => IDEXE_rs_val(2),
	datac => \Mux37~1_combout\,
	datad => \Mux37~0_combout\,
	combout => \Mux37~3_combout\);

-- Location: LCCOMB_X112_Y33_N0
\Mux37~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~4_combout\ = (\Mux39~5_combout\ & (((\Mux37~3_combout\)))) # (!\Mux39~5_combout\ & ((\Mux37~3_combout\ & ((IDEXE_data(2)))) # (!\Mux37~3_combout\ & (IDEXE_rt_val(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(2),
	datab => \Mux39~5_combout\,
	datac => IDEXE_data(2),
	datad => \Mux37~3_combout\,
	combout => \Mux37~4_combout\);

-- Location: LCCOMB_X111_Y32_N0
\Mux37~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~5_combout\ = (\Mux37~2_combout\ & (((\Add0~22_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux37~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux37~2_combout\,
	datab => IDEXE_opcode(3),
	datac => \Add0~22_combout\,
	datad => \Mux37~4_combout\,
	combout => \Mux37~5_combout\);

-- Location: LCCOMB_X111_Y32_N20
\EXEWB_result~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~2_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux37~5_combout\) # ((\Mux38~3_combout\ & div_quot(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \Mux38~3_combout\,
	datac => div_quot(2),
	datad => \Mux37~5_combout\,
	combout => \EXEWB_result~2_combout\);

-- Location: FF_X111_Y32_N21
\EXEWB_result[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(2));

-- Location: FF_X112_Y31_N13
\R3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(2),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(2));

-- Location: LCCOMB_X112_Y29_N28
\Rs_val_fwd[2]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[2]~26_combout\ = (IFID_rs_id(1) & (((IFID_rs_id(0))))) # (!IFID_rs_id(1) & ((IFID_rs_id(0) & ((R1(2)))) # (!IFID_rs_id(0) & (R0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(2),
	datab => R1(2),
	datac => IFID_rs_id(1),
	datad => IFID_rs_id(0),
	combout => \Rs_val_fwd[2]~26_combout\);

-- Location: LCCOMB_X112_Y29_N24
\Rs_val_fwd[2]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[2]~27_combout\ = (IFID_rs_id(1) & ((\Rs_val_fwd[2]~26_combout\ & (R3(2))) # (!\Rs_val_fwd[2]~26_combout\ & ((R2(2)))))) # (!IFID_rs_id(1) & (((\Rs_val_fwd[2]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(2),
	datab => IFID_rs_id(1),
	datac => R2(2),
	datad => \Rs_val_fwd[2]~26_combout\,
	combout => \Rs_val_fwd[2]~27_combout\);

-- Location: LCCOMB_X113_Y32_N16
\Rs_val_fwd[2]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[2]~25_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & ((EXEWB_result(2)))) # (!\fwd_rs_wb~combout\ & (\Mux37~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datab => \fwd_rs_wb~combout\,
	datac => \Mux37~6_combout\,
	datad => EXEWB_result(2),
	combout => \Rs_val_fwd[2]~25_combout\);

-- Location: LCCOMB_X113_Y32_N10
\Rs_val_fwd[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[2]~28_combout\ = (\Rs_val_fwd[2]~25_combout\) # ((\Rs_val_fwd[0]~0_combout\ & \Rs_val_fwd[2]~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datac => \Rs_val_fwd[2]~27_combout\,
	datad => \Rs_val_fwd[2]~25_combout\,
	combout => \Rs_val_fwd[2]~28_combout\);

-- Location: FF_X110_Y33_N25
\IDEXE_rs_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[2]~28_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(2));

-- Location: LCCOMB_X112_Y33_N2
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IDEXE_opcode(3),
	datad => IDEXE_rs_val(2),
	combout => \Add0~20_combout\);

-- Location: LCCOMB_X111_Y33_N20
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = ((\Add0~18_combout\ $ (\Add0~19_combout\ $ (\Add0~23\)))) # (GND)
-- \Add0~25\ = CARRY((\Add0~18_combout\ & ((!\Add0~23\) # (!\Add0~19_combout\))) # (!\Add0~18_combout\ & (!\Add0~19_combout\ & !\Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~18_combout\,
	datab => \Add0~19_combout\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X112_Y32_N2
\Mux36~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux36~2_combout\ = (\Mux37~2_combout\ & (((\Add0~24_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & (\Mux36~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Mux36~1_combout\,
	datad => \Add0~24_combout\,
	combout => \Mux36~2_combout\);

-- Location: LCCOMB_X112_Y32_N18
\Mux36~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux36~3_combout\ = (\Mux36~2_combout\) # ((div_quot(3) & \Mux38~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_quot(3),
	datac => \Mux38~3_combout\,
	datad => \Mux36~2_combout\,
	combout => \Mux36~3_combout\);

-- Location: LCCOMB_X113_Y32_N22
\Rs_val_fwd[3]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[3]~21_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(3))) # (!\fwd_rs_wb~combout\ & ((\Mux36~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(3),
	datab => \fwd_rs_wb~combout\,
	datac => \Rs_val_fwd[0]~0_combout\,
	datad => \Mux36~3_combout\,
	combout => \Rs_val_fwd[3]~21_combout\);

-- Location: LCCOMB_X112_Y32_N20
\Rs_val_fwd[3]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[3]~24_combout\ = (\Rs_val_fwd[3]~21_combout\) # ((\Rs_val_fwd[0]~0_combout\ & \Rs_val_fwd[3]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rs_val_fwd[0]~0_combout\,
	datac => \Rs_val_fwd[3]~23_combout\,
	datad => \Rs_val_fwd[3]~21_combout\,
	combout => \Rs_val_fwd[3]~24_combout\);

-- Location: FF_X110_Y33_N29
\IDEXE_rs_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[3]~24_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(3));

-- Location: LCCOMB_X110_Y33_N30
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datad => IDEXE_rs_val(3),
	combout => \Add0~18_combout\);

-- Location: LCCOMB_X111_Y33_N22
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\Add0~16_combout\ & ((\Add0~17_combout\ & (!\Add0~25\)) # (!\Add0~17_combout\ & (\Add0~25\ & VCC)))) # (!\Add0~16_combout\ & ((\Add0~17_combout\ & ((\Add0~25\) # (GND))) # (!\Add0~17_combout\ & (!\Add0~25\))))
-- \Add0~27\ = CARRY((\Add0~16_combout\ & (\Add0~17_combout\ & !\Add0~25\)) # (!\Add0~16_combout\ & ((\Add0~17_combout\) # (!\Add0~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~17_combout\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X110_Y33_N2
\Mux35~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~2_combout\ = (\Mux37~2_combout\ & (((\Add0~26_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & (\Mux35~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux35~1_combout\,
	datac => \Mux37~2_combout\,
	datad => \Add0~26_combout\,
	combout => \Mux35~2_combout\);

-- Location: LCCOMB_X110_Y33_N28
\Mux35~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~3_combout\ = (\Mux35~2_combout\) # ((\Mux38~3_combout\ & div_quot(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux38~3_combout\,
	datab => div_quot(4),
	datad => \Mux35~2_combout\,
	combout => \Mux35~3_combout\);

-- Location: FF_X112_Y31_N27
\R3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(4),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(4));

-- Location: LCCOMB_X114_Y31_N12
\R2[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \R2[4]~feeder_combout\ = EXEWB_result(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => EXEWB_result(4),
	combout => \R2[4]~feeder_combout\);

-- Location: FF_X114_Y31_N13
\R2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \R2[4]~feeder_combout\,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(4));

-- Location: FF_X112_Y31_N5
\R1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(4),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(4));

-- Location: LCCOMB_X112_Y31_N6
\Rt_val_fwd[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[4]~15_combout\ = (IFID_rt_id(0) & ((R1(4)) # ((IFID_rt_id(1))))) # (!IFID_rt_id(0) & (((R0(4) & !IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(4),
	datab => IFID_rt_id(0),
	datac => R0(4),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[4]~15_combout\);

-- Location: LCCOMB_X112_Y31_N8
\Rt_val_fwd[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[4]~16_combout\ = (IFID_rt_id(1) & ((\Rt_val_fwd[4]~15_combout\ & (R3(4))) # (!\Rt_val_fwd[4]~15_combout\ & ((R2(4)))))) # (!IFID_rt_id(1) & (((\Rt_val_fwd[4]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(4),
	datab => IFID_rt_id(1),
	datac => R2(4),
	datad => \Rt_val_fwd[4]~15_combout\,
	combout => \Rt_val_fwd[4]~16_combout\);

-- Location: LCCOMB_X111_Y31_N18
\Rt_val_fwd[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[4]~17_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(4))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[4]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(4),
	datab => \fwd_rt_exe~combout\,
	datac => \Rt_val_fwd[4]~16_combout\,
	datad => \fwd_rt_wb~1_combout\,
	combout => \Rt_val_fwd[4]~17_combout\);

-- Location: LCCOMB_X111_Y32_N4
\Rt_val_fwd[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[4]~18_combout\ = (\Rt_val_fwd[4]~17_combout\) # ((\fwd_rt_exe~combout\ & \Mux35~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fwd_rt_exe~combout\,
	datac => \Mux35~3_combout\,
	datad => \Rt_val_fwd[4]~17_combout\,
	combout => \Rt_val_fwd[4]~18_combout\);

-- Location: FF_X110_Y33_N7
\IDEXE_rt_val[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[4]~18_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(4));

-- Location: LCCOMB_X110_Y33_N20
\Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = IDEXE_rt_val(4) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(4),
	datab => IDEXE_opcode(3),
	datad => IDEXE_opcode(2),
	combout => \Add0~17_combout\);

-- Location: LCCOMB_X111_Y33_N24
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = ((\Add0~15_combout\ $ (\Add0~14_combout\ $ (\Add0~27\)))) # (GND)
-- \Add0~29\ = CARRY((\Add0~15_combout\ & (\Add0~14_combout\ & !\Add0~27\)) # (!\Add0~15_combout\ & ((\Add0~14_combout\) # (!\Add0~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X112_Y33_N22
\Mux34~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux34~4_combout\ = (\Mux37~2_combout\ & (((\Add0~28_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux34~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Add0~28_combout\,
	datac => \Mux37~2_combout\,
	datad => \Mux34~1_combout\,
	combout => \Mux34~4_combout\);

-- Location: LCCOMB_X111_Y32_N10
\EXEWB_result~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~5_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux34~4_combout\) # ((div_quot(5) & \Mux38~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => div_quot(5),
	datac => \Mux38~3_combout\,
	datad => \Mux34~4_combout\,
	combout => \EXEWB_result~5_combout\);

-- Location: FF_X111_Y32_N11
\EXEWB_result[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(5));

-- Location: LCCOMB_X112_Y29_N6
\Rt_val_fwd[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[5]~11_combout\ = (IFID_rt_id(0) & (((IFID_rt_id(1))))) # (!IFID_rt_id(0) & ((IFID_rt_id(1) & (R2(5))) # (!IFID_rt_id(1) & ((R0(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R2(5),
	datac => R0(5),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[5]~11_combout\);

-- Location: LCCOMB_X112_Y29_N8
\Rt_val_fwd[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[5]~12_combout\ = (IFID_rt_id(0) & ((\Rt_val_fwd[5]~11_combout\ & ((R3(5)))) # (!\Rt_val_fwd[5]~11_combout\ & (R1(5))))) # (!IFID_rt_id(0) & (((\Rt_val_fwd[5]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(5),
	datab => R3(5),
	datac => IFID_rt_id(0),
	datad => \Rt_val_fwd[5]~11_combout\,
	combout => \Rt_val_fwd[5]~12_combout\);

-- Location: LCCOMB_X111_Y32_N26
\Rt_val_fwd[5]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[5]~13_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(5))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[5]~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(5),
	datab => \Rt_val_fwd[5]~12_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \fwd_rt_wb~1_combout\,
	combout => \Rt_val_fwd[5]~13_combout\);

-- Location: LCCOMB_X111_Y32_N30
\Rt_val_fwd[5]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[5]~14_combout\ = (\Rt_val_fwd[5]~13_combout\) # ((\fwd_rt_exe~combout\ & \Mux34~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fwd_rt_exe~combout\,
	datac => \Rt_val_fwd[5]~13_combout\,
	datad => \Mux34~3_combout\,
	combout => \Rt_val_fwd[5]~14_combout\);

-- Location: LCCOMB_X112_Y33_N6
\IDEXE_rt_val[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IDEXE_rt_val[5]~feeder_combout\ = \Rt_val_fwd[5]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Rt_val_fwd[5]~14_combout\,
	combout => \IDEXE_rt_val[5]~feeder_combout\);

-- Location: FF_X112_Y33_N7
\IDEXE_rt_val[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \IDEXE_rt_val[5]~feeder_combout\,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(5));

-- Location: LCCOMB_X112_Y33_N4
\Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = IDEXE_rt_val(5) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(5),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(3),
	combout => \Add0~15_combout\);

-- Location: LCCOMB_X111_Y33_N26
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & (!\Add0~29\)) # (!\Add0~13_combout\ & (\Add0~29\ & VCC)))) # (!\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add0~29\) # (GND))) # (!\Add0~13_combout\ & (!\Add0~29\))))
-- \Add0~31\ = CARRY((\Add0~12_combout\ & (\Add0~13_combout\ & !\Add0~29\)) # (!\Add0~12_combout\ & ((\Add0~13_combout\) # (!\Add0~29\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~12_combout\,
	datab => \Add0~13_combout\,
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: FF_X114_Y40_N31
\IFID_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IFID_data(6));

-- Location: FF_X112_Y33_N11
\IDEXE_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => IFID_data(6),
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_data(6));

-- Location: LCCOMB_X113_Y33_N28
\Mux33~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (\Mux37~1_combout\ & ((IDEXE_rs_val(6) & (IDEXE_rt_val(6) & !\Mux37~0_combout\)) # (!IDEXE_rs_val(6) & (!IDEXE_rt_val(6) & \Mux37~0_combout\)))) # (!\Mux37~1_combout\ & (((!\Mux37~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rs_val(6),
	datab => IDEXE_rt_val(6),
	datac => \Mux37~1_combout\,
	datad => \Mux37~0_combout\,
	combout => \Mux33~0_combout\);

-- Location: LCCOMB_X112_Y33_N10
\Mux33~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~1_combout\ = (\Mux39~5_combout\ & (((\Mux33~0_combout\)))) # (!\Mux39~5_combout\ & ((\Mux33~0_combout\ & ((IDEXE_data(6)))) # (!\Mux33~0_combout\ & (IDEXE_rt_val(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(6),
	datab => \Mux39~5_combout\,
	datac => IDEXE_data(6),
	datad => \Mux33~0_combout\,
	combout => \Mux33~1_combout\);

-- Location: LCCOMB_X112_Y33_N16
\Mux33~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~2_combout\ = (\Mux37~2_combout\ & (((\Add0~30_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux33~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Add0~30_combout\,
	datad => \Mux33~1_combout\,
	combout => \Mux33~2_combout\);

-- Location: LCCOMB_X112_Y33_N30
\Mux33~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~3_combout\ = (\Mux33~2_combout\) # ((\Mux38~3_combout\ & div_quot(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux38~3_combout\,
	datac => div_quot(6),
	datad => \Mux33~2_combout\,
	combout => \Mux33~3_combout\);

-- Location: LCCOMB_X114_Y31_N22
\R2[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \R2[6]~feeder_combout\ = EXEWB_result(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => EXEWB_result(6),
	combout => \R2[6]~feeder_combout\);

-- Location: FF_X114_Y31_N23
\R2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \R2[6]~feeder_combout\,
	ena => \Mux60~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R2(6));

-- Location: FF_X112_Y31_N25
\R1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(6),
	sload => VCC,
	ena => \Mux60~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R1(6));

-- Location: FF_X111_Y31_N27
\R0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(6),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(6));

-- Location: LCCOMB_X111_Y31_N26
\Rt_val_fwd[6]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[6]~7_combout\ = (IFID_rt_id(0) & ((R1(6)) # ((IFID_rt_id(1))))) # (!IFID_rt_id(0) & (((R0(6) & !IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R1(6),
	datac => R0(6),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[6]~7_combout\);

-- Location: LCCOMB_X112_Y31_N28
\Rt_val_fwd[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[6]~8_combout\ = (\Rt_val_fwd[6]~7_combout\ & ((R3(6)) # ((!IFID_rt_id(1))))) # (!\Rt_val_fwd[6]~7_combout\ & (((R2(6) & IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(6),
	datab => R2(6),
	datac => \Rt_val_fwd[6]~7_combout\,
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[6]~8_combout\);

-- Location: LCCOMB_X111_Y31_N8
\Rt_val_fwd[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[6]~9_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(6))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[6]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(6),
	datab => \fwd_rt_wb~1_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \Rt_val_fwd[6]~8_combout\,
	combout => \Rt_val_fwd[6]~9_combout\);

-- Location: LCCOMB_X111_Y32_N12
\Rt_val_fwd[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[6]~10_combout\ = (\Rt_val_fwd[6]~9_combout\) # ((\fwd_rt_exe~combout\ & \Mux33~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fwd_rt_exe~combout\,
	datac => \Mux33~3_combout\,
	datad => \Rt_val_fwd[6]~9_combout\,
	combout => \Rt_val_fwd[6]~10_combout\);

-- Location: FF_X110_Y33_N9
\IDEXE_rt_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[6]~10_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(6));

-- Location: LCCOMB_X110_Y33_N4
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((IDEXE_rt_val(0) & !IDEXE_rs_val(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(0),
	datab => IDEXE_rs_val(0),
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X110_Y33_N6
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((IDEXE_rt_val(1) & (IDEXE_rs_val(1) & !\LessThan0~1_cout\)) # (!IDEXE_rt_val(1) & ((IDEXE_rs_val(1)) # (!\LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(1),
	datab => IDEXE_rs_val(1),
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X110_Y33_N8
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((IDEXE_rt_val(2) & ((!\LessThan0~3_cout\) # (!IDEXE_rs_val(2)))) # (!IDEXE_rt_val(2) & (!IDEXE_rs_val(2) & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(2),
	datab => IDEXE_rs_val(2),
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X110_Y33_N10
\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((IDEXE_rt_val(3) & (IDEXE_rs_val(3) & !\LessThan0~5_cout\)) # (!IDEXE_rt_val(3) & ((IDEXE_rs_val(3)) # (!\LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(3),
	datab => IDEXE_rs_val(3),
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X110_Y33_N12
\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((IDEXE_rt_val(4) & ((!\LessThan0~7_cout\) # (!IDEXE_rs_val(4)))) # (!IDEXE_rt_val(4) & (!IDEXE_rs_val(4) & !\LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(4),
	datab => IDEXE_rs_val(4),
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X110_Y33_N14
\LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((IDEXE_rt_val(5) & (IDEXE_rs_val(5) & !\LessThan0~9_cout\)) # (!IDEXE_rt_val(5) & ((IDEXE_rs_val(5)) # (!\LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(5),
	datab => IDEXE_rs_val(5),
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X110_Y33_N16
\LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((IDEXE_rt_val(6) & ((!\LessThan0~11_cout\) # (!IDEXE_rs_val(6)))) # (!IDEXE_rt_val(6) & (!IDEXE_rs_val(6) & !\LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_rt_val(6),
	datab => IDEXE_rs_val(6),
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

-- Location: LCCOMB_X110_Y33_N18
\LessThan0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~14_combout\ = (IDEXE_rs_val(7) & (\LessThan0~13_cout\ & IDEXE_rt_val(7))) # (!IDEXE_rs_val(7) & ((\LessThan0~13_cout\) # (IDEXE_rt_val(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_rs_val(7),
	datad => IDEXE_rt_val(7),
	cin => \LessThan0~13_cout\,
	combout => \LessThan0~14_combout\);

-- Location: LCCOMB_X109_Y33_N24
\Mux39~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~1_combout\ = (IDEXE_opcode(0) & ((\LessThan0~14_combout\))) # (!IDEXE_opcode(0) & (\Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(0),
	datac => \Add0~4_combout\,
	datad => \LessThan0~14_combout\,
	combout => \Mux39~1_combout\);

-- Location: LCCOMB_X109_Y33_N18
\Mux39~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~2_combout\ = (IDEXE_opcode(2) & (\Mux39~0_combout\ & (IDEXE_opcode(1)))) # (!IDEXE_opcode(2) & (((\Mux39~1_combout\) # (!IDEXE_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux39~0_combout\,
	datab => IDEXE_opcode(2),
	datac => IDEXE_opcode(1),
	datad => \Mux39~1_combout\,
	combout => \Mux39~2_combout\);

-- Location: LCCOMB_X109_Y33_N6
\Mux39~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~3_combout\ = (IDEXE_opcode(1) & (((\Mux39~2_combout\)))) # (!IDEXE_opcode(1) & ((\Mux39~2_combout\ & (!\Add0~7_combout\)) # (!\Mux39~2_combout\ & ((\Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(1),
	datab => \Add0~7_combout\,
	datac => \Add0~6_combout\,
	datad => \Mux39~2_combout\,
	combout => \Mux39~3_combout\);

-- Location: LCCOMB_X109_Y33_N30
\Mux39~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~6_combout\ = (IDEXE_opcode(3) & (((\Mux39~3_combout\)))) # (!IDEXE_opcode(3) & (\Mux39~4_combout\ & (!\Mux39~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux39~4_combout\,
	datac => \Mux39~5_combout\,
	datad => \Mux39~3_combout\,
	combout => \Mux39~6_combout\);

-- Location: LCCOMB_X114_Y33_N4
\EXEWB_result~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~0_combout\ = (!\div_state.DIV_RUN~q\ & \Mux39~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \div_state.DIV_RUN~q\,
	datad => \Mux39~6_combout\,
	combout => \EXEWB_result~0_combout\);

-- Location: FF_X114_Y33_N5
\EXEWB_result[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(0));

-- Location: LCCOMB_X111_Y31_N16
\Rt_val_fwd[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[0]~0_combout\ = (IFID_rt_id(0) & ((IFID_rt_id(1)) # ((R1(0))))) # (!IFID_rt_id(0) & (!IFID_rt_id(1) & (R0(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => IFID_rt_id(1),
	datac => R0(0),
	datad => R1(0),
	combout => \Rt_val_fwd[0]~0_combout\);

-- Location: LCCOMB_X112_Y31_N16
\Rt_val_fwd[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[0]~1_combout\ = (\Rt_val_fwd[0]~0_combout\ & (((R3(0)) # (!IFID_rt_id(1))))) # (!\Rt_val_fwd[0]~0_combout\ & (R2(0) & ((IFID_rt_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[0]~0_combout\,
	datab => R2(0),
	datac => R3(0),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[0]~1_combout\);

-- Location: LCCOMB_X111_Y31_N20
\Rt_val_fwd[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[0]~2_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(0))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[0]~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(0),
	datab => \fwd_rt_wb~1_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \Rt_val_fwd[0]~1_combout\,
	combout => \Rt_val_fwd[0]~2_combout\);

-- Location: LCCOMB_X113_Y32_N6
\Rt_val_fwd[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[0]~31_combout\ = (\Rt_val_fwd[0]~2_combout\) # ((\fwd_rt_exe~combout\ & \Mux39~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_exe~combout\,
	datac => \Rt_val_fwd[0]~2_combout\,
	datad => \Mux39~6_combout\,
	combout => \Rt_val_fwd[0]~31_combout\);

-- Location: FF_X111_Y33_N5
\IDEXE_rt_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rt_val_fwd[0]~31_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rt_val(0));

-- Location: LCCOMB_X111_Y33_N8
\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = IDEXE_rt_val(0) $ (((IDEXE_opcode(2)) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_rt_val(0),
	datac => IDEXE_opcode(3),
	datad => IDEXE_opcode(2),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X110_Y32_N16
\Mux38~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~2_combout\ = (\Mux37~2_combout\ & (((\Add0~10_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & (\Mux38~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Mux38~1_combout\,
	datad => \Add0~10_combout\,
	combout => \Mux38~2_combout\);

-- Location: LCCOMB_X113_Y32_N4
\EXEWB_result~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~1_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux38~2_combout\) # ((\Mux38~3_combout\ & div_quot(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \Mux38~2_combout\,
	datac => \Mux38~3_combout\,
	datad => div_quot(1),
	combout => \EXEWB_result~1_combout\);

-- Location: FF_X113_Y32_N5
\EXEWB_result[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(1));

-- Location: LCCOMB_X111_Y29_N6
\Rt_val_fwd[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[1]~3_combout\ = (IFID_rt_id(0) & (((IFID_rt_id(1))))) # (!IFID_rt_id(0) & ((IFID_rt_id(1) & (R2(1))) # (!IFID_rt_id(1) & ((R0(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R2(1),
	datac => R0(1),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[1]~3_combout\);

-- Location: LCCOMB_X111_Y29_N0
\Rt_val_fwd[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[1]~4_combout\ = (IFID_rt_id(0) & ((\Rt_val_fwd[1]~3_combout\ & ((R3(1)))) # (!\Rt_val_fwd[1]~3_combout\ & (R1(1))))) # (!IFID_rt_id(0) & (((\Rt_val_fwd[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R1(1),
	datac => R3(1),
	datad => \Rt_val_fwd[1]~3_combout\,
	combout => \Rt_val_fwd[1]~4_combout\);

-- Location: LCCOMB_X111_Y31_N22
\Rt_val_fwd[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[1]~5_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & (EXEWB_result(1))) # (!\fwd_rt_wb~1_combout\ & ((\Rt_val_fwd[1]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(1),
	datab => \fwd_rt_wb~1_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \Rt_val_fwd[1]~4_combout\,
	combout => \Rt_val_fwd[1]~5_combout\);

-- Location: LCCOMB_X110_Y32_N24
\Rt_val_fwd[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[1]~6_combout\ = (\Rt_val_fwd[1]~5_combout\) # ((\fwd_rt_exe~combout\ & \Mux38~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_exe~combout\,
	datac => \Rt_val_fwd[1]~5_combout\,
	datad => \Mux38~4_combout\,
	combout => \Rt_val_fwd[1]~6_combout\);

-- Location: LCCOMB_X110_Y32_N26
\Equal15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal15~0_combout\ = (!\Rt_val_fwd[1]~6_combout\ & (!\Rt_val_fwd[0]~2_combout\ & ((!\Mux39~6_combout\) # (!\fwd_rt_exe~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_exe~combout\,
	datab => \Rt_val_fwd[1]~6_combout\,
	datac => \Rt_val_fwd[0]~2_combout\,
	datad => \Mux39~6_combout\,
	combout => \Equal15~0_combout\);

-- Location: LCCOMB_X111_Y32_N24
\Equal15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal15~1_combout\ = (!\Rt_val_fwd[5]~14_combout\ & (!\Rt_val_fwd[2]~22_combout\ & (!\Rt_val_fwd[4]~18_combout\ & !\Rt_val_fwd[6]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[5]~14_combout\,
	datab => \Rt_val_fwd[2]~22_combout\,
	datac => \Rt_val_fwd[4]~18_combout\,
	datad => \Rt_val_fwd[6]~10_combout\,
	combout => \Equal15~1_combout\);

-- Location: LCCOMB_X112_Y32_N24
\div_quot~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot~16_combout\ = (\div_state.DIV_RUN~q\) # ((\Equal15~0_combout\ & (\Equal15~3_combout\ & \Equal15~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~0_combout\,
	datab => \div_state.DIV_RUN~q\,
	datac => \Equal15~3_combout\,
	datad => \Equal15~1_combout\,
	combout => \div_quot~16_combout\);

-- Location: LCCOMB_X109_Y32_N26
\div_quot[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[4]~21_combout\ = (\div_quot[4]~29_combout\ & (div_quot(4))) # (!\div_quot[4]~29_combout\ & ((\div_quot~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_quot[4]~29_combout\,
	datac => div_quot(4),
	datad => \div_quot~16_combout\,
	combout => \div_quot[4]~21_combout\);

-- Location: FF_X109_Y32_N27
\div_quot[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[4]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(4));

-- Location: LCCOMB_X113_Y33_N10
\Mux35~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~4_combout\ = (\Mux37~2_combout\ & (((\Add0~26_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux35~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Add0~26_combout\,
	datad => \Mux35~1_combout\,
	combout => \Mux35~4_combout\);

-- Location: LCCOMB_X114_Y33_N10
\EXEWB_result~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~4_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux35~4_combout\) # ((div_quot(4) & \Mux38~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_quot(4),
	datab => \Mux38~3_combout\,
	datac => \div_state.DIV_RUN~q\,
	datad => \Mux35~4_combout\,
	combout => \EXEWB_result~4_combout\);

-- Location: FF_X114_Y33_N11
\EXEWB_result[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(4));

-- Location: FF_X113_Y31_N13
\R0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(4),
	sload => VCC,
	ena => \R0[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R0(4));

-- Location: LCCOMB_X112_Y31_N4
\Rs_val_fwd[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[4]~18_combout\ = (IFID_rs_id(1) & (((IFID_rs_id(0))))) # (!IFID_rs_id(1) & ((IFID_rs_id(0) & ((R1(4)))) # (!IFID_rs_id(0) & (R0(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(1),
	datab => R0(4),
	datac => R1(4),
	datad => IFID_rs_id(0),
	combout => \Rs_val_fwd[4]~18_combout\);

-- Location: LCCOMB_X112_Y31_N26
\Rs_val_fwd[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[4]~19_combout\ = (IFID_rs_id(1) & ((\Rs_val_fwd[4]~18_combout\ & (R3(4))) # (!\Rs_val_fwd[4]~18_combout\ & ((R2(4)))))) # (!IFID_rs_id(1) & (\Rs_val_fwd[4]~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(1),
	datab => \Rs_val_fwd[4]~18_combout\,
	datac => R3(4),
	datad => R2(4),
	combout => \Rs_val_fwd[4]~19_combout\);

-- Location: LCCOMB_X113_Y32_N2
\Rs_val_fwd[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[4]~17_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(4))) # (!\fwd_rs_wb~combout\ & ((\Mux35~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => EXEWB_result(4),
	datab => \fwd_rs_wb~combout\,
	datac => \Rs_val_fwd[0]~0_combout\,
	datad => \Mux35~3_combout\,
	combout => \Rs_val_fwd[4]~17_combout\);

-- Location: LCCOMB_X113_Y32_N0
\Rs_val_fwd[4]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[4]~20_combout\ = (\Rs_val_fwd[4]~17_combout\) # ((\Rs_val_fwd[4]~19_combout\ & \Rs_val_fwd[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[4]~19_combout\,
	datac => \Rs_val_fwd[0]~0_combout\,
	datad => \Rs_val_fwd[4]~17_combout\,
	combout => \Rs_val_fwd[4]~20_combout\);

-- Location: FF_X113_Y32_N1
\div_dividend[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[4]~20_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(4));

-- Location: FF_X112_Y32_N7
\div_dividend[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[5]~16_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(5));

-- Location: LCCOMB_X113_Y32_N14
\Mux72~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux72~3_combout\ = (\Mux72~2_combout\ & ((div_dividend(4)) # ((!div_count(1))))) # (!\Mux72~2_combout\ & (((div_dividend(5) & div_count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux72~2_combout\,
	datab => div_dividend(4),
	datac => div_dividend(5),
	datad => div_count(1),
	combout => \Mux72~3_combout\);

-- Location: FF_X112_Y32_N11
\div_dividend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[1]~32_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(1));

-- Location: FF_X112_Y32_N15
\div_dividend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[0]~4_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(0));

-- Location: FF_X112_Y32_N21
\div_dividend[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rs_val_fwd[3]~24_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(3));

-- Location: FF_X112_Y32_N31
\div_dividend[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[2]~28_combout\,
	sload => VCC,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_dividend(2));

-- Location: LCCOMB_X112_Y32_N30
\Mux72~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux72~0_combout\ = (div_count(1) & (((div_count(0))))) # (!div_count(1) & ((div_count(0) & ((div_dividend(2)))) # (!div_count(0) & (div_dividend(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_dividend(3),
	datac => div_dividend(2),
	datad => div_count(0),
	combout => \Mux72~0_combout\);

-- Location: LCCOMB_X113_Y32_N26
\Mux72~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux72~1_combout\ = (div_count(1) & ((\Mux72~0_combout\ & ((div_dividend(0)))) # (!\Mux72~0_combout\ & (div_dividend(1))))) # (!div_count(1) & (((\Mux72~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_dividend(1),
	datab => div_count(1),
	datac => div_dividend(0),
	datad => \Mux72~0_combout\,
	combout => \Mux72~1_combout\);

-- Location: LCCOMB_X108_Y32_N0
\Mux72~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux72~4_combout\ = (div_count(2) & ((\Mux72~1_combout\))) # (!div_count(2) & (\Mux72~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => div_count(2),
	datac => \Mux72~3_combout\,
	datad => \Mux72~1_combout\,
	combout => \Mux72~4_combout\);

-- Location: FF_X113_Y32_N7
\div_divisor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[0]~31_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(0));

-- Location: LCCOMB_X108_Y32_N18
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (div_divisor(0) & (\Mux72~4_combout\ $ (VCC))) # (!div_divisor(0) & ((\Mux72~4_combout\) # (GND)))
-- \Add3~1\ = CARRY((\Mux72~4_combout\) # (!div_divisor(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(0),
	datab => \Mux72~4_combout\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X109_Y32_N12
\Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (\LessThan1~14_combout\ & (\Mux72~4_combout\)) # (!\LessThan1~14_combout\ & ((\Add3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux72~4_combout\,
	datac => \LessThan1~14_combout\,
	datad => \Add3~0_combout\,
	combout => \Add3~20_combout\);

-- Location: LCCOMB_X110_Y32_N30
\div_rem[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_rem[5]~0_combout\ = (!\div_state.DIV_RUN~q\ & (((!\Rt_val_fwd[3]~26_combout\ & !\Rt_val_fwd[7]~30_combout\)) # (!\process_4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \process_4~1_combout\,
	datac => \Rt_val_fwd[3]~26_combout\,
	datad => \Rt_val_fwd[7]~30_combout\,
	combout => \div_rem[5]~0_combout\);

-- Location: LCCOMB_X109_Y32_N0
\div_rem[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_rem[5]~1_combout\ = ((\process_4~1_combout\ & ((!\Equal15~1_combout\) # (!\Equal15~0_combout\)))) # (!\div_rem[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~0_combout\,
	datab => \process_4~1_combout\,
	datac => \div_rem[5]~0_combout\,
	datad => \Equal15~1_combout\,
	combout => \div_rem[5]~1_combout\);

-- Location: FF_X109_Y32_N13
\div_rem[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~20_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(0));

-- Location: FF_X110_Y32_N25
\div_divisor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[1]~6_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(1));

-- Location: LCCOMB_X108_Y32_N20
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (div_divisor(1) & ((div_rem(0) & (!\Add3~1\)) # (!div_rem(0) & ((\Add3~1\) # (GND))))) # (!div_divisor(1) & ((div_rem(0) & (\Add3~1\ & VCC)) # (!div_rem(0) & (!\Add3~1\))))
-- \Add3~3\ = CARRY((div_divisor(1) & ((!\Add3~1\) # (!div_rem(0)))) # (!div_divisor(1) & (!div_rem(0) & !\Add3~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(1),
	datab => div_rem(0),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X109_Y32_N22
\Add3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~19_combout\ = (\LessThan1~14_combout\ & (div_rem(0))) # (!\LessThan1~14_combout\ & ((\Add3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(0),
	datac => \LessThan1~14_combout\,
	datad => \Add3~2_combout\,
	combout => \Add3~19_combout\);

-- Location: FF_X109_Y32_N23
\div_rem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~19_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(1));

-- Location: FF_X111_Y32_N19
\div_divisor[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[2]~22_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(2));

-- Location: LCCOMB_X108_Y32_N22
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = ((div_rem(1) $ (div_divisor(2) $ (\Add3~3\)))) # (GND)
-- \Add3~5\ = CARRY((div_rem(1) & ((!\Add3~3\) # (!div_divisor(2)))) # (!div_rem(1) & (!div_divisor(2) & !\Add3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(1),
	datab => div_divisor(2),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X109_Y32_N20
\Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (\LessThan1~14_combout\ & (div_rem(1))) # (!\LessThan1~14_combout\ & ((\Add3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(1),
	datac => \LessThan1~14_combout\,
	datad => \Add3~4_combout\,
	combout => \Add3~18_combout\);

-- Location: FF_X109_Y32_N21
\div_rem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~18_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(2));

-- Location: FF_X112_Y32_N9
\div_divisor[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[3]~26_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(3));

-- Location: LCCOMB_X108_Y32_N24
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (div_rem(2) & ((div_divisor(3) & (!\Add3~5\)) # (!div_divisor(3) & (\Add3~5\ & VCC)))) # (!div_rem(2) & ((div_divisor(3) & ((\Add3~5\) # (GND))) # (!div_divisor(3) & (!\Add3~5\))))
-- \Add3~7\ = CARRY((div_rem(2) & (div_divisor(3) & !\Add3~5\)) # (!div_rem(2) & ((div_divisor(3)) # (!\Add3~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(2),
	datab => div_divisor(3),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X109_Y32_N6
\Add3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~17_combout\ = (\LessThan1~14_combout\ & (div_rem(2))) # (!\LessThan1~14_combout\ & ((\Add3~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(2),
	datac => \LessThan1~14_combout\,
	datad => \Add3~6_combout\,
	combout => \Add3~17_combout\);

-- Location: FF_X109_Y32_N7
\div_rem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~17_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(3));

-- Location: FF_X111_Y32_N5
\div_divisor[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[4]~18_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(4));

-- Location: LCCOMB_X108_Y32_N26
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = ((div_rem(3) $ (div_divisor(4) $ (\Add3~7\)))) # (GND)
-- \Add3~9\ = CARRY((div_rem(3) & ((!\Add3~7\) # (!div_divisor(4)))) # (!div_rem(3) & (!div_divisor(4) & !\Add3~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(3),
	datab => div_divisor(4),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X109_Y32_N24
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (\LessThan1~14_combout\ & ((div_rem(3)))) # (!\LessThan1~14_combout\ & (\Add3~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~14_combout\,
	datac => \Add3~8_combout\,
	datad => div_rem(3),
	combout => \Add3~16_combout\);

-- Location: FF_X109_Y32_N25
\div_rem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~16_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(4));

-- Location: FF_X111_Y32_N31
\div_divisor[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[5]~14_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(5));

-- Location: LCCOMB_X108_Y32_N28
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (div_divisor(5) & ((div_rem(4) & (!\Add3~9\)) # (!div_rem(4) & ((\Add3~9\) # (GND))))) # (!div_divisor(5) & ((div_rem(4) & (\Add3~9\ & VCC)) # (!div_rem(4) & (!\Add3~9\))))
-- \Add3~11\ = CARRY((div_divisor(5) & ((!\Add3~9\) # (!div_rem(4)))) # (!div_divisor(5) & (!div_rem(4) & !\Add3~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(5),
	datab => div_rem(4),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X109_Y32_N2
\Add3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~15_combout\ = (\LessThan1~14_combout\ & (div_rem(4))) # (!\LessThan1~14_combout\ & ((\Add3~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => div_rem(4),
	datac => \LessThan1~14_combout\,
	datad => \Add3~10_combout\,
	combout => \Add3~15_combout\);

-- Location: FF_X109_Y32_N3
\div_rem[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~15_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(5));

-- Location: FF_X111_Y32_N13
\div_divisor[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[6]~10_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(6));

-- Location: LCCOMB_X108_Y32_N30
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = div_divisor(6) $ (\Add3~11\ $ (div_rem(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(6),
	datad => div_rem(5),
	cin => \Add3~11\,
	combout => \Add3~12_combout\);

-- Location: LCCOMB_X109_Y32_N8
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (\LessThan1~14_combout\ & (div_rem(5))) # (!\LessThan1~14_combout\ & ((\Add3~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => div_rem(5),
	datac => \LessThan1~14_combout\,
	datad => \Add3~12_combout\,
	combout => \Add3~14_combout\);

-- Location: FF_X109_Y32_N9
\div_rem[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Add3~14_combout\,
	sclr => \ALT_INV_div_state.DIV_RUN~q\,
	ena => \div_rem[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_rem(6));

-- Location: FF_X110_Y32_N13
\div_divisor[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \Rt_val_fwd[7]~30_combout\,
	ena => \div_divisor[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_divisor(7));

-- Location: LCCOMB_X108_Y32_N2
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_cout\ = CARRY((div_divisor(0) & !\Mux72~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(0),
	datab => \Mux72~4_combout\,
	datad => VCC,
	cout => \LessThan1~1_cout\);

-- Location: LCCOMB_X108_Y32_N4
\LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~3_cout\ = CARRY((div_divisor(1) & (div_rem(0) & !\LessThan1~1_cout\)) # (!div_divisor(1) & ((div_rem(0)) # (!\LessThan1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(1),
	datab => div_rem(0),
	datad => VCC,
	cin => \LessThan1~1_cout\,
	cout => \LessThan1~3_cout\);

-- Location: LCCOMB_X108_Y32_N6
\LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~5_cout\ = CARRY((div_rem(1) & (div_divisor(2) & !\LessThan1~3_cout\)) # (!div_rem(1) & ((div_divisor(2)) # (!\LessThan1~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(1),
	datab => div_divisor(2),
	datad => VCC,
	cin => \LessThan1~3_cout\,
	cout => \LessThan1~5_cout\);

-- Location: LCCOMB_X108_Y32_N8
\LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~7_cout\ = CARRY((div_rem(2) & ((!\LessThan1~5_cout\) # (!div_divisor(3)))) # (!div_rem(2) & (!div_divisor(3) & !\LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(2),
	datab => div_divisor(3),
	datad => VCC,
	cin => \LessThan1~5_cout\,
	cout => \LessThan1~7_cout\);

-- Location: LCCOMB_X108_Y32_N10
\LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~9_cout\ = CARRY((div_rem(3) & (div_divisor(4) & !\LessThan1~7_cout\)) # (!div_rem(3) & ((div_divisor(4)) # (!\LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_rem(3),
	datab => div_divisor(4),
	datad => VCC,
	cin => \LessThan1~7_cout\,
	cout => \LessThan1~9_cout\);

-- Location: LCCOMB_X108_Y32_N12
\LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~11_cout\ = CARRY((div_divisor(5) & (div_rem(4) & !\LessThan1~9_cout\)) # (!div_divisor(5) & ((div_rem(4)) # (!\LessThan1~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(5),
	datab => div_rem(4),
	datad => VCC,
	cin => \LessThan1~9_cout\,
	cout => \LessThan1~11_cout\);

-- Location: LCCOMB_X108_Y32_N14
\LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~13_cout\ = CARRY((div_divisor(6) & ((!\LessThan1~11_cout\) # (!div_rem(5)))) # (!div_divisor(6) & (!div_rem(5) & !\LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_divisor(6),
	datab => div_rem(5),
	datad => VCC,
	cin => \LessThan1~11_cout\,
	cout => \LessThan1~13_cout\);

-- Location: LCCOMB_X108_Y32_N16
\LessThan1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~14_combout\ = (div_rem(6) & (\LessThan1~13_cout\ & div_divisor(7))) # (!div_rem(6) & ((\LessThan1~13_cout\) # (div_divisor(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_rem(6),
	datad => div_divisor(7),
	cin => \LessThan1~13_cout\,
	combout => \LessThan1~14_combout\);

-- Location: LCCOMB_X107_Y32_N18
\Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (!div_count(1) & (!div_count(2) & (div_count(0) & !\LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \LessThan1~14_combout\,
	combout => \Decoder0~2_combout\);

-- Location: LCCOMB_X107_Y32_N0
\div_quot[6]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[6]~27_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~2_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~2_combout\,
	combout => \div_quot[6]~27_combout\);

-- Location: LCCOMB_X107_Y32_N10
\div_quot[6]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[6]~19_combout\ = (\div_quot[6]~27_combout\ & (div_quot(6))) # (!\div_quot[6]~27_combout\ & ((\div_quot~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot[6]~27_combout\,
	datac => div_quot(6),
	datad => \div_quot~16_combout\,
	combout => \div_quot[6]~19_combout\);

-- Location: FF_X107_Y32_N11
\div_quot[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[6]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(6));

-- Location: LCCOMB_X112_Y33_N12
\Mux33~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~4_combout\ = (\Mux37~2_combout\ & (((\Add0~30_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & ((\Mux33~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Add0~30_combout\,
	datad => \Mux33~1_combout\,
	combout => \Mux33~4_combout\);

-- Location: LCCOMB_X114_Y33_N8
\EXEWB_result~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~6_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux33~4_combout\) # ((div_quot(6) & \Mux38~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_quot(6),
	datab => \div_state.DIV_RUN~q\,
	datac => \Mux33~4_combout\,
	datad => \Mux38~3_combout\,
	combout => \EXEWB_result~6_combout\);

-- Location: FF_X114_Y33_N9
\EXEWB_result[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(6));

-- Location: FF_X112_Y31_N23
\R3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(6),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(6));

-- Location: LCCOMB_X112_Y31_N30
\Rs_val_fwd[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[6]~10_combout\ = (IFID_rs_id(1) & (((IFID_rs_id(0))))) # (!IFID_rs_id(1) & ((IFID_rs_id(0) & (R1(6))) # (!IFID_rs_id(0) & ((R0(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rs_id(1),
	datab => R1(6),
	datac => IFID_rs_id(0),
	datad => R0(6),
	combout => \Rs_val_fwd[6]~10_combout\);

-- Location: LCCOMB_X112_Y31_N0
\Rs_val_fwd[6]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[6]~11_combout\ = (\Rs_val_fwd[6]~10_combout\ & ((R3(6)) # ((!IFID_rs_id(1))))) # (!\Rs_val_fwd[6]~10_combout\ & (((R2(6) & IFID_rs_id(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(6),
	datab => R2(6),
	datac => \Rs_val_fwd[6]~10_combout\,
	datad => IFID_rs_id(1),
	combout => \Rs_val_fwd[6]~11_combout\);

-- Location: LCCOMB_X113_Y32_N28
\Rs_val_fwd[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[6]~9_combout\ = (!\Rs_val_fwd[0]~0_combout\ & ((\fwd_rs_wb~combout\ & (EXEWB_result(6))) # (!\fwd_rs_wb~combout\ & ((\Mux33~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datab => EXEWB_result(6),
	datac => \Mux33~3_combout\,
	datad => \fwd_rs_wb~combout\,
	combout => \Rs_val_fwd[6]~9_combout\);

-- Location: LCCOMB_X112_Y32_N16
\Rs_val_fwd[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rs_val_fwd[6]~12_combout\ = (\Rs_val_fwd[6]~9_combout\) # ((\Rs_val_fwd[6]~11_combout\ & \Rs_val_fwd[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rs_val_fwd[6]~11_combout\,
	datac => \Rs_val_fwd[0]~0_combout\,
	datad => \Rs_val_fwd[6]~9_combout\,
	combout => \Rs_val_fwd[6]~12_combout\);

-- Location: FF_X110_Y33_N5
\IDEXE_rs_val[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => \Rs_val_fwd[6]~12_combout\,
	sload => VCC,
	ena => \ALT_INV_div_state.DIV_RUN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IDEXE_rs_val(6));

-- Location: LCCOMB_X110_Y33_N26
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = IDEXE_opcode(3) $ (!IDEXE_rs_val(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IDEXE_opcode(3),
	datad => IDEXE_rs_val(6),
	combout => \Add0~12_combout\);

-- Location: LCCOMB_X111_Y33_N28
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = \Add0~33_combout\ $ (\Add0~31\ $ (\Add0~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~33_combout\,
	datad => \Add0~32_combout\,
	cin => \Add0~31\,
	combout => \Add0~34_combout\);

-- Location: LCCOMB_X110_Y32_N20
\Mux32~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux32~2_combout\ = (\Mux37~2_combout\ & (((\Add0~34_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & (\Mux32~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Mux32~1_combout\,
	datad => \Add0~34_combout\,
	combout => \Mux32~2_combout\);

-- Location: LCCOMB_X110_Y32_N14
\Mux32~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux32~3_combout\ = (\Mux32~2_combout\) # ((div_quot(7) & \Mux38~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => div_quot(7),
	datac => \Mux38~3_combout\,
	datad => \Mux32~2_combout\,
	combout => \Mux32~3_combout\);

-- Location: LCCOMB_X110_Y32_N12
\Rt_val_fwd[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[7]~30_combout\ = (\Rt_val_fwd[7]~29_combout\) # ((\fwd_rt_exe~combout\ & \Mux32~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fwd_rt_exe~combout\,
	datab => \Rt_val_fwd[7]~29_combout\,
	datac => \Mux32~3_combout\,
	combout => \Rt_val_fwd[7]~30_combout\);

-- Location: LCCOMB_X110_Y32_N2
\Equal15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal15~2_combout\ = (!\Rt_val_fwd[7]~30_combout\ & (!\Rt_val_fwd[3]~26_combout\ & (\Equal15~0_combout\ & \Equal15~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[7]~30_combout\,
	datab => \Rt_val_fwd[3]~26_combout\,
	datac => \Equal15~0_combout\,
	datad => \Equal15~1_combout\,
	combout => \Equal15~2_combout\);

-- Location: LCCOMB_X109_Y32_N18
\div_count[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_count[2]~1_combout\ = (\div_count[2]~0_combout\) # ((div_count(2) & ((\Equal15~2_combout\) # (!\process_4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_count[2]~0_combout\,
	datab => \process_4~1_combout\,
	datac => div_count(2),
	datad => \Equal15~2_combout\,
	combout => \div_count[2]~1_combout\);

-- Location: FF_X109_Y32_N19
\div_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_count[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_count(2));

-- Location: LCCOMB_X107_Y32_N6
\Decoder0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~7_combout\ = (!div_count(1) & (!div_count(2) & (!div_count(0) & !\LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \LessThan1~14_combout\,
	combout => \Decoder0~7_combout\);

-- Location: LCCOMB_X107_Y32_N4
\div_quot[7]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[7]~32_combout\ = (\div_state.DIV_RUN~q\ & (((!\Decoder0~7_combout\)))) # (!\div_state.DIV_RUN~q\ & (((IFID_opcode(3))) # (!\process_4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_4~0_combout\,
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \Decoder0~7_combout\,
	combout => \div_quot[7]~32_combout\);

-- Location: LCCOMB_X107_Y32_N8
\div_quot[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_quot[7]~24_combout\ = (\div_quot[7]~32_combout\ & (div_quot(7))) # (!\div_quot[7]~32_combout\ & ((\div_quot~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_quot[7]~32_combout\,
	datac => div_quot(7),
	datad => \div_quot~16_combout\,
	combout => \div_quot[7]~24_combout\);

-- Location: FF_X107_Y32_N9
\div_quot[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_quot[7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_quot(7));

-- Location: LCCOMB_X113_Y33_N4
\Mux32~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux32~4_combout\ = (\Mux37~2_combout\ & (((\Add0~34_combout\)))) # (!\Mux37~2_combout\ & (IDEXE_opcode(3) & (\Mux32~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(3),
	datab => \Mux37~2_combout\,
	datac => \Mux32~1_combout\,
	datad => \Add0~34_combout\,
	combout => \Mux32~4_combout\);

-- Location: LCCOMB_X113_Y32_N12
\EXEWB_result~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~7_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux32~4_combout\) # ((\Mux38~3_combout\ & div_quot(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \Mux38~3_combout\,
	datac => div_quot(7),
	datad => \Mux32~4_combout\,
	combout => \EXEWB_result~7_combout\);

-- Location: FF_X113_Y32_N13
\EXEWB_result[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(7));

-- Location: FF_X111_Y29_N15
\R3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(7),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(7));

-- Location: LCCOMB_X111_Y29_N10
\Rt_val_fwd[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[7]~27_combout\ = (IFID_rt_id(0) & (((IFID_rt_id(1))))) # (!IFID_rt_id(0) & ((IFID_rt_id(1) & ((R2(7)))) # (!IFID_rt_id(1) & (R0(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R0(7),
	datac => R2(7),
	datad => IFID_rt_id(1),
	combout => \Rt_val_fwd[7]~27_combout\);

-- Location: LCCOMB_X111_Y29_N24
\Rt_val_fwd[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[7]~28_combout\ = (IFID_rt_id(0) & ((\Rt_val_fwd[7]~27_combout\ & (R3(7))) # (!\Rt_val_fwd[7]~27_combout\ & ((R1(7)))))) # (!IFID_rt_id(0) & (((\Rt_val_fwd[7]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_rt_id(0),
	datab => R3(7),
	datac => R1(7),
	datad => \Rt_val_fwd[7]~27_combout\,
	combout => \Rt_val_fwd[7]~28_combout\);

-- Location: LCCOMB_X111_Y31_N10
\Rt_val_fwd[7]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Rt_val_fwd[7]~29_combout\ = (!\fwd_rt_exe~combout\ & ((\fwd_rt_wb~1_combout\ & ((EXEWB_result(7)))) # (!\fwd_rt_wb~1_combout\ & (\Rt_val_fwd[7]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[7]~28_combout\,
	datab => EXEWB_result(7),
	datac => \fwd_rt_exe~combout\,
	datad => \fwd_rt_wb~1_combout\,
	combout => \Rt_val_fwd[7]~29_combout\);

-- Location: LCCOMB_X112_Y32_N26
\Equal15~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal15~3_combout\ = (!\Rt_val_fwd[7]~29_combout\ & (!\Rt_val_fwd[3]~26_combout\ & ((!\Mux32~3_combout\) # (!\fwd_rt_exe~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt_val_fwd[7]~29_combout\,
	datab => \fwd_rt_exe~combout\,
	datac => \Rt_val_fwd[3]~26_combout\,
	datad => \Mux32~3_combout\,
	combout => \Equal15~3_combout\);

-- Location: LCCOMB_X107_Y32_N16
\div_divisor[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_divisor[0]~0_combout\ = (!IFID_opcode(3) & (!\div_state.DIV_RUN~q\ & \process_4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IFID_opcode(3),
	datac => \div_state.DIV_RUN~q\,
	datad => \process_4~0_combout\,
	combout => \div_divisor[0]~0_combout\);

-- Location: LCCOMB_X112_Y32_N4
\div_divisor[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_divisor[0]~1_combout\ = (\div_divisor[0]~0_combout\ & (((!\Equal15~1_combout\) # (!\Equal15~0_combout\)) # (!\Equal15~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~3_combout\,
	datab => \div_divisor[0]~0_combout\,
	datac => \Equal15~0_combout\,
	datad => \Equal15~1_combout\,
	combout => \div_divisor[0]~1_combout\);

-- Location: LCCOMB_X112_Y32_N0
\div_count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_count[0]~3_combout\ = (div_count(0) & (((!\div_state~7_combout\ & !\div_divisor[0]~1_combout\)))) # (!div_count(0) & (\div_state.DIV_RUN~q\ & ((\div_state~7_combout\) # (\div_divisor[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \div_state~7_combout\,
	datac => div_count(0),
	datad => \div_divisor[0]~1_combout\,
	combout => \div_count[0]~3_combout\);

-- Location: FF_X112_Y32_N1
\div_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_count(0));

-- Location: LCCOMB_X112_Y32_N22
\div_count[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_count[1]~2_combout\ = (\div_state~8_combout\ & (\div_state.DIV_RUN~q\ & (div_count(0) $ (div_count(1))))) # (!\div_state~8_combout\ & (((div_count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => div_count(0),
	datac => div_count(1),
	datad => \div_state~8_combout\,
	combout => \div_count[1]~2_combout\);

-- Location: FF_X112_Y32_N23
\div_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_count[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_count(1));

-- Location: LCCOMB_X109_Y32_N4
\div_state~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_state~7_combout\ = (\div_state.DIV_RUN~q\ & (((!div_count(0)) # (!div_count(2))) # (!div_count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_count(1),
	datab => div_count(2),
	datac => div_count(0),
	datad => \div_state.DIV_RUN~q\,
	combout => \div_state~7_combout\);

-- Location: LCCOMB_X112_Y32_N28
\div_state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \div_state~8_combout\ = (\div_state~7_combout\) # ((\div_divisor[0]~0_combout\ & !\Equal15~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \div_state~7_combout\,
	datac => \div_divisor[0]~0_combout\,
	datad => \Equal15~2_combout\,
	combout => \div_state~8_combout\);

-- Location: FF_X112_Y32_N29
\div_state.DIV_RUN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \div_state~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div_state.DIV_RUN~q\);

-- Location: LCCOMB_X113_Y32_N30
\EXEWB_result~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \EXEWB_result~3_combout\ = (!\div_state.DIV_RUN~q\ & ((\Mux36~2_combout\) # ((\Mux38~3_combout\ & div_quot(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \div_state.DIV_RUN~q\,
	datab => \Mux38~3_combout\,
	datac => div_quot(3),
	datad => \Mux36~2_combout\,
	combout => \EXEWB_result~3_combout\);

-- Location: FF_X113_Y32_N31
\EXEWB_result[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	d => \EXEWB_result~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => EXEWB_result(3));

-- Location: FF_X112_Y31_N19
\R3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_KEY[0]~input_o\,
	asdata => EXEWB_result(3),
	sload => VCC,
	ena => \Mux60~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => R3(3));

-- Location: LCCOMB_X113_Y31_N8
\Mux20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (\SW[13]~input_o\ & (\SW[12]~input_o\)) # (!\SW[13]~input_o\ & ((\SW[12]~input_o\ & ((R1(3)))) # (!\SW[12]~input_o\ & (R0(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[13]~input_o\,
	datab => \SW[12]~input_o\,
	datac => R0(3),
	datad => R1(3),
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X113_Y31_N6
\Mux20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux20~1_combout\ = (\Mux20~0_combout\ & ((R3(3)) # ((!\SW[13]~input_o\)))) # (!\Mux20~0_combout\ & (((\SW[13]~input_o\ & R2(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(3),
	datab => \Mux20~0_combout\,
	datac => \SW[13]~input_o\,
	datad => R2(3),
	combout => \Mux20~1_combout\);

-- Location: LCCOMB_X112_Y29_N10
\Mux22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (\SW[13]~input_o\ & (((\SW[12]~input_o\)))) # (!\SW[13]~input_o\ & ((\SW[12]~input_o\ & (R1(1))) # (!\SW[12]~input_o\ & ((R0(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(1),
	datab => \SW[13]~input_o\,
	datac => R0(1),
	datad => \SW[12]~input_o\,
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X112_Y29_N16
\Mux22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux22~1_combout\ = (\SW[13]~input_o\ & ((\Mux22~0_combout\ & (R3(1))) # (!\Mux22~0_combout\ & ((R2(1)))))) # (!\SW[13]~input_o\ & (((\Mux22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(1),
	datab => \SW[13]~input_o\,
	datac => R2(1),
	datad => \Mux22~0_combout\,
	combout => \Mux22~1_combout\);

-- Location: LCCOMB_X113_Y31_N4
\Mux23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & ((R2(0)))) # (!\SW[13]~input_o\ & (R0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(0),
	datab => \SW[12]~input_o\,
	datac => \SW[13]~input_o\,
	datad => R2(0),
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X113_Y31_N26
\Mux23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux23~1_combout\ = (\SW[12]~input_o\ & ((\Mux23~0_combout\ & (R3(0))) # (!\Mux23~0_combout\ & ((R1(0)))))) # (!\SW[12]~input_o\ & (((\Mux23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(0),
	datab => \SW[12]~input_o\,
	datac => R1(0),
	datad => \Mux23~0_combout\,
	combout => \Mux23~1_combout\);

-- Location: LCCOMB_X112_Y29_N26
\Mux21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = (\SW[12]~input_o\ & (((\SW[13]~input_o\)))) # (!\SW[12]~input_o\ & ((\SW[13]~input_o\ & (R2(2))) # (!\SW[13]~input_o\ & ((R0(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => R2(2),
	datac => R0(2),
	datad => \SW[13]~input_o\,
	combout => \Mux21~0_combout\);

-- Location: LCCOMB_X112_Y31_N2
\Mux21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux21~1_combout\ = (\SW[12]~input_o\ & ((\Mux21~0_combout\ & (R3(2))) # (!\Mux21~0_combout\ & ((R1(2)))))) # (!\SW[12]~input_o\ & (((\Mux21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(2),
	datab => \SW[12]~input_o\,
	datac => R1(2),
	datad => \Mux21~0_combout\,
	combout => \Mux21~1_combout\);

-- Location: LCCOMB_X109_Y54_N28
\Mux79~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux79~0_combout\ = (\Mux20~1_combout\ & (\Mux23~1_combout\ & (\Mux22~1_combout\ $ (\Mux21~1_combout\)))) # (!\Mux20~1_combout\ & (!\Mux22~1_combout\ & (\Mux23~1_combout\ $ (\Mux21~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux79~0_combout\);

-- Location: LCCOMB_X109_Y54_N2
\Mux78~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux78~0_combout\ = (\Mux20~1_combout\ & ((\Mux23~1_combout\ & (\Mux22~1_combout\)) # (!\Mux23~1_combout\ & ((\Mux21~1_combout\))))) # (!\Mux20~1_combout\ & (\Mux21~1_combout\ & (\Mux22~1_combout\ $ (\Mux23~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux78~0_combout\);

-- Location: LCCOMB_X109_Y54_N0
\Mux77~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux77~0_combout\ = (\Mux20~1_combout\ & (\Mux21~1_combout\ & ((\Mux22~1_combout\) # (!\Mux23~1_combout\)))) # (!\Mux20~1_combout\ & (\Mux22~1_combout\ & (!\Mux23~1_combout\ & !\Mux21~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux77~0_combout\);

-- Location: LCCOMB_X109_Y54_N30
\Mux76~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux76~0_combout\ = (\Mux22~1_combout\ & ((\Mux23~1_combout\ & ((\Mux21~1_combout\))) # (!\Mux23~1_combout\ & (\Mux20~1_combout\ & !\Mux21~1_combout\)))) # (!\Mux22~1_combout\ & (!\Mux20~1_combout\ & (\Mux23~1_combout\ $ (\Mux21~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux76~0_combout\);

-- Location: LCCOMB_X109_Y54_N12
\Mux75~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux75~0_combout\ = (\Mux22~1_combout\ & (!\Mux20~1_combout\ & (\Mux23~1_combout\))) # (!\Mux22~1_combout\ & ((\Mux21~1_combout\ & (!\Mux20~1_combout\)) # (!\Mux21~1_combout\ & ((\Mux23~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux75~0_combout\);

-- Location: LCCOMB_X109_Y54_N14
\Mux74~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux74~0_combout\ = (\Mux22~1_combout\ & (!\Mux20~1_combout\ & ((\Mux23~1_combout\) # (!\Mux21~1_combout\)))) # (!\Mux22~1_combout\ & (\Mux23~1_combout\ & (\Mux20~1_combout\ $ (!\Mux21~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux74~0_combout\);

-- Location: LCCOMB_X109_Y54_N4
\Mux73~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux73~0_combout\ = (\Mux23~1_combout\ & ((\Mux20~1_combout\) # (\Mux22~1_combout\ $ (\Mux21~1_combout\)))) # (!\Mux23~1_combout\ & ((\Mux22~1_combout\) # (\Mux20~1_combout\ $ (\Mux21~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux20~1_combout\,
	datab => \Mux22~1_combout\,
	datac => \Mux23~1_combout\,
	datad => \Mux21~1_combout\,
	combout => \Mux73~0_combout\);

-- Location: LCCOMB_X112_Y29_N30
\Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\SW[13]~input_o\ & (((\SW[12]~input_o\)))) # (!\SW[13]~input_o\ & ((\SW[12]~input_o\ & (R1(5))) # (!\SW[12]~input_o\ & ((R0(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(5),
	datab => \SW[13]~input_o\,
	datac => R0(5),
	datad => \SW[12]~input_o\,
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X112_Y29_N20
\Mux18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux18~1_combout\ = (\Mux18~0_combout\ & ((R3(5)) # ((!\SW[13]~input_o\)))) # (!\Mux18~0_combout\ & (((R2(5) & \SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~0_combout\,
	datab => R3(5),
	datac => R2(5),
	datad => \SW[13]~input_o\,
	combout => \Mux18~1_combout\);

-- Location: LCCOMB_X113_Y31_N24
\Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\SW[13]~input_o\ & ((\SW[12]~input_o\) # ((R2(6))))) # (!\SW[13]~input_o\ & (!\SW[12]~input_o\ & ((R0(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[13]~input_o\,
	datab => \SW[12]~input_o\,
	datac => R2(6),
	datad => R0(6),
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X112_Y31_N22
\Mux17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~1_combout\ = (\SW[12]~input_o\ & ((\Mux17~0_combout\ & ((R3(6)))) # (!\Mux17~0_combout\ & (R1(6))))) # (!\SW[12]~input_o\ & (((\Mux17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => R1(6),
	datac => R3(6),
	datad => \Mux17~0_combout\,
	combout => \Mux17~1_combout\);

-- Location: LCCOMB_X112_Y29_N18
\Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (\SW[12]~input_o\ & ((\SW[13]~input_o\) # ((R1(7))))) # (!\SW[12]~input_o\ & (!\SW[13]~input_o\ & (R0(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[12]~input_o\,
	datab => \SW[13]~input_o\,
	datac => R0(7),
	datad => R1(7),
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X112_Y29_N12
\Mux16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux16~1_combout\ = (\Mux16~0_combout\ & (((R3(7))) # (!\SW[13]~input_o\))) # (!\Mux16~0_combout\ & (\SW[13]~input_o\ & (R2(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux16~0_combout\,
	datab => \SW[13]~input_o\,
	datac => R2(7),
	datad => R3(7),
	combout => \Mux16~1_combout\);

-- Location: LCCOMB_X113_Y31_N12
\Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\SW[13]~input_o\ & ((\SW[12]~input_o\) # ((R2(4))))) # (!\SW[13]~input_o\ & (!\SW[12]~input_o\ & (R0(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[13]~input_o\,
	datab => \SW[12]~input_o\,
	datac => R0(4),
	datad => R2(4),
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X113_Y31_N22
\Mux19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux19~1_combout\ = (\SW[12]~input_o\ & ((\Mux19~0_combout\ & (R3(4))) # (!\Mux19~0_combout\ & ((R1(4)))))) # (!\SW[12]~input_o\ & (((\Mux19~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(4),
	datab => \SW[12]~input_o\,
	datac => R1(4),
	datad => \Mux19~0_combout\,
	combout => \Mux19~1_combout\);

-- Location: LCCOMB_X114_Y28_N12
\Mux86~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux86~0_combout\ = (\Mux17~1_combout\ & (!\Mux18~1_combout\ & (\Mux16~1_combout\ $ (!\Mux19~1_combout\)))) # (!\Mux17~1_combout\ & (\Mux19~1_combout\ & (\Mux18~1_combout\ $ (!\Mux16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux86~0_combout\);

-- Location: LCCOMB_X114_Y28_N18
\Mux85~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux85~0_combout\ = (\Mux18~1_combout\ & ((\Mux19~1_combout\ & ((\Mux16~1_combout\))) # (!\Mux19~1_combout\ & (\Mux17~1_combout\)))) # (!\Mux18~1_combout\ & (\Mux17~1_combout\ & (\Mux16~1_combout\ $ (\Mux19~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux85~0_combout\);

-- Location: LCCOMB_X114_Y28_N28
\Mux84~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux84~0_combout\ = (\Mux17~1_combout\ & (\Mux16~1_combout\ & ((\Mux18~1_combout\) # (!\Mux19~1_combout\)))) # (!\Mux17~1_combout\ & (\Mux18~1_combout\ & (!\Mux16~1_combout\ & !\Mux19~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux84~0_combout\);

-- Location: LCCOMB_X114_Y28_N2
\Mux83~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux83~0_combout\ = (\Mux18~1_combout\ & ((\Mux17~1_combout\ & ((\Mux19~1_combout\))) # (!\Mux17~1_combout\ & (\Mux16~1_combout\ & !\Mux19~1_combout\)))) # (!\Mux18~1_combout\ & (!\Mux16~1_combout\ & (\Mux17~1_combout\ $ (\Mux19~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux83~0_combout\);

-- Location: LCCOMB_X114_Y28_N8
\Mux82~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux82~0_combout\ = (\Mux18~1_combout\ & (((!\Mux16~1_combout\ & \Mux19~1_combout\)))) # (!\Mux18~1_combout\ & ((\Mux17~1_combout\ & (!\Mux16~1_combout\)) # (!\Mux17~1_combout\ & ((\Mux19~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux82~0_combout\);

-- Location: LCCOMB_X114_Y28_N6
\Mux81~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux81~0_combout\ = (\Mux18~1_combout\ & (!\Mux16~1_combout\ & ((\Mux19~1_combout\) # (!\Mux17~1_combout\)))) # (!\Mux18~1_combout\ & (\Mux19~1_combout\ & (\Mux17~1_combout\ $ (!\Mux16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux81~0_combout\);

-- Location: LCCOMB_X114_Y28_N16
\Mux80~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux80~0_combout\ = (\Mux19~1_combout\ & ((\Mux16~1_combout\) # (\Mux18~1_combout\ $ (\Mux17~1_combout\)))) # (!\Mux19~1_combout\ & ((\Mux18~1_combout\) # (\Mux17~1_combout\ $ (\Mux16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux18~1_combout\,
	datab => \Mux17~1_combout\,
	datac => \Mux16~1_combout\,
	datad => \Mux19~1_combout\,
	combout => \Mux80~0_combout\);

-- Location: LCCOMB_X113_Y31_N14
\Mux28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux28~0_combout\ = (\SW[15]~input_o\ & (((\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & ((\SW[14]~input_o\ & (R1(3))) # (!\SW[14]~input_o\ & ((R0(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => R1(3),
	datac => \SW[14]~input_o\,
	datad => R0(3),
	combout => \Mux28~0_combout\);

-- Location: LCCOMB_X113_Y31_N28
\Mux28~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux28~1_combout\ = (\SW[15]~input_o\ & ((\Mux28~0_combout\ & ((R3(3)))) # (!\Mux28~0_combout\ & (R2(3))))) # (!\SW[15]~input_o\ & (((\Mux28~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => R2(3),
	datac => \Mux28~0_combout\,
	datad => R3(3),
	combout => \Mux28~1_combout\);

-- Location: LCCOMB_X113_Y31_N2
\Mux31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = (\SW[14]~input_o\ & (((\SW[15]~input_o\)))) # (!\SW[14]~input_o\ & ((\SW[15]~input_o\ & ((R2(0)))) # (!\SW[15]~input_o\ & (R0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(0),
	datab => R2(0),
	datac => \SW[14]~input_o\,
	datad => \SW[15]~input_o\,
	combout => \Mux31~0_combout\);

-- Location: LCCOMB_X113_Y31_N20
\Mux31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux31~1_combout\ = (\SW[14]~input_o\ & ((\Mux31~0_combout\ & ((R3(0)))) # (!\Mux31~0_combout\ & (R1(0))))) # (!\SW[14]~input_o\ & (((\Mux31~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datab => R1(0),
	datac => R3(0),
	datad => \Mux31~0_combout\,
	combout => \Mux31~1_combout\);

-- Location: LCCOMB_X111_Y29_N28
\Mux29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (\SW[15]~input_o\ & (((R2(2)) # (\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & (R0(2) & ((!\SW[14]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(2),
	datab => R2(2),
	datac => \SW[15]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \Mux29~0_combout\);

-- Location: LCCOMB_X112_Y29_N4
\Mux29~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~1_combout\ = (\Mux29~0_combout\ & (((R3(2)) # (!\SW[14]~input_o\)))) # (!\Mux29~0_combout\ & (R1(2) & ((\SW[14]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux29~0_combout\,
	datab => R1(2),
	datac => R3(2),
	datad => \SW[14]~input_o\,
	combout => \Mux29~1_combout\);

-- Location: LCCOMB_X111_Y29_N12
\Mux30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (\SW[15]~input_o\ & (((\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & ((\SW[14]~input_o\ & ((R1(1)))) # (!\SW[14]~input_o\ & (R0(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R0(1),
	datab => \SW[15]~input_o\,
	datac => R1(1),
	datad => \SW[14]~input_o\,
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X111_Y29_N26
\Mux30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~1_combout\ = (\Mux30~0_combout\ & (((R3(1))) # (!\SW[15]~input_o\))) # (!\Mux30~0_combout\ & (\SW[15]~input_o\ & ((R2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux30~0_combout\,
	datab => \SW[15]~input_o\,
	datac => R3(1),
	datad => R2(1),
	combout => \Mux30~1_combout\);

-- Location: LCCOMB_X114_Y21_N28
\Mux93~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux93~0_combout\ = (\Mux28~1_combout\ & (\Mux31~1_combout\ & (\Mux29~1_combout\ $ (\Mux30~1_combout\)))) # (!\Mux28~1_combout\ & (!\Mux30~1_combout\ & (\Mux31~1_combout\ $ (\Mux29~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux93~0_combout\);

-- Location: LCCOMB_X114_Y21_N22
\Mux92~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux92~0_combout\ = (\Mux28~1_combout\ & ((\Mux31~1_combout\ & ((\Mux30~1_combout\))) # (!\Mux31~1_combout\ & (\Mux29~1_combout\)))) # (!\Mux28~1_combout\ & (\Mux29~1_combout\ & (\Mux31~1_combout\ $ (\Mux30~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux92~0_combout\);

-- Location: LCCOMB_X114_Y21_N20
\Mux91~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux91~0_combout\ = (\Mux28~1_combout\ & (\Mux29~1_combout\ & ((\Mux30~1_combout\) # (!\Mux31~1_combout\)))) # (!\Mux28~1_combout\ & (!\Mux31~1_combout\ & (!\Mux29~1_combout\ & \Mux30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux91~0_combout\);

-- Location: LCCOMB_X114_Y21_N14
\Mux90~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux90~0_combout\ = (\Mux30~1_combout\ & ((\Mux31~1_combout\ & ((\Mux29~1_combout\))) # (!\Mux31~1_combout\ & (\Mux28~1_combout\ & !\Mux29~1_combout\)))) # (!\Mux30~1_combout\ & (!\Mux28~1_combout\ & (\Mux31~1_combout\ $ (\Mux29~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux90~0_combout\);

-- Location: LCCOMB_X114_Y21_N4
\Mux89~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux89~0_combout\ = (\Mux30~1_combout\ & (!\Mux28~1_combout\ & (\Mux31~1_combout\))) # (!\Mux30~1_combout\ & ((\Mux29~1_combout\ & (!\Mux28~1_combout\)) # (!\Mux29~1_combout\ & ((\Mux31~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux89~0_combout\);

-- Location: LCCOMB_X114_Y21_N30
\Mux88~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux88~0_combout\ = (\Mux31~1_combout\ & (\Mux28~1_combout\ $ (((\Mux30~1_combout\) # (!\Mux29~1_combout\))))) # (!\Mux31~1_combout\ & (!\Mux28~1_combout\ & (!\Mux29~1_combout\ & \Mux30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux88~0_combout\);

-- Location: LCCOMB_X114_Y21_N12
\Mux87~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux87~0_combout\ = (\Mux31~1_combout\ & ((\Mux28~1_combout\) # (\Mux29~1_combout\ $ (\Mux30~1_combout\)))) # (!\Mux31~1_combout\ & ((\Mux30~1_combout\) # (\Mux28~1_combout\ $ (\Mux29~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~1_combout\,
	datab => \Mux31~1_combout\,
	datac => \Mux29~1_combout\,
	datad => \Mux30~1_combout\,
	combout => \Mux87~0_combout\);

-- Location: LCCOMB_X113_Y31_N18
\Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = (\SW[15]~input_o\ & ((R2(6)) # ((\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & (((!\SW[14]~input_o\ & R0(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => R2(6),
	datac => \SW[14]~input_o\,
	datad => R0(6),
	combout => \Mux25~0_combout\);

-- Location: LCCOMB_X112_Y31_N24
\Mux25~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux25~1_combout\ = (\SW[14]~input_o\ & ((\Mux25~0_combout\ & (R3(6))) # (!\Mux25~0_combout\ & ((R1(6)))))) # (!\SW[14]~input_o\ & (((\Mux25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(6),
	datab => \SW[14]~input_o\,
	datac => R1(6),
	datad => \Mux25~0_combout\,
	combout => \Mux25~1_combout\);

-- Location: LCCOMB_X113_Y31_N10
\Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = (\SW[15]~input_o\ & ((R2(4)) # ((\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & (((!\SW[14]~input_o\ & R0(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R2(4),
	datab => \SW[15]~input_o\,
	datac => \SW[14]~input_o\,
	datad => R0(4),
	combout => \Mux27~0_combout\);

-- Location: LCCOMB_X113_Y31_N16
\Mux27~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux27~1_combout\ = (\SW[14]~input_o\ & ((\Mux27~0_combout\ & (R3(4))) # (!\Mux27~0_combout\ & ((R1(4)))))) # (!\SW[14]~input_o\ & (((\Mux27~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R3(4),
	datab => R1(4),
	datac => \SW[14]~input_o\,
	datad => \Mux27~0_combout\,
	combout => \Mux27~1_combout\);

-- Location: LCCOMB_X111_Y29_N20
\Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (\SW[15]~input_o\ & (((\SW[14]~input_o\)))) # (!\SW[15]~input_o\ & ((\SW[14]~input_o\ & (R1(7))) # (!\SW[14]~input_o\ & ((R0(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R1(7),
	datab => R0(7),
	datac => \SW[15]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X111_Y29_N14
\Mux24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux24~1_combout\ = (\SW[15]~input_o\ & ((\Mux24~0_combout\ & ((R3(7)))) # (!\Mux24~0_combout\ & (R2(7))))) # (!\SW[15]~input_o\ & (((\Mux24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => R2(7),
	datac => R3(7),
	datad => \Mux24~0_combout\,
	combout => \Mux24~1_combout\);

-- Location: LCCOMB_X111_Y29_N2
\Mux26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = (\SW[14]~input_o\ & (((\SW[15]~input_o\) # (R1(5))))) # (!\SW[14]~input_o\ & (R0(5) & (!\SW[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datab => R0(5),
	datac => \SW[15]~input_o\,
	datad => R1(5),
	combout => \Mux26~0_combout\);

-- Location: LCCOMB_X111_Y29_N18
\Mux26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux26~1_combout\ = (\SW[15]~input_o\ & ((\Mux26~0_combout\ & ((R3(5)))) # (!\Mux26~0_combout\ & (R2(5))))) # (!\SW[15]~input_o\ & (((\Mux26~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => R2(5),
	datab => \SW[15]~input_o\,
	datac => R3(5),
	datad => \Mux26~0_combout\,
	combout => \Mux26~1_combout\);

-- Location: LCCOMB_X110_Y25_N0
\Mux100~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux100~0_combout\ = (\Mux25~1_combout\ & (!\Mux26~1_combout\ & (\Mux27~1_combout\ $ (!\Mux24~1_combout\)))) # (!\Mux25~1_combout\ & (\Mux27~1_combout\ & (\Mux24~1_combout\ $ (!\Mux26~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux100~0_combout\);

-- Location: LCCOMB_X110_Y25_N14
\Mux99~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux99~0_combout\ = (\Mux24~1_combout\ & ((\Mux27~1_combout\ & ((\Mux26~1_combout\))) # (!\Mux27~1_combout\ & (\Mux25~1_combout\)))) # (!\Mux24~1_combout\ & (\Mux25~1_combout\ & (\Mux27~1_combout\ $ (\Mux26~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux99~0_combout\);

-- Location: LCCOMB_X110_Y25_N28
\Mux98~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux98~0_combout\ = (\Mux25~1_combout\ & (\Mux24~1_combout\ & ((\Mux26~1_combout\) # (!\Mux27~1_combout\)))) # (!\Mux25~1_combout\ & (!\Mux27~1_combout\ & (!\Mux24~1_combout\ & \Mux26~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux98~0_combout\);

-- Location: LCCOMB_X110_Y25_N26
\Mux97~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux97~0_combout\ = (\Mux26~1_combout\ & ((\Mux25~1_combout\ & (\Mux27~1_combout\)) # (!\Mux25~1_combout\ & (!\Mux27~1_combout\ & \Mux24~1_combout\)))) # (!\Mux26~1_combout\ & (!\Mux24~1_combout\ & (\Mux25~1_combout\ $ (\Mux27~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux97~0_combout\);

-- Location: LCCOMB_X110_Y25_N4
\Mux96~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux96~0_combout\ = (\Mux26~1_combout\ & (((\Mux27~1_combout\ & !\Mux24~1_combout\)))) # (!\Mux26~1_combout\ & ((\Mux25~1_combout\ & ((!\Mux24~1_combout\))) # (!\Mux25~1_combout\ & (\Mux27~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux96~0_combout\);

-- Location: LCCOMB_X110_Y25_N2
\Mux95~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux95~0_combout\ = (\Mux25~1_combout\ & (\Mux27~1_combout\ & (\Mux24~1_combout\ $ (\Mux26~1_combout\)))) # (!\Mux25~1_combout\ & (!\Mux24~1_combout\ & ((\Mux27~1_combout\) # (\Mux26~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux95~0_combout\);

-- Location: LCCOMB_X110_Y25_N8
\Mux94~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux94~0_combout\ = (\Mux27~1_combout\ & ((\Mux24~1_combout\) # (\Mux25~1_combout\ $ (\Mux26~1_combout\)))) # (!\Mux27~1_combout\ & ((\Mux26~1_combout\) # (\Mux25~1_combout\ $ (\Mux24~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~1_combout\,
	datab => \Mux27~1_combout\,
	datac => \Mux24~1_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux94~0_combout\);

-- Location: LCCOMB_X107_Y31_N8
\Mux107~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux107~0_combout\ = (IFID_opcode(3) & (IFID_opcode(1) & (IFID_opcode(2) $ (IFID_opcode(0))))) # (!IFID_opcode(3) & (!IFID_opcode(0) & (IFID_opcode(2) $ (IFID_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux107~0_combout\);

-- Location: LCCOMB_X107_Y31_N26
\Mux106~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux106~0_combout\ = (IFID_opcode(3) & (!IFID_opcode(2) & (IFID_opcode(0) $ (IFID_opcode(1))))) # (!IFID_opcode(3) & ((IFID_opcode(0) & (!IFID_opcode(2))) # (!IFID_opcode(0) & ((!IFID_opcode(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux106~0_combout\);

-- Location: LCCOMB_X107_Y31_N0
\Mux105~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux105~0_combout\ = (IFID_opcode(3) & (IFID_opcode(2) & (IFID_opcode(0) & !IFID_opcode(1)))) # (!IFID_opcode(3) & (!IFID_opcode(2) & ((IFID_opcode(0)) # (!IFID_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux105~0_combout\);

-- Location: LCCOMB_X107_Y31_N30
\Mux104~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux104~0_combout\ = (IFID_opcode(1) & (IFID_opcode(3) & (IFID_opcode(2) $ (IFID_opcode(0))))) # (!IFID_opcode(1) & ((IFID_opcode(2) & (!IFID_opcode(3) & IFID_opcode(0))) # (!IFID_opcode(2) & ((!IFID_opcode(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux104~0_combout\);

-- Location: LCCOMB_X107_Y31_N20
\Mux103~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux103~0_combout\ = (IFID_opcode(1) & ((IFID_opcode(2) & ((!IFID_opcode(0)))) # (!IFID_opcode(2) & (IFID_opcode(3))))) # (!IFID_opcode(1) & (IFID_opcode(3) & ((!IFID_opcode(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux103~0_combout\);

-- Location: LCCOMB_X107_Y31_N10
\Mux102~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux102~0_combout\ = (IFID_opcode(2) & (IFID_opcode(3) & ((!IFID_opcode(1)) # (!IFID_opcode(0))))) # (!IFID_opcode(2) & (!IFID_opcode(0) & (IFID_opcode(3) $ (IFID_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux102~0_combout\);

-- Location: LCCOMB_X107_Y31_N12
\Mux101~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux101~0_combout\ = (IFID_opcode(0) & ((IFID_opcode(3) $ (IFID_opcode(2))) # (!IFID_opcode(1)))) # (!IFID_opcode(0) & ((IFID_opcode(2) $ (IFID_opcode(1))) # (!IFID_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Mux101~0_combout\);

-- Location: LCCOMB_X86_Y1_N28
\Mux114~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux114~0_combout\ = (\SW[11]~input_o\ & (\SW[8]~input_o\ & (\SW[9]~input_o\ $ (\SW[10]~input_o\)))) # (!\SW[11]~input_o\ & (!\SW[9]~input_o\ & (\SW[8]~input_o\ $ (\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux114~0_combout\);

-- Location: LCCOMB_X86_Y1_N18
\Mux113~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux113~0_combout\ = (\SW[9]~input_o\ & ((\SW[8]~input_o\ & (\SW[11]~input_o\)) # (!\SW[8]~input_o\ & ((\SW[10]~input_o\))))) # (!\SW[9]~input_o\ & (\SW[10]~input_o\ & (\SW[8]~input_o\ $ (\SW[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux113~0_combout\);

-- Location: LCCOMB_X86_Y1_N4
\Mux112~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux112~0_combout\ = (\SW[11]~input_o\ & (\SW[10]~input_o\ & ((\SW[9]~input_o\) # (!\SW[8]~input_o\)))) # (!\SW[11]~input_o\ & (\SW[9]~input_o\ & (!\SW[8]~input_o\ & !\SW[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux112~0_combout\);

-- Location: LCCOMB_X86_Y1_N6
\Mux111~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux111~0_combout\ = (\SW[9]~input_o\ & ((\SW[8]~input_o\ & ((\SW[10]~input_o\))) # (!\SW[8]~input_o\ & (\SW[11]~input_o\ & !\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & (!\SW[11]~input_o\ & (\SW[8]~input_o\ $ (\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux111~0_combout\);

-- Location: LCCOMB_X86_Y1_N24
\Mux110~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux110~0_combout\ = (\SW[9]~input_o\ & (\SW[8]~input_o\ & (!\SW[11]~input_o\))) # (!\SW[9]~input_o\ & ((\SW[10]~input_o\ & ((!\SW[11]~input_o\))) # (!\SW[10]~input_o\ & (\SW[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux110~0_combout\);

-- Location: LCCOMB_X86_Y1_N22
\Mux109~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux109~0_combout\ = (\SW[9]~input_o\ & (!\SW[11]~input_o\ & ((\SW[8]~input_o\) # (!\SW[10]~input_o\)))) # (!\SW[9]~input_o\ & (\SW[8]~input_o\ & (\SW[11]~input_o\ $ (!\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux109~0_combout\);

-- Location: LCCOMB_X86_Y1_N12
\Mux108~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux108~0_combout\ = (\SW[8]~input_o\ & ((\SW[11]~input_o\) # (\SW[9]~input_o\ $ (\SW[10]~input_o\)))) # (!\SW[8]~input_o\ & ((\SW[9]~input_o\) # (\SW[11]~input_o\ $ (\SW[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[11]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \Mux108~0_combout\);

-- Location: LCCOMB_X109_Y31_N12
\Mux121~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux121~0_combout\ = (IDEXE_opcode(3) & (IDEXE_opcode(1) & (IDEXE_opcode(0) $ (IDEXE_opcode(2))))) # (!IDEXE_opcode(3) & (!IDEXE_opcode(0) & (IDEXE_opcode(2) $ (IDEXE_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux121~0_combout\);

-- Location: LCCOMB_X109_Y31_N6
\Mux120~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux120~0_combout\ = (IDEXE_opcode(3) & (!IDEXE_opcode(2) & (IDEXE_opcode(0) $ (IDEXE_opcode(1))))) # (!IDEXE_opcode(3) & ((IDEXE_opcode(0) & (!IDEXE_opcode(2))) # (!IDEXE_opcode(0) & ((!IDEXE_opcode(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux120~0_combout\);

-- Location: LCCOMB_X109_Y31_N24
\Mux119~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux119~0_combout\ = (IDEXE_opcode(3) & (IDEXE_opcode(0) & (IDEXE_opcode(2) & !IDEXE_opcode(1)))) # (!IDEXE_opcode(3) & (!IDEXE_opcode(2) & ((IDEXE_opcode(0)) # (!IDEXE_opcode(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux119~0_combout\);

-- Location: LCCOMB_X109_Y31_N10
\Mux118~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux118~0_combout\ = (IDEXE_opcode(1) & (IDEXE_opcode(3) & (IDEXE_opcode(0) $ (IDEXE_opcode(2))))) # (!IDEXE_opcode(1) & ((IDEXE_opcode(0) & (!IDEXE_opcode(3) & IDEXE_opcode(2))) # (!IDEXE_opcode(0) & ((!IDEXE_opcode(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux118~0_combout\);

-- Location: LCCOMB_X109_Y31_N4
\Mux117~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux117~0_combout\ = (IDEXE_opcode(1) & ((IDEXE_opcode(2) & (!IDEXE_opcode(0))) # (!IDEXE_opcode(2) & ((IDEXE_opcode(3)))))) # (!IDEXE_opcode(1) & (!IDEXE_opcode(0) & (IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux117~0_combout\);

-- Location: LCCOMB_X109_Y31_N18
\Mux116~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux116~0_combout\ = (IDEXE_opcode(0) & (IDEXE_opcode(3) & (IDEXE_opcode(2) & !IDEXE_opcode(1)))) # (!IDEXE_opcode(0) & (IDEXE_opcode(3) $ (((!IDEXE_opcode(2) & IDEXE_opcode(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux116~0_combout\);

-- Location: LCCOMB_X109_Y31_N20
\Mux115~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux115~0_combout\ = (IDEXE_opcode(0) & ((IDEXE_opcode(3) $ (IDEXE_opcode(2))) # (!IDEXE_opcode(1)))) # (!IDEXE_opcode(0) & ((IDEXE_opcode(2) $ (IDEXE_opcode(1))) # (!IDEXE_opcode(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IDEXE_opcode(0),
	datab => IDEXE_opcode(3),
	datac => IDEXE_opcode(2),
	datad => IDEXE_opcode(1),
	combout => \Mux115~0_combout\);

-- Location: LCCOMB_X107_Y31_N14
\Equal14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (!IFID_opcode(3) & (!IFID_opcode(2) & (!IFID_opcode(0) & !IFID_opcode(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IFID_opcode(3),
	datab => IFID_opcode(2),
	datac => IFID_opcode(0),
	datad => IFID_opcode(1),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X107_Y31_N24
\process_3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_3~0_combout\ = (\IFID_valid~q\ & !\Equal14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IFID_valid~q\,
	datac => \Equal14~0_combout\,
	combout => \process_3~0_combout\);

-- Location: LCCOMB_X111_Y31_N28
\process_3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_3~1_combout\ = (\process_3~0_combout\ & (((\fwd_rt_exe~combout\) # (\fwd_rt_wb~1_combout\)) # (!\Rs_val_fwd[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs_val_fwd[0]~0_combout\,
	datab => \process_3~0_combout\,
	datac => \fwd_rt_exe~combout\,
	datad => \fwd_rt_wb~1_combout\,
	combout => \process_3~1_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;
END structure;


