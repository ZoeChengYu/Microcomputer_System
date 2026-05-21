--------------------------------------------------------------------------------
-- Course: Microprocessor Systems (2026)
-- Laboratory: Lab 07 - Multi-Purpose Shift Register Component (Reused from Lab 05)
-- File: N_bit_DFF.vhd
-- Description: N-bit universal shift register featuring synchronous clean, 
--              parallel load, and left/right serial shift with serial input (sdi).
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity n_bit_DFF is
    generic( N : integer := 10 ); -- Default to 10 bits, adjustable via generic map
    port( 
        clk    : in  std_logic;
        clean  : in  std_logic;
        load   : in  std_logic;
        lr_sel : in  std_logic;
        di     : in  std_logic_vector(N-1 downto 0);
        sdi    : in  std_logic;
        qo     : out std_logic_vector(N-1 downto 0)
    );
end entity n_bit_DFF;

architecture Behavioral of n_bit_DFF is
    signal reg : std_logic_vector(N-1 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if clean = '1' then
                reg <= (others => '0');
            elsif load = '1' then
                reg <= di;
            elsif lr_sel = '1' then
                -- Left shift (towards MSB), LSB filled with sdi
                for i in N-1 downto 1 loop
                    reg(i) <= reg(i-1);
                end loop;
                reg(0) <= sdi;
            elsif lr_sel = '0' then
                -- Right shift (towards LSB), MSB filled with sdi
                for i in 0 to N-2 loop
                    reg(i) <= reg(i+1);
                end loop;
                reg(N-1) <= sdi;
            end if;
        end if;
    end process;

    qo <= reg;

end architecture Behavioral;
