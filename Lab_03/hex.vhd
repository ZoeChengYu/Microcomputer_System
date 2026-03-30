library ieee;
use ieee.std_logic_1164.all;

entity hex is
    port(
        w, x, y, z : in std_logic;
        a, b, c, d, e, f, g: out std_logic
    );
end hex;

architecture logic of hex is
begin
    -- Active Low: 0 = Lit, 1 = Dark
    a <= (not w and not x and not y and z) or (not w and x and not y and not z);
    b <= (not w and x and not y and z) or (not w and x and y and not z);
    c <= (not w and not x and y and not z);
    d <= (not w and not x and not y and z) or (not w and x and not y and not z) or (not w and x and y and z);
    e <= z or (x and not y);
    f <= (not w and not x and z) or (not w and not x and y) or (not w and y and z);
    g <= (not w and not x and not y) or (not w and x and y and z);
end logic;