library ieee;
use ieee.std_logic_1164.all;

package LAB03_package is
    component FA
        port(
            A,B,Ci:in std_logic;
            S,Co:out std_logic
        );
    end component FA;

    component BCD4
        port(
            A,B:in std_logic_vector (3 downto 0);
            Ci:in std_logic;
            S: out std_logic_vector (3 downto 0);
            Co:out std_logic
        );
    end component BCD4;
    
    component hex is
        port(
            w, x, y, z : in std_logic;
            a, b, c, d, e, f, g: out std_logic
        );
    end component hex;
end package LAB03_package;