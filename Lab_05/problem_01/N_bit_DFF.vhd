library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.D_filp_flop_package.all;
-- 雖然你有 import package，但如果是使用 Process + For Loop 的行為級寫法，
-- 其實可以直接讓系統自動合成正反器，不需要手動 mapping component。

entity n_bit_DFF is
    generic( N : integer := 10 ); -- 使用 GENERIC 讓位元數可變 (預設 8-bit)
    port( 
        clk    : in  std_logic;
        clean  : in  std_logic;
        load   : in  std_logic;
        lr_sel : in  std_logic;
        di     : in  std_logic_vector(N-1 downto 0); -- 修正拼字錯誤
        sdi    : in  std_logic;
        qo     : out std_logic_vector(N-1 downto 0)  -- 修正拼字錯誤
    );
end entity n_bit_DFF;

architecture Behavioral of n_bit_DFF is
    -- 宣告一個內部訊號來暫存目前的暫存器狀態
    signal reg : std_logic_vector(N-1 downto 0) := (others => '0');
begin

    process(clk)
    begin
        -- 首先判斷 clk 是否正緣觸發
        if rising_edge(clk) then
            
            -- 設定 clear 決定是否清空暫存器 (同步清除)
            if clean = '1' then
                reg <= (others => '0');
                
            -- 設定 load 決定是否平行輸入 di
            elsif load = '1' then
                reg <= di;
                
            -- 設定 lr_sel 決定左移 (1)
            elsif lr_sel = '1' then
                -- 使用 FOR LOOP 產生左移 (向 MSB 移動)
                for i in N-1 downto 1 loop
                    reg(i) <= reg(i-1);
                end loop;
                -- 將 sdi 串列輸入最右邊位元 (LSB)
                reg(0) <= sdi;
                
            -- 設定 lr_sel 決定右移 (0)
            elsif lr_sel = '0' then
                -- 使用 FOR LOOP 產生右移 (向 LSB 移動)
                for i in 0 to N-2 loop
                    reg(i) <= reg(i+1);
                end loop;
                -- 將 sdi 串列輸入最左邊位元 (MSB)
                reg(N-1) <= sdi;
                
            end if;
        end if;
    end process;

    -- 將內部暫存器的值輸出
    qo <= reg;

end architecture Behavioral;