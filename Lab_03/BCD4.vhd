library ieee;
use ieee.std_logic_1164.all;
use work.LAB03_package.all;

entity BCD4 is
    port(
        A,B:in std_logic_vector (3 downto 0);
        Ci:in std_logic;
        S: out std_logic_vector (3 downto 0);
        Co:out std_logic
    );
end entity BCD4;

architecture base of BCD4 is
    signal carry:std_logic_vector(3 downto 0);
    signal Tcarry:std_logic_vector(3 downto 0);
    signal sum:std_logic_vector(3 downto 0);
    signal Tsum:std_logic_vector(3 downto 0);
    signal bcdmain:std_logic;
begin
    stage0: FA port map(A(0),B(0),Ci,Tsum(0),Tcarry(0));
    stage1: FA port map(A(1),B(1),Tcarry(0),Tsum(1),Tcarry(1));
    stage2: FA port map(A(2),B(2),Tcarry(1),Tsum(2),Tcarry(2));
    stage3: FA port map(A(3),B(3),Tcarry(2),Tsum(3),Tcarry(3));

    bcdmain <= Tcarry(3) or (Tsum(3) and Tsum(2)) or (Tsum(3) and Tsum(1));

    stage4: FA port map(Tsum(0),'0','0',sum(0),carry(0));
    stage5: FA port map(Tsum(1),bcdmain,carry(0),sum(1),carry(1));
    stage6: FA port map(Tsum(2),bcdmain,carry(1),sum(2),carry(2));
    stage7: FA port map(Tsum(3),'0',carry(2),sum(3),carry(3));

    Co <= bcdmain;
    S <= sum;
end architecture base;