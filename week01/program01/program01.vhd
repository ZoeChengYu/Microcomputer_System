library ieee;
use ieee.std_logic_1164.all;

entity program01 is
port(W,X,Y,Z:in std_logic;
a,b,c,d,e,f,g:out std_logic);
end program01;

architecture LED of program01 is
begin
a<=(not(W) and not(X) and not(Y) and Z)or(W and not(X) and Y and Z)or(W and not(Y) and X)or(X and not(Y) and not(Z));
b<=((not(W) or Y or not(Z))and(W or not(Y) or not(Z))and(W or Y or Z)and(X or Z));
c<=(not(W) and not(X) and Y and not(Z))or(W and X and not(Z))or(W and X and Y);
d<=(not(X) and not(Y) and Z)or(not(W) and X and not(Y) and not(Z))or(X and Y and Z)or(W and not(X) and Y and not(Z));
e<=(not(W) and Z)or(not(W) and X and not(Y))or(not(X) and not(Y) and Z);
f<=(not(W) and not(X) and Z)or(not(W) and not(X) and Y)or(not(W) and Y and Z)or(W and X and not(Y));
g<=(not(W) and not(X) and not(Y))or(not(W) and X and Y and Z);
end LED;