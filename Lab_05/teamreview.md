# 微處理器系統實驗報告 - Lab 05

## 封面
* **實驗名稱**：Lab 05 移位萬用暫存器 (Shift Universal Register)
* **組別**：第 19 組
* **班級**：資工二
* **學號/姓名**：113590051 楊承諭、113590017 黃楷程
* **日期**：2026年5月13日

---

## 實驗內容
本次實驗目標是設計一個 **10位元移位萬用暫存器 (N-bit Shift Universal Register)**。該暫存器需具備以下功能：
1. **同步清除 (Synchronous Clear)**：當 `clean` 訊號為高電位時，在時脈正緣觸發下清空暫存器內容。
2. **平行載入 (Parallel Load)**：當 `load` 訊號為高電位時，將 10 位元的平行輸入 `di` 載入至暫存器。
3. **左移/右移 (Left/Right Shift)**：透過 `lr_sel` 選擇位移方向。
    * `lr_sel = '1'`：左移，並將串列輸入 `sdi` 補入 LSB。
    * `lr_sel = '0'`：右移，並將串列輸入 `sdi` 補入 MSB。
4. **輸出顯示**：透過 10 顆 LED 燈 (`qo`) 即時顯示暫存器內部的數值。

透過此實驗，我們掌握了 VHDL 中 `GENERIC` 的用法、`process` 內的同步控制邏輯，以及如何使用 `for loop` 簡化移位操作。

---

## 實驗過程及結果

### 實驗過程
1. **程式撰寫**：編寫 `N_bit_DFF.vhd`，使用 Behavioral 模型描述暫存器邏輯。其中使用了 `rising_edge(clk)` 確保所有動作皆在時脈正緣觸發。
2. **腳位分配**：
    * `clk` 分配至 `PIN_M23` (KEY0)。
    * `clean` 分配至 `PIN_AB23` (SW12)。
    * `load` 分配至 `PIN_AC24` (SW10)。
    * `lr_sel` 分配至 `PIN_AB24` (SW11)。
    * `sdi` 分配至 `PIN_AA24` (SW13)。
    * `di[9..0]` 分配至開關 `SW9` ~ `SW0`。
    * `qo[9..0]` 分配至紅光 LED `LEDR9` ~ `LEDR0`。
3. **燒錄驗證**：將專案編譯後燒錄至 Altera DE2-115 開發板，手動切換開關測試平行載入與位移功能。

### 實驗結果
以下為實驗過程中的完整硬體操作截圖：

#### 1. 初始與清除 (Clear)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **清除狀態**：當 `clean` 為 1 (SW12 為高) 時，按下 KEY0，所有 LED 保持熄滅。 | ![Reset](./Photo/IMG20260513212848.jpg) |

#### 2. 平行載入 (Parallel Load)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **設定輸入值**：調整 SW9~SW0 準備載入特定位元模式。 | ![Load_Setup](./Photo/IMG20260513213334.jpg) |
| **載入範例 1**：成功載入模式（如中間位元亮起）。 | ![Load_Ex1](./Photo/IMG20260513213403.jpg) |
| **載入範例 2**：載入另一種開關組合。 | ![Load_Ex2](./Photo/IMG20260513213427.jpg) |
| **載入範例 3**：更改開關後再次載入不同模式。 | ![Load_Ex3](./Photo/IMG20260513213435.jpg) |
| **載入範例 4**：測試全亮或特定模式。 | ![Load_Ex4](./Photo/IMG20260513213439.jpg) |

#### 3. 左移操作 (Left Shift)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **左移開始**：初始載入之數值。 | ![Shift_L1](./Photo/IMG20260513213526.jpg) |
| **左移過程 1**：按下 KEY0，位元向左（高位元）移動。 | ![Shift_L2](./Photo/IMG20260513213623.jpg) |
| **左移過程 2**：連續位移，觀察 LED 往左跳動。 | ![Shift_L3](./Photo/IMG20260513213633.jpg) |
| **左移過程 3**：位元持續移往 MSB。 | ![Shift_L4](./Photo/IMG20260513213706.jpg) |
| **左移過程 4**：位元即將移出邊界。 | ![Shift_L5](./Photo/IMG20260513213711.jpg) |

