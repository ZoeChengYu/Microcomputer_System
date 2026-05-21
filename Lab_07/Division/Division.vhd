--------------------------------------------------------------------------------
-- Course: Microprocessor Systems (2026)
-- Laboratory: Lab 07 - 8-Bit Restoring Division Hardware Design (Structural)
-- Author: Yang Cheng-Yu (楊承諭) / Student ID: 113590051
-- File: Division.vhd
-- Description: Complete structural VHDL implementation of an 8-bit restoring divider.
--              Instantiates the universal shift register 'n_bit_DFF' from Lab 05 
--              for all three registers (Q, D, R) to strictly satisfy lab requirements.
--              Includes a 6-state FSM, 16-hex 7-segment display at state S4, 
--              and real-time LED tracking of active quotient and remainder values.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Division is
    port(
        Clock     : in  std_logic;                     -- PIN_M23 (KEY[0]) system clock input
        Reset     : in  std_logic;                     -- PIN_Y24 (SW[16]) active-high reset switch
        Divisor   : in  std_logic_vector(7 downto 0);  -- SW[7..0] 8-bit divisor input (B)
        Dividend  : in  std_logic_vector(7 downto 0);  -- SW[15..8] 8-bit dividend input (A)
        Quotient  : out std_logic_vector(7 downto 0);  -- LED[7..0] active quotient display
        Remainder : out std_logic_vector(7 downto 0);  -- LED[15..8] active remainder display
        HEX0      : out std_logic_vector(6 downto 0);  -- HEX0 display for Quotient (lower nibble)
        HEX1      : out std_logic_vector(6 downto 0);  -- HEX1 display for Quotient (upper nibble)
        HEX2      : out std_logic_vector(6 downto 0);  -- HEX2 display for Remainder (lower nibble)
        HEX3      : out std_logic_vector(6 downto 0)   -- HEX3 display for Remainder (upper nibble)
    );
end entity Division;

