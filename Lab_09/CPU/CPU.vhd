-- =============================================================================
-- Lab 09: Simple CPU Implementation
-- Description:
--   A simple processor supporting LOAD, MOVE, ADD, AND, SLT, SUB(A-B),
--   DIV, and SUB(B-A) instructions.
--   Uses FSM (Mealy machine) with 4 general-purpose 8-bit registers (R0~R3).
--
-- Instruction Format (16-bit switch input):
--   SW[7:0]   = Data (8-bit immediate value)
--   SW[11:8]  = Opcode (4-bit)
--                 0000 = LOAD     Rs        : Rs <- Data
--                 0001 = MOVE     Rs, Rt    : Rs <- Rt
--                 0010 = ADD      Rs, Rt    : Rs <- Rs + Rt
--                 0011 = AND      Rs, Rt    : Rs <- Rs and Rt
--                 0100 = SLT      Rs, Rt    : if (Rs < Rt) Rs=1; else Rs=0
--                 0101 = SUB(A-B) Rs, Rt    : Rs <- Rs - Rt
--                 1000 = DIV      Rs, Rt    : Rs <- Rs / Rt (integer division)
--                 1001 = SUB(B-A) Rs, Rt    : Rs <- Rt - Rs
--   SW[13:12] = Rs (destination register select, 2-bit)
--   SW[15:14] = Rt (source register select, 2-bit)
--
-- Inputs:
--   SW[15:0]  = Switches
--   KEY[0]    = Clock (push-button, active-low)
--
-- Outputs (7-segment displays, active-low):
--   HEX0, HEX1 = Bus value  (ALU output; HEX0=units, HEX1=tens)
--   HEX2, HEX3 = Rs value   (HEX2=units, HEX3=tens)
--   HEX4, HEX5 = Rt value   (HEX4=units, HEX5=tens)
--
-- Bus architecture note:
--   Bus_val is the COMBINATIONAL ALU output (the value that will be written
--   to Rs on the next rising clock edge).  The user can see the result on
--   HEX1/HEX0 before pressing KEY[0].
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPU is
    port (
        SW   : in  std_logic_vector(15 downto 0);
        KEY  : in  std_logic_vector(0 downto 0);
        HEX0 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        HEX2 : out std_logic_vector(6 downto 0);
        HEX3 : out std_logic_vector(6 downto 0);
        HEX4 : out std_logic_vector(6 downto 0);
        HEX5 : out std_logic_vector(6 downto 0)
    );
end entity CPU;

architecture Behavioral of CPU is

    -- =========================================================================
    -- 7-Segment Decoder (active-low, common-anode)
    -- Segments order: gfedcba (bit6=g, bit0=a)
    -- =========================================================================
    function hex_to_7seg(h : std_logic_vector(3 downto 0))
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case h is
            when "0000" => seg := "1000000"; -- 0
            when "0001" => seg := "1111001"; -- 1
            when "0010" => seg := "0100100"; -- 2
            when "0011" => seg := "0110000"; -- 3
            when "0100" => seg := "0011001"; -- 4
            when "0101" => seg := "0010010"; -- 5
            when "0110" => seg := "0000010"; -- 6
            when "0111" => seg := "1111000"; -- 7
            when "1000" => seg := "0000000"; -- 8
            when "1001" => seg := "0010000"; -- 9
            when "1010" => seg := "0001000"; -- A
            when "1011" => seg := "0000011"; -- b
            when "1100" => seg := "1000110"; -- C
            when "1101" => seg := "0100001"; -- d
            when "1110" => seg := "0000110"; -- E
            when "1111" => seg := "0001110"; -- F
            when others => seg := "1111111"; -- blank
        end case;
        return seg;
    end function hex_to_7seg;

    -- =========================================================================
    -- Unsigned 8-bit integer division (restoring algorithm)
    -- Returns 0xFF when divisor = 0 (division-by-zero guard)
    -- =========================================================================
    function udiv8(a : std_logic_vector(7 downto 0);
                   b : std_logic_vector(7 downto 0))
        return std_logic_vector is
        variable quotient  : std_logic_vector(7 downto 0);
        variable remainder : std_logic_vector(7 downto 0);
    begin
        quotient  := (others => '0');
        remainder := (others => '0');
        if b = "00000000" then
            quotient := "11111111";          -- divide-by-zero sentinel
        else
            for idx in 7 downto 0 loop
                remainder := remainder(6 downto 0) & a(idx);
                if remainder >= b then
                    remainder     := remainder - b;
                    quotient(idx) := '1';
                else
                    quotient(idx) := '0';
                end if;
            end loop;
        end if;
        return quotient;
    end function udiv8;

    -- =========================================================================
    -- Internal signals
    -- =========================================================================

    -- Register file (4 x 8-bit)
    signal R0 : std_logic_vector(7 downto 0) := (others => '0');
    signal R1 : std_logic_vector(7 downto 0) := (others => '0');
    signal R2 : std_logic_vector(7 downto 0) := (others => '0');
    signal R3 : std_logic_vector(7 downto 0) := (others => '0');

    -- Instruction fields
    signal Data   : std_logic_vector(7 downto 0); -- SW[7:0]
    signal Opcode : std_logic_vector(3 downto 0); -- SW[11:8]
    signal Rs_sel : std_logic_vector(1 downto 0); -- SW[13:12]
    signal Rt_sel : std_logic_vector(1 downto 0); -- SW[15:14]

    -- Active-high clock (KEY[0] is active-low push-button)
    signal clk : std_logic;

    -- Combinational register reads
    signal Rs_val : std_logic_vector(7 downto 0);
    signal Rt_val : std_logic_vector(7 downto 0);

    -- Bus value = ALU output (combinational; displayed on HEX1/HEX0 in real time)
    signal Bus_val : std_logic_vector(7 downto 0);

    -- Opcode constants
    constant OP_LOAD   : std_logic_vector(3 downto 0) := "0000";
    constant OP_MOVE   : std_logic_vector(3 downto 0) := "0001";
    constant OP_ADD    : std_logic_vector(3 downto 0) := "0010";
    constant OP_AND    : std_logic_vector(3 downto 0) := "0011";
    constant OP_SLT    : std_logic_vector(3 downto 0) := "0100";
    constant OP_SUBA_B : std_logic_vector(3 downto 0) := "0101";
    constant OP_DIV    : std_logic_vector(3 downto 0) := "1000";
    constant OP_SUBB_A : std_logic_vector(3 downto 0) := "1001";

