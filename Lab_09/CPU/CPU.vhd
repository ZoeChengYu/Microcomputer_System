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
--                 0000 = LOAD  Rs        : Rs <- Data
--                 0001 = MOVE  Rs, Rt    : Rs <- Rt
--                 0010 = ADD   Rs, Rt    : Rs <- Rs + Rt
--                 0011 = AND   Rs, Rt    : Rs <- Rs and Rt
--                 0100 = SLT   Rs, Rt    : if (Rs < Rt) Rs=1; else Rs=0
--                 0101 = SUB(A-B) Rs, Rt : Rs <- Rs - Rt
--                 1000 = DIV   Rs, Rt    : Rs <- Rs / Rt  (integer division)
--                 1001 = SUB(B-A) Rs, Rt : Rs <- Rt - Rs
--   SW[13:12] = Rs (destination register select, 2-bit)
--   SW[15:14] = Rt (source register select, 2-bit)
--
-- Inputs:
--   SW[15:0]  = Switches
--   KEY[0]    = Clock (push-button, active-low)
--
-- Outputs (7-segment displays, active-low):
--   HEX0, HEX1 = Bus value (units on HEX0, tens on HEX1)
--   HEX2, HEX3 = Rs register value (units on HEX2, tens on HEX3)
--   HEX4, HEX5 = Rt register value (units on HEX4, tens on HEX5)
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
    -- Integer division function for unsigned 8-bit values
    -- Returns Rs / Rt; returns 0xFF if Rt = 0 (division by zero guard)
    -- =========================================================================
    function udiv8(a : std_logic_vector(7 downto 0);
                   b : std_logic_vector(7 downto 0))
        return std_logic_vector is
        variable quotient  : std_logic_vector(7 downto 0);
        variable remainder : std_logic_vector(7 downto 0);
        variable dividend  : std_logic_vector(7 downto 0);
        variable divisor   : std_logic_vector(7 downto 0);
        variable i         : integer;
    begin
        quotient  := (others => '0');
        remainder := (others => '0');
        dividend  := a;
        divisor   := b;

        if divisor = "00000000" then
            -- Division by zero: return 0xFF as error sentinel
            quotient := "11111111";
        else
            -- Non-restoring style unsigned division (8 iterations)
            for i in 7 downto 0 loop
                remainder := remainder(6 downto 0) & dividend(i);
                if remainder >= divisor then
                    remainder := remainder - divisor;
                    quotient(i) := '1';
                else
                    quotient(i) := '0';
                end if;
            end loop;
        end if;
        return quotient;
    end function udiv8;

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

    -- Bus: 8-bit internal bus (continuously reflects current Data input)
    signal Bus_val : std_logic_vector(7 downto 0);

    -- Rs and Rt register values (combinational read)
    signal Rs_val : std_logic_vector(7 downto 0);
    signal Rt_val : std_logic_vector(7 downto 0);

    -- ALU result (combinational)
    signal ALU_result : std_logic_vector(7 downto 0);

    -- Opcodes
    constant OP_LOAD   : std_logic_vector(3 downto 0) := "0000"; -- LOAD  Rs
    constant OP_MOVE   : std_logic_vector(3 downto 0) := "0001"; -- MOVE  Rs, Rt
    constant OP_ADD    : std_logic_vector(3 downto 0) := "0010"; -- ADD   Rs, Rt
    constant OP_AND    : std_logic_vector(3 downto 0) := "0011"; -- AND   Rs, Rt
    constant OP_SLT    : std_logic_vector(3 downto 0) := "0100"; -- SLT   Rs, Rt
    constant OP_SUBA_B : std_logic_vector(3 downto 0) := "0101"; -- SUB(A-B) Rs, Rt
    constant OP_DIV    : std_logic_vector(3 downto 0) := "1000"; -- DIV   Rs, Rt
    constant OP_SUBB_A : std_logic_vector(3 downto 0) := "1001"; -- SUB(B-A) Rs, Rt

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
    --   Bus always shows Data from SW[7:0] (continuously updated)
    -- =========================================================================
    Bus_val <= Data;

    -- =========================================================================
    -- Combinational: ALU result
    -- =========================================================================
    process(Opcode, Rs_val, Rt_val, Data)
    begin
        case Opcode is
            when OP_LOAD =>
                -- LOAD: put Data on the result path
                ALU_result <= Data;

            when OP_MOVE =>
                -- MOVE Rs, Rt: Rs <- Rt
                ALU_result <= Rt_val;

            when OP_ADD =>
                -- ADD Rs, Rt: Rs <- Rs + Rt
                ALU_result <= Rs_val + Rt_val;

            when OP_AND =>
                -- AND Rs, Rt: Rs <- Rs and Rt
                ALU_result <= Rs_val and Rt_val;

            when OP_SLT =>
                -- SLT Rs, Rt: if (Rs < Rt) Rs=1; else Rs=0
                if Rs_val < Rt_val then
                    ALU_result <= "00000001";
                else
                    ALU_result <= "00000000";
                end if;

            when OP_SUBA_B =>
                -- SUB(A-B) Rs, Rt: Rs <- Rs - Rt
                ALU_result <= Rs_val - Rt_val;

            when OP_DIV =>
                -- DIV Rs, Rt: Rs <- Rs / Rt  (unsigned integer division)
                ALU_result <= udiv8(Rs_val, Rt_val);

            when OP_SUBB_A =>
                -- SUB(B-A) Rs, Rt: Rs <- Rt - Rs
                ALU_result <= Rt_val - Rs_val;

            when others =>
                ALU_result <= (others => '0');

        end case;
    end process;

    -- =========================================================================
    -- Sequential: Execute instruction on rising edge of clock (KEY[0] press)
    -- Writes the ALU result back to the destination register Rs
    -- =========================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            case Opcode is

                when OP_LOAD | OP_MOVE | OP_ADD | OP_AND |
                     OP_SLT  | OP_SUBA_B | OP_DIV | OP_SUBB_A =>
                    -- Write ALU_result to the Rs register
                    case Rs_sel is
                        when "00"   => R0 <= ALU_result;
                        when "01"   => R1 <= ALU_result;
                        when "10"   => R2 <= ALU_result;
                        when others => R3 <= ALU_result;
                    end case;

                when others => null;

            end case;
        end if;
    end process;

    -- =========================================================================
    -- Output: 7-Segment displays
    -- HEX0, HEX1 = Bus value  (lower nibble on HEX0, upper nibble on HEX1)
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
