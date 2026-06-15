-- ===========================================================================
-- Final Project: 4-Stage Pipeline CPU  (DE2-115 / Altera Cyclone IV E)
-- Course  : Microprocessor Systems (2026)
-- Author  : Yang Cheng-Yu (楊承諭) / Student ID: 113590051
-- File    : Pipeline_CPU.vhd
-- ===========================================================================
-- Architecture: 4-stage MIPS-like pipeline
--
--   Stage T0 (IF)  : Instruction Fetch  – reads SW[15:0]
--   Stage T1 (ID)  : Instruction Decode / Register Read
--   Stage T2 (EXE) : Execution  (ALU / multi-cycle DIV)
--   Stage T3 (WB)  : Write Back – writes result to register file
--
--   Pipeline Registers:
--     IF/ID  register : captures fetched instruction
--     ID/EXE register : captures decoded instruction + forwarded operands
--     EXE/WB register : captures ALU result + destination register ID
--
-- Instruction Set (SW[15:0]):
--   SW[7:0]   = Data (8-bit immediate for LOAD)
--   SW[11:8]  = Opcode (4-bit)
--   SW[13:12] = Rs (2-bit destination register select)
--   SW[15:14] = Rt (2-bit source register select)
--
--   Opcode Table:
--     0000 LOAD   Rs        Rs ← Data
--     0001 MOVE   Rs, Rt    Rs ← Rt
--     0010 ADD    Rs, Rt    Rs ← Rs + Rt
--     0011 AND    Rs, Rt    Rs ← Rs AND Rt
--     0100 SLT    Rs, Rt    Rs ← (Rs < Rt) ? 1 : 0
--     0101 SUB(A-B) Rs, Rt  Rs ← Rs − Rt
--     0110 NOR    Rs, Rt    Rs ← NOT(Rs OR Rt)
--     1000 DIV    Rs, Rt    Rs ← Rs / Rt  (multi-cycle, 8 clocks)
--     1001 SUB(B-A) Rs, Rt  Rs ← Rt − Rs
--     1111 NOP              No operation / No instruction fetch
--
-- Outputs:
--   HEX0       = Rs register value 個位 (lower nibble, via SW[13:12])
--   HEX1       = Rs register value 十位 (upper nibble)
--   HEX2       = Rt register value 個位 (lower nibble, via SW[15:14])
--   HEX3       = Rt register value 十位 (upper nibble)
--   HEX4       = IF/ID  pipeline register opcode  (single hex digit)
--   HEX5       = Opcode input live (SW[11:8])
--   HEX6       = ID/EXE pipeline register opcode  (single hex digit)
--   LEDR[7:0]  = Input DATA  (live SW[7:0])
--   LEDG[0]    = Data hazard detected  (forwarding is active)
--   LEDG[1]    = EXE busy  (DIV multi-cycle FSM running)
--
-- Hazard & Forwarding:
--   Full forwarding from EXE stage (exe_result) and WB stage (EXEWB_result)
--   eliminates all stalls for single-cycle instructions.
--   DIV stalls the pipeline for 8 clocks; exe_busy (LEDG[1]) indicates stall.
-- ===========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- ---------------------------------------------------------------------------
entity Pipeline_CPU is
    port (
        SW   : in  std_logic_vector(15 downto 0);  -- SW[15:0]
        KEY  : in  std_logic_vector(0 downto 0);   -- KEY[0] = manual clock
        HEX0 : out std_logic_vector(6 downto 0);   -- Rs 個位
        HEX1 : out std_logic_vector(6 downto 0);   -- Rs 十位
        HEX2 : out std_logic_vector(6 downto 0);   -- Rt 個位
        HEX3 : out std_logic_vector(6 downto 0);   -- Rt 十位
        HEX4 : out std_logic_vector(6 downto 0);   -- IF/ID opcode
        HEX5 : out std_logic_vector(6 downto 0);   -- Opcode input (live)
        HEX6 : out std_logic_vector(6 downto 0);   -- ID/EXE opcode
        LEDR : out std_logic_vector(7 downto 0);   -- Input DATA
        LEDG : out std_logic_vector(1 downto 0)    -- [0]=Hazard, [1]=Exe_Busy
    );
end entity Pipeline_CPU;

