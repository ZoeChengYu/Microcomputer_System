library ieee;
use ieee.std_logic_1164.all;

package FA_pg is
    component FA
        port(
            A,B,Ci:in std_logic;
            S,Co:out std_logic
        );
    end component FA;
end package;