architecture Structural of Division is

    -- 1. Declare the universal shift register from Lab 05 as a component
    component n_bit_DFF is
        generic( N : integer := 10 );
        port( 
            clk    : in  std_logic;
            clean  : in  std_logic;
            load   : in  std_logic;
            lr_sel : in  std_logic;
            di     : in  std_logic_vector(N-1 downto 0);
            sdi    : in  std_logic;
            qo     : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- 2. FSM States definition
    type state_type is (Start, S1, S2a, S2b, S3, S4);
    signal current_state : state_type := Start;
    signal count         : integer range 0 to 9 := 0;  -- Repetition counter (9 steps: 0 to 8)

    -- 3. Register interface signals
    -- Quotient (Q) Register Signals (8-bit)
    signal clean_Q  : std_logic;
    signal load_Q   : std_logic;
    signal lr_sel_Q : std_logic;
    signal sdi_Q    : std_logic;
    signal di_Q     : std_logic_vector(7 downto 0);
    signal qo_Q     : std_logic_vector(7 downto 0);

    -- Divisor (D) Register Signals (17-bit)
    signal clean_D  : std_logic;
    signal load_D   : std_logic;
    signal lr_sel_D : std_logic;
    signal sdi_D    : std_logic;
    signal di_D     : std_logic_vector(16 downto 0);
    signal qo_D     : std_logic_vector(16 downto 0);

    -- Remainder (R) Register Signals (17-bit)
    signal clean_R  : std_logic;
    signal load_R   : std_logic;
    signal lr_sel_R : std_logic;
    signal sdi_R    : std_logic;
    signal di_R     : std_logic_vector(16 downto 0);
    signal qo_R     : std_logic_vector(16 downto 0);

    -- 4. Intermediate signals
    signal sub_res : std_logic_vector(16 downto 0);    -- Subtract result: Remainder - Divisor

    -- 5. Helper function to decode 4-bit nibbles to 7-segment display (Active-Low: '0' = ON, '1' = OFF)
    function to_seven_seg(nibble : std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        case nibble is
            when "0000" => return "1000000"; -- 0
            when "0001" => return "1111001"; -- 1
            when "0010" => return "0100100"; -- 2
            when "0011" => return "0110000"; -- 3
            when "0100" => return "0011001"; -- 4
            when "0101" => return "0010010"; -- 5
            when "0110" => return "0000010"; -- 6
            when "0111" => return "1111000"; -- 7
            when "1000" => return "0000000"; -- 8
            when "1001" => return "0010000"; -- 9
            when "1010" => return "0001000"; -- A
            when "1011" => return "0000011"; -- b
            when "1100" => return "1000110"; -- C
            when "1101" => return "0100001"; -- d
            when "1110" => return "0000110"; -- E
            when "1111" => return "0001110"; -- F
            when others => return "1111111"; -- Blank
        end case;
    end function;

begin

    ----------------------------------------------------------------------------
    -- Instantiation of the Lab 5 Multi-Purpose Registers (Q, D, R)
    ----------------------------------------------------------------------------
    
    -- Quotient Register (Q): 8-bit universal register
    reg_Q_inst : n_bit_DFF
        generic map( N => 8 )
        port map(
            clk    => Clock,
            clean  => clean_Q,
            load   => load_Q,
            lr_sel => lr_sel_Q,
            di     => di_Q,
            sdi    => sdi_Q,
            qo     => qo_Q
        );

    -- Divisor Register (D): 17-bit universal register
    reg_D_inst : n_bit_DFF
        generic map( N => 17 )
        port map(
            clk    => Clock,
            clean  => clean_D,
            load   => load_D,
            lr_sel => lr_sel_D,
            di     => di_D,
            sdi    => sdi_D,
            qo     => qo_D
        );

    -- Remainder Register (R): 17-bit universal register
    reg_R_inst : n_bit_DFF
        generic map( N => 17 )
        port map(
            clk    => Clock,
            clean  => clean_R,
            load   => load_R,
            lr_sel => lr_sel_R,
            di     => di_R,
            sdi    => sdi_R,
            qo     => qo_R
        );

    ----------------------------------------------------------------------------
    -- Combinational ALU and Datapath Connections
    ----------------------------------------------------------------------------
    -- Subtraction: Remainder (qo_R) - Divisor (qo_D)
    sub_res <= qo_R - qo_D;

    -- Real-time LED feedback: tracks register states as you press KEY[0]
    Quotient  <= qo_Q;
    Remainder <= qo_R(7 downto 0);

    ----------------------------------------------------------------------------
    -- Register Control Signal Logic: Synchronous Hold & Shift Operations
    ----------------------------------------------------------------------------
    process(current_state, Dividend, Divisor, qo_Q, qo_D, qo_R, sub_res)
    begin
        -- Default controls for Quotient (Q) Register
        clean_Q  <= '0';
        load_Q   <= '1';           -- Default to hold (load current output)
        lr_sel_Q <= '1';
        sdi_Q    <= '0';
        di_Q     <= qo_Q;          -- Feed back output to hold value

        -- Default controls for Divisor (D) Register
        clean_D  <= '0';
        load_D   <= '1';           -- Default to hold (load current output)
        lr_sel_D <= '0';
        sdi_D    <= '0';
        di_D     <= qo_D;          -- Feed back output to hold value

        -- Default controls for Remainder (R) Register
        clean_R  <= '0';
        load_R   <= '1';           -- Default to hold (load current output)
        lr_sel_R <= '1';
        sdi_R    <= '0';
        di_R     <= qo_R;          -- Feed back output to hold value

        case current_state is
            
            -- S0 (Start): Clean Quotient to 0 and parallel load Divisor / Dividend
            when Start =>
                clean_Q <= '1';    -- Synchronous clear
                load_Q  <= '0';
                
                load_D  <= '1';
                di_D    <= '0' & Divisor & "00000000"; -- Load Divisor in upper half
                
                load_R  <= '1';
                di_R    <= "000000000" & Dividend;     -- Load Dividend in lower half

            -- S1: Remainder subtraction step
            when S1 =>
                load_R  <= '1';
                di_R    <= sub_res; -- Load the subtraction result

            -- S2a (Remainder >= 0): Shift Quotient left and shift in '1'
            when S2a =>
                load_Q   <= '0';
                lr_sel_Q <= '1';    -- Select Left Shift
                sdi_Q    <= '1';    -- Shift in '1'

            -- S2b (Remainder < 0): Restore Remainder and shift Quotient left, shift in '0'
            when S2b =>
                load_R   <= '1';
                di_R     <= qo_R + qo_D; -- Restore Remainder (R = R + D)
                
                load_Q   <= '0';
                lr_sel_Q <= '1';    -- Select Left Shift
                sdi_Q    <= '0';    -- Shift in '0'

            -- S3: Shift Divisor right by 1
            when S3 =>
                load_D   <= '0';
                lr_sel_D <= '0';    -- Select Right Shift
                sdi_D    <= '0';    -- Shift in '0'

            -- S4 (Done): All registers hold their values frozen
            when S4 =>
                null; -- Hold values through default assignments (di <= qo)
                
        end case;
    end process;

    ----------------------------------------------------------------------------
    -- Synchronous FSM Transition & Step Counter Process
    ----------------------------------------------------------------------------
    process(Clock, Reset)
    begin
        if Reset = '1' then
            current_state <= Start;
            count <= 0;
        elsif rising_edge(Clock) then
            case current_state is
                
                when Start =>
                    count <= 0;
                    current_state <= S1;
                
                when S1 =>
                    if sub_res(16) = '0' then -- Subtraction result is positive
                        current_state <= S2a;
                    else                      -- Subtraction result is negative (underflow)
                        current_state <= S2b;
                    end if;
                
                when S2a =>
                    current_state <= S3;
                
                when S2b =>
                    current_state <= S3;
                
                when S3 =>
                    if count = 8 then
                        current_state <= S4; -- Transition to S4 upon 9th iteration
                    else
                        count <= count + 1;
                        current_state <= S1; -- Loop back to S1 for next bit
                    end if;
                
                when S4 =>
                    current_state <= S4;     -- Freeze in S4 until Reset is toggled
                    
            end case;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 7-Segment Displays Process: Shows Quotient and Remainder in Hex at S4
    ----------------------------------------------------------------------------
    process(current_state, qo_Q, qo_R)
    begin
        if current_state = S4 then
            -- Display final Quotient (on HEX1 & HEX0) and final Remainder (on HEX3 & HEX2)
            HEX0 <= to_seven_seg(qo_Q(3 downto 0));
            HEX1 <= to_seven_seg(qo_Q(7 downto 4));
            HEX2 <= to_seven_seg(qo_R(3 downto 0));
            HEX3 <= to_seven_seg(qo_R(7 downto 4));
        else
            -- Cleanly blank out all displays while FSM is actively computing
            HEX0 <= (others => '1');
            HEX1 <= (others => '1');
            HEX2 <= (others => '1');
            HEX3 <= (others => '1');
        end if;
    end process;

end architecture Structural;
