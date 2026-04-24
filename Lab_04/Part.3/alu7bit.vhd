LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu7bit IS
    PORT(
        A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        overflow : OUT STD_LOGIC
    );
END alu7bit;

ARCHITECTURE Structure OF alu7bit IS
    COMPONENT onebitALU
        PORT(
            A, B, less, carryin: IN STD_LOGIC;
            opcode: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            result, set, carryout: OUT STD_LOGIC
        );
    END COMPONENT;

    -- c(0) 到 c(7) 儲存進位傳遞，set_out 儲存各 bit 的加法結果
    SIGNAL c : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL set_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    -- 減法或 set-less-than 時，需要加 1，將 opcode(2) 傳入初始 carryin
    c(0) <= opcode(2);

    G_ALU: FOR i IN 0 TO 6 GENERATE
        -- Bit 0: less 必須接 Bit 6 的 set 輸出
        G_BIT0: IF i = 0 GENERATE
            ALU0: onebitALU PORT MAP (
                A => A(i), B => B(i), less => set_out(6), carryin => c(i),
                opcode => opcode, result => result(i), set => set_out(i), carryout => c(i+1)
            );
        END GENERATE;

        -- Bit 1~6: less 固定輸入 '0'
        G_BIT_REST: IF i > 0 GENERATE
            ALU_REST: onebitALU PORT MAP (
                A => A(i), B => B(i), less => '0', carryin => c(i),
                opcode => opcode, result => result(i), set => set_out(i), carryout => c(i+1)
            );
        END GENERATE;
    END GENERATE;

    -- 溢位判斷 (Overflow detection)
    overflow <= c(6) XOR c(7);
END Structure;