#### 4. 串列輸入與連續位移 (SDI & Shift)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **SDI 輸入 1**：設定 SW13 (sdi)，觀察新位元從 LSB 進入。 | ![SDI_1](./Photo/IMG20260513213716.jpg) |
| **SDI 輸入 2**：連續位移使 sdi 填滿低位元。 | ![SDI_2](./Photo/IMG20260513213719.jpg) |
| **SDI 輸入 3**：模式完整移入之狀態。 | ![SDI_3](./Photo/IMG20260513213753.jpg) |
| **位移序列 A**：展示連續位移的連貫性。 | ![Seq_A](./Photo/IMG20260513213801.jpg) |
| **位移序列 B**：展示連續位移的連貫性。 | ![Seq_B](./Photo/IMG20260513213833.jpg) |
| **位移序列 C**：展示連續位移的連貫性。 | ![Seq_C](./Photo/IMG20260513213859.jpg) |

#### 5. 右移操作 (Right Shift)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **右移操作**：切換 SW11 (lr_sel) 為 0，位元向右（低位元）移動。 | ![Shift_Right](./Photo/IMG20260513214908.jpg) |
| **右移至結束**：觀察數值逐位移向 LEDR0。 | ![Shift_Right_End](./Photo/IMG20260513213448.jpg) |

#### 6. 更多實驗細節 (Supplementary Details)
| 狀態描述 | 實體照片 |
| :--- | :--- |
| **載入模式細節 A**：特定開關組合下的輸出狀態。 | ![Detail_A](./Photo/IMG20260513213443.jpg) |
| **載入模式細節 B**：特定開關組合下的輸出狀態。 | ![Detail_B](./Photo/IMG20260513213446.jpg) |
| **位移中間態**：觀察位移過程中的 LED 變化。 | ![Detail_C](./Photo/IMG20260513213759.jpg) |

---

## 程式碼 (僅包含目標一：N_bit_DFF.vhd)

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity n_bit_DFF is
    generic( N : integer := 10 ); -- 使用 GENERIC 讓位元數可變 (本次實驗為 10-bit)
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
```

---

## 實驗心得
在本次 Lab 05 實驗中，我們學習了如何設計並實作一個多功能的萬用暫存器。這項實驗讓我們更深刻地理解了數位電路中「同步控制」的機制。與組合邏輯不同，序向邏輯（Sequential Logic）中的所有行為都依賴於時脈（Clock）的觸發，這在 VHDL 中透過 `rising_edge(clk)` 來精準控制。

特別是在處理左移與右移邏輯時，我們使用了 `for loop` 迴圈來撰寫。雖然在硬體實現上，迴圈會被展開成平行排列的連線與多工器，但在撰寫程式碼時，這種方式極大地提高了可讀性與擴充性（透過 `GENERIC` 設定 N 值即可改變位元數）。

此外，透過硬體開發板的實作，我們觀察到當 `clean` 或 `load` 訊號為高電位時，必須按下 `KEY0` 提供時脈緣，暫存器的狀態才會更新。這讓我們學會區分「準位觸發」與「邊緣觸發」的差異。整體而言，這次實驗讓我們對暫存器在計算機系統中扮演的角色——作為數據暫存與格式轉換（串並轉換）的核心組件，有了更紮實的認識。

---

## 組員貢獻比例
| 姓名 | 學號 | 貢獻比例 | 負責內容 |
| :--- | :--- | :--- | :--- |
| 楊承諭 | 113590051 | 100% | 程式開發、硬體測試、影像紀錄、報告撰寫 |
| 黃楷程 | 113590017 | 0% | 無 |
