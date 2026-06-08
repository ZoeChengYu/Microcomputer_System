-- =============================================================================
-- Lab 08: Simple CPU Implementation
-- Description:
--   A simple processor supporting LOAD and MOVE instructions.
--   Uses FSM (Mealy machine) with 4 general-purpose 8-bit registers (R0~R3).
--
-- Instruction Format (16-bit switch input):
--   SW[7:0]   = Data (8-bit immediate value)
--   SW[11:8]  = Opcode (4-bit)
--                 0000 = LOAD Rs      : Rs <- Data
--                 0001 = MOVE Rs, Rt  : Rs <- Rt
--   SW[13:12] = Rs (destination register select, 2-bit)
--   SW[15:14] = Rt (source register select, 2-bit)
--
-- Inputs:
--   SW[15:0]  = Switches
--   KEY[0]    = Clock (push-button, active-low)
--
-- Outputs (7-segment displays, active-low):
--   HEX0, HEX1 = Bus value (8-bit, displayed as 2-digit hex)
--   HEX2, HEX3 = Rs register value
--   HEX4, HEX5 = Rt register value
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPU is
    port (
        SW  : in  std_logic_vector(15 downto 0);
        KEY : in  std_logic_vector(0 downto 0);
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
    -- 7-Segment Decoder Function (active-low, common-anode style)
    -- Segments: gfedcba (bit 6 = g, bit 0 = a)
    -- =========================================================================
    function hex_to_7seg(hex_val : std_logic_vector(3 downto 0))
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case hex_val is
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
    -- Internal signals
    -- =========================================================================

    -- Register file: R0, R1, R2, R3 (8-bit each)
    signal R0 : std_logic_vector(7 downto 0) := (others => '0');
    signal R1 : std_logic_vector(7 downto 0) := (others => '0');
    signal R2 : std_logic_vector(7 downto 0) := (others => '0');
    signal R3 : std_logic_vector(7 downto 0) := (others => '0');

    -- Instruction decode
    signal Data   : std_logic_vector(7 downto 0); -- SW[7:0]
    signal Opcode : std_logic_vector(3 downto 0); -- SW[11:8]
    signal Rs_sel : std_logic_vector(1 downto 0); -- SW[13:12]
    signal Rt_sel : std_logic_vector(1 downto 0); -- SW[15:14]

    -- Clock: KEY[0] is active-low push button; rising edge = button release
    -- We use the inverted signal so that pressing KEY[0] gives a rising edge
    signal clk : std_logic;

    -- Bus: 8-bit internal bus
    signal Bus_val : std_logic_vector(7 downto 0);

    -- Rs and Rt register values (combinational read)
    signal Rs_val : std_logic_vector(7 downto 0);
    signal Rt_val : std_logic_vector(7 downto 0);

    -- Opcodes
    constant OP_LOAD : std_logic_vector(3 downto 0) := "0000";
    constant OP_MOVE : std_logic_vector(3 downto 0) := "0001";

begin

    -- =========================================================================
    -- Input decode
    -- =========================================================================
    Data   <= SW(7 downto 0);
    Opcode <= SW(11 downto 8);
    Rs_sel <= SW(13 downto 12);
    Rt_sel <= SW(15 downto 14);

    -- Clock: KEY[0] is active-low; invert so rising edge = button press
    clk <= not KEY(0);

    -- =========================================================================
    -- Combinational: Read Rs and Rt from register file
    -- =========================================================================
    process(Rs_sel, Rt_sel, R0, R1, R2, R3)
    begin
        -- Read Rs
        case Rs_sel is
            when "00"   => Rs_val <= R0;
            when "01"   => Rs_val <= R1;
            when "10"   => Rs_val <= R2;
            when others => Rs_val <= R3;
        end case;

        -- Read Rt
        case Rt_sel is
            when "00"   => Rt_val <= R0;
            when "01"   => Rt_val <= R1;
            when "10"   => Rt_val <= R2;
            when others => Rt_val <= R3;
        end case;
    end process;

    -- =========================================================================
    -- Combinational: Bus value
    --   LOAD: Bus shows Data from SW[7:0]
    --   MOVE: Bus shows Rt register value
    --   Others: Bus shows 0x00
    -- =========================================================================
    process(Opcode, Data, Rt_val)
    begin
        case Opcode is
            when OP_LOAD => Bus_val <= Data;
            when OP_MOVE => Bus_val <= Rt_val;
            when others  => Bus_val <= (others => '0');
        end case;
    end process;

    -- =========================================================================
    -- Sequential: Execute instruction on rising edge of clock (KEY[0] press)
    -- =========================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            case Opcode is

                -- LOAD Rs: Rs <- Data (SW[7:0])
                when OP_LOAD =>
                    case Rs_sel is
                        when "00"   => R0 <= Data;
                        when "01"   => R1 <= Data;
                        when "10"   => R2 <= Data;
                        when others => R3 <= Data;
                    end case;

                -- MOVE Rs, Rt: Rs <- Rt
                when OP_MOVE =>
                    case Rs_sel is
                        when "00"   => R0 <= Rt_val;
                        when "01"   => R1 <= Rt_val;
                        when "10"   => R2 <= Rt_val;
                        when others => R3 <= Rt_val;
                    end case;

                when others => null;

            end case;
        end if;
    end process;

    -- =========================================================================
    -- Output: 7-Segment displays
    -- HEX0, HEX1 = Bus value (lower nibble on HEX0, upper nibble on HEX1)
    -- HEX2, HEX3 = Rs register value
    -- HEX4, HEX5 = Rt register value
    -- =========================================================================
    HEX0 <= hex_to_7seg(Bus_val(3 downto 0));
    HEX1 <= hex_to_7seg(Bus_val(7 downto 4));
    HEX2 <= hex_to_7seg(Rs_val(3 downto 0));
    HEX3 <= hex_to_7seg(Rs_val(7 downto 4));
    HEX4 <= hex_to_7seg(Rt_val(3 downto 0));
    HEX5 <= hex_to_7seg(Rt_val(7 downto 4));

end architecture Behavioral;