-- ---------------------------------------------------------------------------
architecture Behavioral of Pipeline_CPU is

    -- =======================================================================
    -- 7-Segment Decoder  (active-low, common-anode)
    -- Segment encoding: gfedcba  (bit 6 = g, bit 0 = a)
    -- =======================================================================
    function to_7seg(nibble : std_logic_vector(3 downto 0))
            return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case nibble is
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
    end function to_7seg;

    -- =======================================================================
    -- Opcode Constants
    -- =======================================================================
    constant OP_LOAD   : std_logic_vector(3 downto 0) := "0000";
    constant OP_MOVE   : std_logic_vector(3 downto 0) := "0001";
    constant OP_ADD    : std_logic_vector(3 downto 0) := "0010";
    constant OP_AND    : std_logic_vector(3 downto 0) := "0011";
    constant OP_SLT    : std_logic_vector(3 downto 0) := "0100";
    constant OP_SUBA_B : std_logic_vector(3 downto 0) := "0101";
    constant OP_NOR    : std_logic_vector(3 downto 0) := "0110";
    constant OP_DIV    : std_logic_vector(3 downto 0) := "1000";
    constant OP_SUBB_A : std_logic_vector(3 downto 0) := "1001";
    constant OP_NOP    : std_logic_vector(3 downto 0) := "1111";

    -- =======================================================================
    -- Register File  (4 × 8-bit general-purpose registers)
    -- =======================================================================
    signal R0 : std_logic_vector(7 downto 0) := (others => '0');
    signal R1 : std_logic_vector(7 downto 0) := (others => '0');
    signal R2 : std_logic_vector(7 downto 0) := (others => '0');
    signal R3 : std_logic_vector(7 downto 0) := (others => '0');

    -- =======================================================================
    -- Clock
    -- =======================================================================
    signal clk : std_logic;  -- inverted KEY[0]: rising edge on button press

    -- =======================================================================
    -- Current IF-stage input  (combinational, decoded from SW)
    -- =======================================================================
    signal curr_data   : std_logic_vector(7 downto 0); -- SW[7:0]
    signal curr_opcode : std_logic_vector(3 downto 0); -- SW[11:8]
    signal curr_rs_sel : std_logic_vector(1 downto 0); -- SW[13:12]
    signal curr_rt_sel : std_logic_vector(1 downto 0); -- SW[15:14]

    -- =======================================================================
    -- IF/ID Pipeline Register
    -- =======================================================================
    signal IFID_opcode : std_logic_vector(3 downto 0) := OP_NOP;
    signal IFID_rs_id  : std_logic_vector(1 downto 0) := (others => '0');
    signal IFID_rt_id  : std_logic_vector(1 downto 0) := (others => '0');
    signal IFID_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal IFID_valid  : std_logic := '0';  -- '0' until first fetch

    -- =======================================================================
    -- ID/EXE Pipeline Register
    -- =======================================================================
    signal IDEXE_opcode : std_logic_vector(3 downto 0) := OP_NOP;
    signal IDEXE_rs_id  : std_logic_vector(1 downto 0) := (others => '0');
    signal IDEXE_rs_val : std_logic_vector(7 downto 0) := (others => '0'); -- forwarded Rs
    signal IDEXE_rt_id  : std_logic_vector(1 downto 0) := (others => '0');
    signal IDEXE_rt_val : std_logic_vector(7 downto 0) := (others => '0'); -- forwarded Rt
    signal IDEXE_data   : std_logic_vector(7 downto 0) := (others => '0'); -- for LOAD
    signal IDEXE_valid  : std_logic := '0';

    -- =======================================================================
    -- EXE/WB Pipeline Register
    -- =======================================================================
    signal EXEWB_opcode : std_logic_vector(3 downto 0) := OP_NOP;
    signal EXEWB_rs_id  : std_logic_vector(1 downto 0) := (others => '0');
    signal EXEWB_result : std_logic_vector(7 downto 0) := (others => '0');
    signal EXEWB_valid  : std_logic := '0';

    -- =======================================================================
    -- Register File Reads  (combinational)
    -- =======================================================================
    signal Rs_val_raw : std_logic_vector(7 downto 0); -- ID stage raw read (IFID selectors)
    signal Rt_val_raw : std_logic_vector(7 downto 0);
    signal Rs_val_fwd : std_logic_vector(7 downto 0); -- after forwarding
    signal Rt_val_fwd : std_logic_vector(7 downto 0);

    signal Rs_disp : std_logic_vector(7 downto 0); -- for HEX display (curr selectors)
    signal Rt_disp : std_logic_vector(7 downto 0);

    -- =======================================================================
    -- EXE Stage ALU Output  (combinational, from IDEXE register)
    -- =======================================================================
    signal exe_result : std_logic_vector(7 downto 0);

    -- =======================================================================
    -- Hazard Detection
    -- =======================================================================
    signal hazard_det : std_logic;

    -- =======================================================================
    -- DIV Multi-Cycle FSM  (Restoring Division Algorithm)
    --
    -- When opcode=DIV moves from IF/ID to ID/EXE:
    --   - FSM starts in DIV_RUN (8 iterations, one per clock)
    --   - During DIV_RUN: stall=1  (pipeline frozen, bubble inserted in EXE/WB)
    --   - After 8 iterations: FSM enters DIV_DONE
    --   - During DIV_DONE: stall=0 (pipeline resumes, result captured in EXE/WB)
    -- =======================================================================
    type div_state_t is (DIV_IDLE, DIV_RUN, DIV_DONE);
    signal div_state    : div_state_t := DIV_IDLE;
    signal div_count    : integer range 0 to 7 := 0;
    signal div_quot     : std_logic_vector(7 downto 0) := (others => '0');
    signal div_rem      : std_logic_vector(7 downto 0) := (others => '0');
    signal div_dividend : std_logic_vector(7 downto 0) := (others => '0');
    signal div_divisor  : std_logic_vector(7 downto 0) := (others => '0');

    signal exe_busy : std_logic; -- '1' while DIV_RUN
    signal stall    : std_logic; -- = exe_busy

