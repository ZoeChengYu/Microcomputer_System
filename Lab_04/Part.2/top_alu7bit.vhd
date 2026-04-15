LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY top_alu7bit IS
    PORT(
        SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
END top_alu7bit;

ARCHITECTURE struct OF top_alu7bit IS
    COMPONENT alu7bit
        PORT(
            A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    -- 無 PROCESS 版本的七段顯示解碼器 Component
    COMPONENT seg7
        PORT(
            din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            dout : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL A, B, result_sig : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL opcode : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL hex0_in, hex1_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    -- 腳位對應
    A <= SW(6 DOWNTO 0);
    B <= SW(13 DOWNTO 7);
    opcode <= SW(17 DOWNTO 14);

    -- 實例化 7-bit ALU
    ALU_INST : alu7bit PORT MAP(
        A => A, B => B, opcode => opcode,
        result => result_sig, overflow => LEDR(0)
    );

    -- 分配給七段顯示器的 4-bit 訊號
    hex0_in <= result_sig(3 DOWNTO 0);
    hex1_in <= '0' & result_sig(6 DOWNTO 4); -- 最高 3 bit 補 0 湊成 4 bit

    -- 實例化七段顯示器
    SEG0: seg7 PORT MAP(din => hex0_in, dout => HEX0);
    SEG1: seg7 PORT MAP(din => hex1_in, dout => HEX1);
END struct;


-- ==========================================
-- 七段顯示解碼器 (無 PROCESS 實作)
-- ==========================================
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7 IS
    PORT(
        din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END seg7;

ARCHITECTURE logic OF seg7 IS
BEGIN
    -- Active Low 配置 (0 為亮)
    WITH din SELECT
        dout <= "1000000" WHEN "0000", -- 0
                "1111001" WHEN "0001", -- 1
                "0100100" WHEN "0010", -- 2
                "0110000" WHEN "0011", -- 3
                "0011001" WHEN "0100", -- 4
                "0010010" WHEN "0101", -- 5
                "0000010" WHEN "0110", -- 6
                "1111000" WHEN "0111", -- 7
                "0000000" WHEN "1000", -- 8
                "0010000" WHEN "1001", -- 9
                "0001000" WHEN "1010", -- A
                "0000011" WHEN "1011", -- b
                "1000110" WHEN "1100", -- C
                "0100001" WHEN "1101", -- d
                "0000110" WHEN "1110", -- E
                "0001110" WHEN "1111", -- F
                "1111111" WHEN OTHERS;
END logic;