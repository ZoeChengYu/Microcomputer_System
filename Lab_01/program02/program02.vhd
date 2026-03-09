library ieee;
use ieee.std_logic_1164.all;

entity program02 is
port(X,Y:in std_logic;
A,B:out std_logic_vector(6 downto 0));
end program02;

architecture display of program02 is
begin
A(0) <= not(X and not(Y));
A(1) <= not(Y and not(X));
A(2) <= not((X and not(Y)) or (Y and not(X)));
A(3) <= not(X and not(Y));
A(4) <= X or not(X);
A(5) <= not(X and not(Y));
A(6) <= not(X and not(Y));
B(0) <= not(Y and not(X));
B(1) <= not((X and not(Y)) or (Y and not(X)));
B(2) <= not((X and not(Y)) or (Y and not(X)));
B(3) <= X or not(X);
B(4) <= X or not(X);
B(5) <= X or not(X);
B(6) <= X or not(X);
end display;