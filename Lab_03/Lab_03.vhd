library ieee;
use ieee.std_logic_1164.all;
use work.LAB03_package.all;

entity LAB_03 is
    port(
        A,B: in std_logic_vector (7 downto 0);
        a0, b0, c0, d0, e0, f0, g0: out std_logic;
        a1, b1, c1, d1, e1, f1, g1: out std_logic;
        overflow0,overflow1: out std_logic
    );
end entity LAB_03;

architecture structure of LAB_03 is
    signal sum_low: std_logic_vector(3 downto 0);
    signal sum_high: std_logic_vector(3 downto 0);
    signal carry_mid: std_logic;
	 signal s_o : std_logic;
begin
    -- 處理個位數的 BCD 加法
    stage0: BCD4 port map (
        A(3 downto 0), 
        B(3 downto 0), 
        '0', 
        sum_low, 
        carry_mid
    );

    -- 處理十位數的 BCD 加法
    stage1: BCD4 port map (
        A(7 downto 4), 
        B(7 downto 4), 
        carry_mid, 
        sum_high, 
        s_o
    );

    -- 個位數七段顯示器 (HEX0)
    display0: hex port map (
        w => sum_low(3), x => sum_low(2), y => sum_low(1), z => sum_low(0),
        a => a0, b => b0, c => c0, d => d0, e => e0, f => f0, g => g0
    );

    -- 十位數七段顯示器 (HEX1)
    display1: hex port map (
        w => sum_high(3), x => sum_high(2), y => sum_high(1), z => sum_high(0),
        a => a1, b => b1, c => c1, d => d1, e => e1, f => f1, g => g1
    );
	 overflow0<=not(s_o);
	 overflow1<=not(s_o);

end architecture structure;