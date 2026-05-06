library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity D_filp_flop is
    port(
        D      : in  std_logic;
        clock  : in  std_logic;
        preset : in  std_logic;
        clean  : in  std_logic;
        Q      : out std_logic;
        NQ     : out std_logic
    );
end entity D_filp_flop;

architecture func of D_filp_flop is
    --declarative part
begin
    --statements part
    process(clock, preset, clean)
    begin
        if preset = '0' then
            Q  <= '1';
            NQ <= '0';
        elsif clean = '0' then
            Q  <= '0';
            NQ <= '1';
        elsif rising_edge(clock) then
            Q  <= D;
            NQ <= not D;
        end if;
    end process;
end architecture func;

-- Package declaration
library ieee;
use ieee.std_logic_1164.all;

package D_filp_flop_package is
    component D_filp_flop
        port(
            D      : in  std_logic;
            clock  : in  std_logic;
            preset : in  std_logic;
            clean  : in  std_logic;
            Q      : out std_logic;
            NQ     : out std_logic
        );
    end component D_filp_flop;
end package D_filp_flop_package;