begin

    -- =======================================================================
    -- Clock: KEY[0] is active-low; invert so that pressing gives rising edge
    -- =======================================================================
    clk <= not KEY(0);

    -- =======================================================================
    -- Input Decode
    -- =======================================================================
    curr_data   <= SW(7  downto 0);
    curr_opcode <= SW(11 downto 8);
    curr_rs_sel <= SW(13 downto 12);
    curr_rt_sel <= SW(15 downto 14);

    -- =======================================================================
    -- EXE Busy / Stall  (combinational from FSM state)
    -- =======================================================================
    exe_busy <= '1' when div_state = DIV_RUN else '0';
    stall    <= exe_busy;

    -- =======================================================================
    -- Combinational: Register File Read for ID stage  (IFID selectors)
    -- =======================================================================
    process(IFID_rs_id, IFID_rt_id, R0, R1, R2, R3)
    begin
        case IFID_rs_id is
            when "00"   => Rs_val_raw <= R0;
            when "01"   => Rs_val_raw <= R1;
            when "10"   => Rs_val_raw <= R2;
            when others => Rs_val_raw <= R3;
        end case;
        case IFID_rt_id is
            when "00"   => Rt_val_raw <= R0;
            when "01"   => Rt_val_raw <= R1;
            when "10"   => Rt_val_raw <= R2;
            when others => Rt_val_raw <= R3;
        end case;
    end process;

    -- =======================================================================
    -- Combinational: Register File Read for HEX display  (curr SW selectors)
    -- =======================================================================
    process(curr_rs_sel, curr_rt_sel, R0, R1, R2, R3)
    begin
        case curr_rs_sel is
            when "00"   => Rs_disp <= R0;
            when "01"   => Rs_disp <= R1;
            when "10"   => Rs_disp <= R2;
            when others => Rs_disp <= R3;
        end case;
        case curr_rt_sel is
            when "00"   => Rt_disp <= R0;
            when "01"   => Rt_disp <= R1;
            when "10"   => Rt_disp <= R2;
            when others => Rt_disp <= R3;
        end case;
    end process;

    -- =======================================================================
    -- Combinational: EXE Stage ALU  (reads from IDEXE register)
    --
    -- For DIV: exe_result = div_quot, which holds the final quotient only
    -- when div_state = DIV_DONE.  The pipeline only advances (stall=0) when
    -- DIV_DONE, so the correct result is captured in EXE/WB register. ✓
    -- =======================================================================
    process(IDEXE_opcode, IDEXE_rs_val, IDEXE_rt_val, IDEXE_data, div_quot)
    begin
        case IDEXE_opcode is
            when OP_LOAD =>
                -- Rs ← Data (8-bit immediate captured in pipeline register)
                exe_result <= IDEXE_data;

            when OP_MOVE =>
                -- Rs ← Rt
                exe_result <= IDEXE_rt_val;

            when OP_ADD =>
                -- Rs ← Rs + Rt
                exe_result <= IDEXE_rs_val + IDEXE_rt_val;

            when OP_AND =>
                -- Rs ← Rs AND Rt
                exe_result <= IDEXE_rs_val and IDEXE_rt_val;

            when OP_SLT =>
                -- Rs ← (Rs < Rt) ? 1 : 0  (unsigned comparison)
                if IDEXE_rs_val < IDEXE_rt_val then
                    exe_result <= "00000001";
                else
                    exe_result <= "00000000";
                end if;

            when OP_SUBA_B =>
                -- Rs ← Rs - Rt
                exe_result <= IDEXE_rs_val - IDEXE_rt_val;

            when OP_NOR =>
                -- Rs ← NOT(Rs OR Rt)
                exe_result <= not (IDEXE_rs_val or IDEXE_rt_val);

            when OP_DIV =>
                -- Rs ← quotient from multi-cycle FSM
                -- (valid when div_state = DIV_DONE, which is when stall=0)
                exe_result <= div_quot;

            when OP_SUBB_A =>
                -- Rs ← Rt - Rs
                exe_result <= IDEXE_rt_val - IDEXE_rs_val;

            when others =>
                exe_result <= (others => '0');
        end case;
    end process;

    -- =======================================================================
    -- Combinational: Forwarding Unit + Hazard Detection
    --
    -- Forwarding priority:
    --   1. EXE forward  (IDEXE→exe_result) : most recent, highest priority
    --   2. WB  forward  (EXEWB_result)     : one cycle older
    --   3. Register file                   : only when no dependency exists
    --
    -- Hazard is asserted (LEDG[0]=1) whenever ANY forwarding is active for
    -- the currently decoded (IFID) instruction.
    --
    -- Note: reads_rs and reads_rt are derived per-opcode so that LOAD (which
    -- does not read Rs or Rt from the register file) does not falsely trigger
    -- the hazard indicator.
    -- =======================================================================
    process(IFID_rs_id, IFID_rt_id, IFID_valid, IFID_opcode,
            IDEXE_rs_id, IDEXE_valid, IDEXE_opcode,
            EXEWB_rs_id, EXEWB_valid, EXEWB_opcode,
            Rs_val_raw,  Rt_val_raw, exe_result, EXEWB_result)
        variable reads_rs_v : boolean;
        variable reads_rt_v : boolean;
        variable fwd_rs_exe : boolean;
        variable fwd_rs_wb  : boolean;
        variable fwd_rt_exe : boolean;
        variable fwd_rt_wb  : boolean;
    begin
        -- Which registers does the IFID instruction actually read?
        if IFID_opcode = OP_ADD    or IFID_opcode = OP_AND  or
           IFID_opcode = OP_SLT    or IFID_opcode = OP_SUBA_B or
           IFID_opcode = OP_NOR    or IFID_opcode = OP_SUBB_A or
           IFID_opcode = OP_DIV then
            reads_rs_v := true;  -- reads Rs
            reads_rt_v := true;  -- reads Rt
        elsif IFID_opcode = OP_MOVE then
            reads_rs_v := false; -- does NOT read Rs (Rs is destination only)
            reads_rt_v := true;  -- reads Rt
        else -- OP_LOAD, OP_NOP, others
            reads_rs_v := false;
            reads_rt_v := false;
        end if;

        -- EXE forwarding: IDEXE instruction writes to IDEXE_rs_id (its destination)
        fwd_rs_exe := reads_rs_v and
                      (IDEXE_valid = '1') and (IDEXE_opcode /= OP_NOP) and
                      (IDEXE_rs_id = IFID_rs_id);

        fwd_rt_exe := reads_rt_v and
                      (IDEXE_valid = '1') and (IDEXE_opcode /= OP_NOP) and
                      (IDEXE_rs_id = IFID_rt_id);

        -- WB forwarding: EXEWB instruction writes to EXEWB_rs_id (lower priority)
        fwd_rs_wb := reads_rs_v and
                     (EXEWB_valid = '1') and (EXEWB_opcode /= OP_NOP) and
                     (EXEWB_rs_id = IFID_rs_id) and (not fwd_rs_exe);

        fwd_rt_wb := reads_rt_v and
                     (EXEWB_valid = '1') and (EXEWB_opcode /= OP_NOP) and
                     (EXEWB_rs_id = IFID_rt_id) and (not fwd_rt_exe);

        -- Rs forwarding mux
        if fwd_rs_exe then
            Rs_val_fwd <= exe_result;
        elsif fwd_rs_wb then
            Rs_val_fwd <= EXEWB_result;
        else
            Rs_val_fwd <= Rs_val_raw;
        end if;

        -- Rt forwarding mux
        if fwd_rt_exe then
            Rt_val_fwd <= exe_result;
        elsif fwd_rt_wb then
            Rt_val_fwd <= EXEWB_result;
        else
            Rt_val_fwd <= Rt_val_raw;
        end if;

        -- Hazard indicator: any forwarding active for a valid IFID instruction
        if (IFID_valid = '1') and (IFID_opcode /= OP_NOP) and
           (fwd_rs_exe or fwd_rs_wb or fwd_rt_exe or fwd_rt_wb) then
            hazard_det <= '1';
        else
            hazard_det <= '0';
        end if;
    end process;

    -- =======================================================================
    -- Sequential: Pipeline Registers  +  Write-Back  +  DIV FSM
    --
    -- Two modes:
    --   stall = '0'  →  Normal advance: WB writes, all registers shift forward
    --   stall = '1'  →  DIV stall: IFID/IDEXE held; bubble inserted to EXE/WB
    -- =======================================================================
    process(clk)
        variable temp_rem : std_logic_vector(7 downto 0);
        variable bit_pos  : integer;
    begin
        if rising_edge(clk) then

            if stall = '0' then
                -- =============================================================
                -- NORMAL PIPELINE ADVANCE
                -- =============================================================

                -- ---- WB Stage: write result to register file ----------------
                if EXEWB_valid = '1' and EXEWB_opcode /= OP_NOP then
                    case EXEWB_rs_id is
                        when "00"   => R0 <= EXEWB_result;
                        when "01"   => R1 <= EXEWB_result;
                        when "10"   => R2 <= EXEWB_result;
                        when others => R3 <= EXEWB_result;
                    end case;
                end if;

                -- ---- EXE → EXE/WB register ----------------------------------
                EXEWB_opcode <= IDEXE_opcode;
                EXEWB_rs_id  <= IDEXE_rs_id;
                EXEWB_result <= exe_result;
                EXEWB_valid  <= IDEXE_valid;

                -- ---- ID → ID/EXE register  (forwarded operands stored) ------
                IDEXE_opcode <= IFID_opcode;
                IDEXE_rs_id  <= IFID_rs_id;
                IDEXE_rs_val <= Rs_val_fwd;   -- forwarded (or raw) Rs value
                IDEXE_rt_id  <= IFID_rt_id;
                IDEXE_rt_val <= Rt_val_fwd;   -- forwarded (or raw) Rt value
                IDEXE_data   <= IFID_data;    -- immediate for LOAD
                IDEXE_valid  <= IFID_valid;

                -- ---- IF → IF/ID register  (fetch new instruction from SW) ---
                IFID_opcode <= curr_opcode;
                IFID_rs_id  <= curr_rs_sel;
                IFID_rt_id  <= curr_rt_sel;
                IFID_data   <= curr_data;
                IFID_valid  <= '1';

                -- ---- DIV FSM state transitions (only when not stalling) ------

                -- Close out a completed DIV (DIV_DONE → DIV_IDLE)
                if div_state = DIV_DONE then
                    div_state <= DIV_IDLE;
                end if;

                -- Start a new DIV when IFID holds a DIV opcode (about to enter IDEXE)
                -- Note: this if-block may OVERRIDE the div_state <= DIV_IDLE above,
                -- which correctly handles back-to-back DIV instructions.
                if IFID_valid = '1' and IFID_opcode = OP_DIV then
                    if Rt_val_fwd = "00000000" then
                        -- Division by zero: result = 0xFF, skip 8-cycle execution
                        div_quot  <= "11111111";
                        div_state <= DIV_DONE;
                    else
                        div_state    <= DIV_RUN;
                        div_count    <= 0;
                        div_dividend <= Rs_val_fwd;   -- forwarded dividend
                        div_divisor  <= Rt_val_fwd;   -- forwarded divisor
                        div_quot     <= (others => '0');
                        div_rem      <= (others => '0');
                    end if;
                end if;

            else
                -- =============================================================
                -- STALL  (DIV running in EXE stage)
                -- Pipeline is frozen; only the DIV FSM advances each clock.
                -- =============================================================

                -- ---- WB Stage: still processes whatever is in EXE/WB --------
                -- On the FIRST stall clock, EXEWB may hold a real instruction
                -- from before the DIV stall started; we write it now.
                -- After the first stall clock, EXEWB becomes a bubble (valid=0),
                -- so this write condition evaluates to false for all later clocks.
                if EXEWB_valid = '1' and EXEWB_opcode /= OP_NOP then
                    case EXEWB_rs_id is
                        when "00"   => R0 <= EXEWB_result;
                        when "01"   => R1 <= EXEWB_result;
                        when "10"   => R2 <= EXEWB_result;
                        when others => R3 <= EXEWB_result;
                    end case;
                end if;

                -- ---- Insert bubble into EXE/WB (suppress WB on later clocks) -
                EXEWB_opcode <= OP_NOP;
                EXEWB_rs_id  <= (others => '0');
                EXEWB_result <= (others => '0');
                EXEWB_valid  <= '0';

                -- IFID  : held (no assignment = retains current registered value)
                -- IDEXE : held (keeps the DIV instruction throughout stall)

                -- ---- DIV FSM: execute one restoring-division step each clock --
                -- Algorithm: at each step k (k = 0..7), we examine bit (7-k) of
                -- the dividend.  We shift the partial remainder left by 1 and bring
                -- in the current dividend bit, then test if it is ≥ divisor.
                if div_state = DIV_RUN then
                    bit_pos  := 7 - div_count;
                    temp_rem := div_rem(6 downto 0) & div_dividend(bit_pos);

                    if temp_rem >= div_divisor then
                        div_rem           <= temp_rem - div_divisor;
                        div_quot(bit_pos) <= '1';  -- quotient bit = 1
                    else
                        div_rem           <= temp_rem;
                        -- div_quot(bit_pos) stays '0' (initialized at DIV start)
                    end if;

                    if div_count = 7 then
                        -- All 8 bits computed; move to DONE so pipeline can resume
                        div_state <= DIV_DONE;
                    else
                        div_count <= div_count + 1;
                    end if;
                end if;

            end if; -- stall
        end if; -- rising_edge
    end process;

    -- =======================================================================
    -- Output Assignments
    -- =======================================================================

    -- HEX0/HEX1 : Rs register value  (selected by current SW[13:12])
    HEX0 <= to_7seg(Rs_disp(3 downto 0));  -- 個位  (lower nibble)
    HEX1 <= to_7seg(Rs_disp(7 downto 4));  -- 十位  (upper nibble)

    -- HEX2/HEX3 : Rt register value  (selected by current SW[15:14])
    HEX2 <= to_7seg(Rt_disp(3 downto 0));  -- 個位
    HEX3 <= to_7seg(Rt_disp(7 downto 4));  -- 十位

    -- HEX4 : IF/ID pipeline register opcode  (shows instruction after 1 clock)
    HEX4 <= to_7seg(IFID_opcode);

    -- HEX5 : Live opcode input  (shows current SW[11:8] before pressing clock)
    HEX5 <= to_7seg(curr_opcode);

    -- HEX6 : ID/EXE pipeline register opcode  (shows instruction after 2 clocks)
    HEX6 <= to_7seg(IDEXE_opcode);

    -- LEDR[7:0] : Live input DATA  (SW[7:0])
    LEDR <= SW(7 downto 0);

    -- LEDG[0] : Data hazard detected  (forwarding is currently active)
    LEDG(0) <= hazard_det;

    -- LEDG[1] : EXE busy  (DIV multi-cycle FSM is running)
    LEDG(1) <= exe_busy;

end architecture Behavioral;
