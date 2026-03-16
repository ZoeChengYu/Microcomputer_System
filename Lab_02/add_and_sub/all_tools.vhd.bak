library ieee;
use ieee.std_logic_1164.all;
use work.Pages.all;

entity project1 is
    port (
        sw_A  : in  std_logic_vector(7 downto 0);
        sw_B  : in  std_logic_vector(7 downto 0);
        seg_A : out std_logic_vector(6 downto 0);
        seg_B : out std_logic_vector(6 downto 0);
        Cout  : out std_logic
    );
end entity;

architecture structural of project1 is
    signal sum_res : std_logic_vector(7 downto 0);
    signal carry   : std_logic_vector(7 downto 0);
    signal i_Cin   : std_logic := '0';
begin

    stage0: FA port map(sw_A(0), sw_B(0) xor i_cin , i_Cin,    sum_res(0), carry(0));
    stage1: FA port map(sw_A(1), sw_B(1) xor i_cin , carry(0), sum_res(1), carry(1));
    stage2: FA port map(sw_A(2), sw_B(2) xor i_cin , carry(1), sum_res(2), carry(2));
    stage3: FA port map(sw_A(3), sw_B(3) xor i_cin , carry(2), sum_res(3), carry(3));
    stage4: FA port map(sw_A(4), sw_B(4) xor i_cin , carry(3), sum_res(4), carry(4));
    stage5: FA port map(sw_A(5), sw_B(5) xor i_cin , carry(4), sum_res(5), carry(5));
    stage6: FA port map(sw_A(6), sw_B(6) xor i_cin , carry(5), sum_res(6), carry(6));
    stage7: FA port map(sw_A(7), sw_B(7) xor i_cin , carry(6), sum_res(7), carry(7));

    display_unit: seven_displays port map (
        sw0 => sum_res(0), sw1 => sum_res(1), sw2 => sum_res(2), sw3 => sum_res(3),
        sw4 => sum_res(4), sw5 => sum_res(5), sw6 => sum_res(6), sw7 => sum_res(7),
        
        a0 => seg_A(0), a1 => seg_A(1), a2 => seg_A(2), a3 => seg_A(3), 
        a4 => seg_A(4), a5 => seg_A(5), a6 => seg_A(6),
        
        b0 => seg_B(0), b1 => seg_B(1), b2 => seg_B(2), b3 => seg_B(3), 
        b4 => seg_B(4), b5 => seg_B(5), b6 => seg_B(6)
    );
	 
	 Cout <= carry(7) xor i_Cin;

end architecture;