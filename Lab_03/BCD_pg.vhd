library ieee;
use ieee.std_logic_1164.all;

package BCD_pg is
    component BCD4
        port(
            A,B:in std_logic_vector (3 downto 0);
            Ci:in std_logic;
            S: out std_logic_vector (3 downto 0);
            Co:out std_logic
        );
    end component BCD4;
    
    component seven_displays is
        port(
            sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7:in std_logic;
            a0,a1,a2,a3,a4,a5,a6,b0,b1,b2,b3,b4,b5,b6:out std_logic
        );
    end component seven_displays;
end package;