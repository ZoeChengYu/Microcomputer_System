library ieee;
use ieee.std_logic_1164.all;

entity seven_displays is
    port(
        sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7:in std_logic;
        a0,a1,a2,a3,a4,a5,a6,b0,b1,b2,b3,b4,b5,b6:out std_logic
    );
end seven_displays;

architecture displays of seven_displays is
    signal A, B, C, D : STD_LOGIC;
begin
    -- Segment a (a0) - Dark for Hex: 1, 4, B, C, D
    a0 <= (sw0 and not sw1 and not sw2 and not sw3) or 
          (not sw0 and not sw1 and sw2 and not sw3) or 
          (sw0 and sw1 and not sw2 and sw3) or 
          (not sw0 and not sw1 and sw2 and sw3) or 
          (sw0 and not sw1 and sw2 and sw3);

    -- Segment b (a1) - Dark for Hex: 5, 6, B, C, E, F
    a1 <= (sw0 and not sw1 and sw2 and not sw3) or 
          (not sw0 and sw1 and sw2 and not sw3) or 
          (sw0 and sw1 and not sw2 and sw3) or 
          (not sw0 and not sw1 and sw2 and sw3) or 
          (not sw0 and sw1 and sw2 and sw3) or 
          (sw0 and sw1 and sw2 and sw3);

    -- Segment c (a2) - Dark for Hex: 2, C, E, F
    a2 <= (not sw0 and sw1 and not sw2 and not sw3) or 
          (not sw0 and not sw1 and sw2 and sw3) or 
          (not sw0 and sw1 and sw2 and sw3) or 
          (sw0 and sw1 and sw2 and sw3);

    -- Segment d (a3) - Dark for Hex: 1, 4, 7, A,F
    a3 <= (sw0 and not sw1 and not sw2 and not sw3) or 
          (not sw0 and not sw1 and sw2 and not sw3) or 
          (sw0 and sw1 and sw2 and not sw3) or 
          (not sw0 and sw1 and not sw2 and sw3)or
			 (sw0 and sw1 and sw2 and sw3);

    -- Segment e (a4) - Dark for Hex: 1, 3, 4, 5, 7, 9
    a4 <= (sw0 and not sw1 and not sw2 and not sw3) or 
          (sw0 and sw1 and not sw2 and not sw3) or 
          (not sw0 and not sw1 and sw2 and not sw3) or 
          (sw0 and not sw1 and sw2 and not sw3) or 
          (sw0 and sw1 and sw2 and not sw3) or 
          (sw0 and not sw1 and not sw2 and sw3);

    -- Segment f (a5) - Dark for Hex: 1, 2, 3, 7, C, D
    a5 <= (sw0 and not sw1 and not sw2 and not sw3) or 
          (not sw0 and sw1 and not sw2 and not sw3) or 
          (sw0 and sw1 and not sw2 and not sw3) or 
          (sw0 and sw1 and sw2 and not sw3) or 
          (not sw0 and not sw1 and sw2 and sw3) or 
          (sw0 and not sw1 and sw2 and sw3);

    -- Segment g (a6) - Dark for Hex: 0, 7,1
    a6 <= (not sw1 and not sw2 and not sw3) or 
          (sw0 and sw1 and sw2 and not sw3);
    
    -- Assigning switch inputs to logic variables
    A <= sw4; -- 2^0
    B <= sw5; -- 2^1
    C <= sw6; -- 2^2
    D <= sw7; -- 2^3

    -- Segment Logic (Active Low: 1 = Dark, 0 = Lit)
    
    -- a = b0
    b0 <= (A and not B and not C and not D) or (not A and not B and C and not D) or 
          (A and B and not C and D) or (not A and not B and C and D) or 
          (A and not B and C and D);

    -- b = b1
    b1 <= (A and not B and C and not D) or (not A and B and C and not D) or 
          (A and B and not C and D) or (not A and not B and C and D) or 
          (not A and B and C and D) or (A and B and C and D);

    -- c = b2
    b2 <= (not A and B and not C and not D) or (not A and not B and C and D) or 
          (not A and B and C and D) or (A and B and C and D);

    -- d = b3
    b3 <= (A and not B and not C and not D) or (not A and not B and C and not D) or 
          (A and B and C and not D) or (not A and B and not C and D) or (A and B and C and D);

    -- e = b4
    b4 <= (A and not B and not C and not D) or (A and B and not C and not D) or 
          (not A and not B and C and not D) or (A and not B and C and not D) or 
          (A and B and C and not D) or (A and not B and not C and D);

    -- f = b5
    b5 <= (A and not B and not C and not D) or (not A and B and not C and not D) or 
          (A and B and not C and not D) or (A and B and C and not D) or 
          (not A and not B and C and D) or (A and not B and C and D);

    -- g = b6
    b6 <= (not B and not C and not D) or (A and B and C and not D);

end displays;
