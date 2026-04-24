LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY onebitALU IS
    PORT(
        A, B, less, carryin: IN STD_LOGIC;
        opcode: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        result, set, carryout: OUT STD_LOGIC
    );
END onebitALU;

ARCHITECTURE LogicFunc OF onebitALU IS
    SIGNAL a_val, b_val : STD_LOGIC;
    SIGNAL and_res, or_res, add_res : STD_LOGIC;
BEGIN
    -- opcode(3) 控制 Ainvert (僅在 nor 1100 時為 1)
    a_val <= NOT A WHEN opcode(3) = '1' ELSE A;
    
    -- opcode(2) 控制 Bnegate (在 subtract 0110, slt 0111, nor 1100 時為 1)
    b_val <= NOT B WHEN opcode(2) = '1' ELSE B;

    -- 基本邏輯運算
    and_res <= a_val AND b_val;
    or_res  <= a_val OR b_val;

    -- 全加器邏輯 (Full Adder)
    add_res  <= a_val XOR b_val XOR carryin;
    carryout <= (a_val AND b_val) OR (a_val AND carryin) OR (b_val AND carryin);

    -- Set 輸出即為加法器的結果，會提供給 Bit 6 判斷正負號使用
    set <= add_res;

    -- Mux 多工器：根據 opcode(1 DOWNTO 0) 決定最終 Result
    -- 00: and, 01: or, 10: add/subtract, 11: set-on-less-than
    process (opcode)
        BEGIN
            case opcode(1 DOWNTO 0) IS
                when "00" => result <= and_res;
                when "01" => result <= or_res;
                when "10" => result <= add_res;
                when others => result <= less;
            end case;
        end process;
END LogicFunc;