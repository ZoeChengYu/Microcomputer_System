library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Lab 06: FSM for Shift Divider
-- Based on the provided state machine diagram and transition table.

entity FSM is
    port(
        clk    : in  std_logic; -- PIN_M23 (KEY[0])
        reset  : in  std_logic; -- PIN_AC28 (SW[1])
        w      : in  std_logic; -- PIN_AB28 (SW[0])
        output : out std_logic_vector(2 downto 0) -- PIN_F21, PIN_E19, PIN_F19 (LEDs)
    );
end entity FSM;

architecture Behavioral of FSM is
    -- Define state type using names from the lab presentation
    type state_type is (Start, S1, S2a, S2b, S3, S4);
    signal current_state, next_state : state_type;
begin

    -- Synchronous State Transition
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= Start;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Combinatorial Next State Logic
    process(current_state, w)
    begin
        case current_state is
            when Start =>
                if w = '1' then
                    next_state <= S1;
                else
                    next_state <= Start;
                end if;

            when S1 =>
                -- w=0: Remainder >= 0, w=1: Remainder < 0
                if w = '0' then
                    next_state <= S2a;
                else
                    next_state <= S2b;
                end if;

            when S2a =>
                -- Transition to S3 regardless of w
                next_state <= S3;

            when S2b =>
                -- Transition to S3 regardless of w
                next_state <= S3;

            when S3 =>
                -- w=0: repetitions < 9 (Not Done), w=1: 9th repetition (Done)
                if w = '0' then
                    next_state <= S1;
                else
                    next_state <= S4;
                end if;

            when S4 =>
                -- Done state, stay here or can be reset
                next_state <= S4;

            when others =>
                next_state <= Start;
        end case;
    end process;

    -- Output Assignment (3-bit state representation)
    -- Start: 000, S1: 001, S2a: 010, S2b: 011, S3: 100, S4: 101
    process(current_state)
    begin
        case current_state is
            when Start => output <= "000";
            when S1    => output <= "001";
            when S2a   => output <= "010";
            when S2b   => output <= "011";
            when S3    => output <= "100";
            when S4    => output <= "101";
            when others => output <= "000";
        end case;
    end process;

end architecture Behavioral;