begin

    -- =========================================================================
    -- Decode switch fields
    -- =========================================================================
    Data   <= SW(7  downto 0);
    Opcode <= SW(11 downto 8);
    Rs_sel <= SW(13 downto 12);
    Rt_sel <= SW(15 downto 14);

    -- Invert KEY[0]: rising edge = button pressed
    clk <= not KEY(0);

    -- =========================================================================
    -- Combinational: read Rs and Rt from register file
    -- =========================================================================
    process(Rs_sel, Rt_sel, R0, R1, R2, R3)
    begin
        case Rs_sel is
            when "00"   => Rs_val <= R0;
            when "01"   => Rs_val <= R1;
            when "10"   => Rs_val <= R2;
            when others => Rs_val <= R3;
        end case;

        case Rt_sel is
            when "00"   => Rt_val <= R0;
            when "01"   => Rt_val <= R1;
            when "10"   => Rt_val <= R2;
            when others => Rt_val <= R3;
        end case;
    end process;

    -- =========================================================================
    -- Combinational: ALU / Bus
    --   Bus_val is the data that WILL be written to Rs on the next clock edge.
    --   Displaying it lets the user verify the result before committing.
    -- =========================================================================
    process(Opcode, Rs_val, Rt_val, Data)
    begin
        case Opcode is
            when OP_LOAD =>
                Bus_val <= Data;                     -- Rs <- Data (immediate)

            when OP_MOVE =>
                Bus_val <= Rt_val;                   -- Rs <- Rt

            when OP_ADD =>
                Bus_val <= Rs_val + Rt_val;          -- Rs <- Rs + Rt

            when OP_AND =>
                Bus_val <= Rs_val and Rt_val;        -- Rs <- Rs & Rt

            when OP_SLT =>
                if Rs_val < Rt_val then              -- Rs <- (Rs < Rt) ? 1 : 0
                    Bus_val <= "00000001";
                else
                    Bus_val <= "00000000";
                end if;

            when OP_SUBA_B =>
                Bus_val <= Rs_val - Rt_val;          -- Rs <- Rs - Rt

            when OP_DIV =>
                Bus_val <= udiv8(Rs_val, Rt_val);   -- Rs <- Rs / Rt

            when OP_SUBB_A =>
                Bus_val <= Rt_val - Rs_val;          -- Rs <- Rt - Rs

            when others =>
                Bus_val <= (others => '0');
        end case;
    end process;

    -- =========================================================================
    -- Sequential: on rising edge of clock, write Bus_val into Rs register
    -- =========================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            if (Opcode = OP_LOAD   or Opcode = OP_MOVE   or
                Opcode = OP_ADD    or Opcode = OP_AND    or
                Opcode = OP_SLT    or Opcode = OP_SUBA_B or
                Opcode = OP_DIV    or Opcode = OP_SUBB_A) then
                case Rs_sel is
                    when "00"   => R0 <= Bus_val;
                    when "01"   => R1 <= Bus_val;
                    when "10"   => R2 <= Bus_val;
                    when others => R3 <= Bus_val;
                end case;
            end if;
        end if;
    end process;

    -- =========================================================================
    -- Outputs: 7-segment displays
    --   HEX1/HEX0 = Bus (ALU output, live / combinational)
    --   HEX3/HEX2 = Rs  register value
    --   HEX5/HEX4 = Rt  register value
    -- =========================================================================
    HEX0 <= hex_to_7seg(Bus_val(3 downto 0));
    HEX1 <= hex_to_7seg(Bus_val(7 downto 4));
    HEX2 <= hex_to_7seg(Rs_val(3 downto 0));
    HEX3 <= hex_to_7seg(Rs_val(7 downto 4));
    HEX4 <= hex_to_7seg(Rt_val(3 downto 0));
    HEX5 <= hex_to_7seg(Rt_val(7 downto 4));

end architecture Behavioral;
