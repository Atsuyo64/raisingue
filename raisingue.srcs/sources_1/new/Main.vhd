LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Main IS
    GENERIC (
        g_num_bits : INTEGER := 21
    );
    PORT (
        PCLOCK : IN STD_LOGIC;
        IRST : IN STD_LOGIC;
        sw          : in std_logic_vector(15 downto 0);
        PC_out : out std_logic_vector (7 downto 0);
        OUT0 : out STD_LOGIC_VECTOR(7 downto 0);
        ss_seg      : out STD_LOGIC_VECTOR(6 downto 0);
        ss_an       : out STD_LOGIC_VECTOR(3 downto 0));
END Main;

ARCHITECTURE Structural OF Main IS
    signal CLK : std_logic := '0';
    signal RST : std_logic := '1';
    --signal RSTCOUNT : std_logic := '0';
    SIGNAL pc : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL jmp_val : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL instruction : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL DIA : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL DIB : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL DIC : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL DIOP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL EXA : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL EXB : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL EXC : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL EXOP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MEMA : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MEMB : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MEMOP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL REB : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL REOP : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL REA : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');

    SIGNAL REG_QA : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL REG_QB : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL POST_RF_MUX_B : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ALU_OP : STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');

    SIGNAL ALU_OUT : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL POST_ALU_CALC_B : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL MEM_ADDR : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MEM_OUT : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL POST_MEM_B : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MEM_RW : STD_LOGIC := '0';
    SIGNAL NOZ_ALU : STD_LOGIC := '0';
    SIGNAL NOZ_MEM_FLAG : STD_LOGIC := '0';
    SIGNAL FLUSH_CMD : STD_LOGIC := '0';

    SIGNAL RFW : STD_LOGIC := '0';
    SIGNAL SET_PC : STD_LOGIC := '0';
    
    SIGNAL IS_REG_WRITE_OP : STD_LOGIC := '0';
    
    
    SIGNAL post_stdin : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    --SIGNAL OUT0 : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUT1 : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL OUT2 : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    RST <= not IRST;
    PC_out <= PC;
    --OUT0 <= PC;
    div: entity work.prescaler
    generic map (g_num_bits => g_num_bits)
    port map(
        ClockIn=>PCLOCK,
        ClockOut=>CLK
        );
    u_pc : ENTITY work.PC
        PORT MAP(
            CLK => CLK,
            SET => SET_PC,
            RST => RST,
            --EN => '1',
            INPUT => jmp_val,
            SHOULD_INJECT_NOZ => IS_REG_WRITE_OP,
            PC => pc,
            FLUSH => FLUSH_CMD
        );
    u_instruction_memory : ENTITY work.Instruction_Memory
        PORT MAP(
            addr => pc,
            CLK => CLK,
            Dout => instruction
        );
    u_decoder : ENTITY work.Decoder
        PORT MAP(
            instr => instruction,
--            CLK=>CLK,
            A => DIA,
            B => DIB,
            C => DIC,
            NOZ_FLAG => NOZ_MEM_FLAG,
            SET_PC => SET_PC,
            PC_VALUE => jmp_val,
            IS_REG_WRITE_OP => IS_REG_WRITE_OP,
            OP => DIOP
        );
    u_register_file : ENTITY work.Register_File
        PORT MAP(
            addA => DIB(3 DOWNTO 0),
            addB => DIC(3 DOWNTO 0),
            addW => REA,
            W => RFW,
            DATA => REB,
            RST => RST,
            CLK => CLK,
            QA => REG_QA,
            QB => REG_QB
        );
    u_mux_rf_afc : ENTITY work.MUX_RF_AFC
        PORT MAP(
            OP => DIOP,
            B => DIB,
            QA => REG_QA,
            DOUT => POST_RF_MUX_B
        );
    u_diex : ENTITY work.DIEXer
        PORT MAP(
            CLK => CLK,
            FLUSH => FLUSH_CMD,
            INA => DIA,
            INB => POST_RF_MUX_B,
            INC => REG_QB,
            INOP => DIOP,
            OUTA => EXA,
            OUTB => EXB,
            OUTC => EXC,
            OUTOP => EXOP
        );
    u_op_to_aluop : ENTITY work.OP_to_ALUOP
        PORT MAP(
            OP => EXOP,
            ALUOP => ALU_OP
        );
    u_alu : ENTITY work.ALU
        PORT MAP(
            A => EXB,
            B => EXC,
            S => ALU_OUT,
            Opcode => ALU_OP,
            NozFlag => NOZ_ALU,
            Carry => OPEN, --TODO:
            Overflow => OPEN,
            Negative => OPEN
        );
        
    u_nozflag : ENTITY work.Flag_Memory
        PORT MAP(
            INPUT => NOZ_ALU,
            OP => EXOP,
            RST => '1',
            CLK => CLK,
            OUTPUT => NOZ_MEM_FLAG
        );
        
    u_mux_alu_calc : ENTITY work.MUX_ALU_CALC
        PORT MAP(
            OP => EXOP,
            B => EXB,
            ALU_OUT => ALU_OUT,
            stdinput => post_stdin,
            DOUT => POST_ALU_CALC_B
        );
    u_exmem : ENTITY work.EXMEMer
        PORT MAP(
            CLK => CLK,
            FLUSH => FLUSH_CMD,
            INA => EXA,
            INB => POST_ALU_CALC_B,
            INOP => EXOP,
            OUTA => MEMA,
            OUTB => MEMB,
            OUTOP => MEMOP
        );
    u_mux_ab_mem : ENTITY work.MUX_AB_MEM
        PORT MAP(
            OP => MEMOP,
            A => MEMA,
            B => MEMB,
            DOUT => MEM_ADDR
        );
    u_op_to_memop : ENTITY work.OP_TO_MEMOP
        PORT MAP(
            OP => MEMOP,
            RW => MEM_RW
        );
    u_data_memory : ENTITY work.Data_Memory
        PORT MAP(
            addr => MEM_ADDR,
            Din => MEMB,
            RW => MEM_RW,
            RST => RST,
            CLK => CLK,
            Dout => MEM_OUT
        );
    u_mux_mem_b : ENTITY work.MUX_MEM_B
        PORT MAP(
            OP => MEMOP,
            MEM => MEM_OUT,
            B => MEMB,
            DOUT => POST_MEM_B
        );
    u_memre : ENTITY work.MEMREr
        PORT MAP(
            CLK => CLK,
            FLUSH => FLUSH_CMD,
            INA => MEMA,
            INB => POST_MEM_B,
            INOP => MEMOP,
            OUTA => REA,
            OUTB => REB,
            OUTOP => REOP
        );
    u_op_to_rfw : ENTITY work.OP_TO_RFW
        PORT MAP(
            OP => REOP,
            RFW => RFW
        );
    stdout : ENTITY work.stdout
        PORT MAP(
        input => EXB,
        cell => EXC,
        OP => EXOP,
        RST => RST,
        CLK => CLK,
        output0 => OUT0,
        output1 => OUT1,
        output2 => OUT2
        );
    sevenseg : ENTITY work.seven_seg_controller
        PORT MAP(
            clk      => PCLOCK,
            right_in => OUT1,
            left_in  => OUT2,
            seg      => ss_seg,
            an       => ss_an
        );
        
    stdin: ENTITY work.stdin
        PORT MAP(
           OP => EXOP,
           sw => sw,
           offset => EXB,
           DOUT => post_stdin
        );
END Structural;