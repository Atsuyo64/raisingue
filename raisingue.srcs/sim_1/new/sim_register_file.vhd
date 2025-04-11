library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Register_File is
    -- no ports
end tb_Register_File;

architecture Behavioral of tb_Register_File is

    -- Component Declaration for the Unit Under Test (UUT)
    component Register_File
        Port (
            addA : in STD_LOGIC_VECTOR (3 downto 0);
            addB : in STD_LOGIC_VECTOR (3 downto 0);
            addW : in STD_LOGIC_VECTOR (3 downto 0);
            W : in STD_LOGIC;
            DATA : in STD_LOGIC_VECTOR (7 downto 0);
            RST : in STD_LOGIC;
            CLK : in STD_LOGIC;
            QA : out STD_LOGIC_VECTOR (7 downto 0);
            QB : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Inputs
    signal addA : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal addB : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal addW : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal W : STD_LOGIC := '0';
    signal DATA : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal RST : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';

    -- Outputs
    signal QA : STD_LOGIC_VECTOR (7 downto 0);
    signal QB : STD_LOGIC_VECTOR (7 downto 0);

    -- Clock period definitions
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Register_File
        Port Map (
            addA => addA,
            addB => addB,
            addW => addW,
            W => W,
            DATA => DATA,
            RST => RST,
            CLK => CLK,
            QA => QA,
            QB => QB
        );

    -- Clock process definitions
    CLK_process :process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        RST <= '0';
        wait for 20 ns;
        RST <= '1';

        -- Test 1: Write to register 0
        addW <= "0000";
        DATA <= "10101010";
        W <= '1';
        wait for CLK_PERIOD;
        W <= '0';

        -- Test 2: Read from register 0
        addA <= "0000";
        addB <= "0000";
        wait for CLK_PERIOD;
        assert QA = "10101010" report "Test 2 failed for QA" severity error;
        assert QB = "10101010" report "Test 2 failed for QB" severity error;

        -- Test 3: Write to register 1
        addW <= "0001";
        DATA <= "01010101";
        W <= '1';
        wait for CLK_PERIOD;
        W <= '0';

        -- Test 4: Read from register 1
        addA <= "0001";
        addB <= "0001";
        wait for CLK_PERIOD;
        assert QA = "01010101" report "Test 4 failed for QA" severity error;
        assert QB = "01010101" report "Test 4 failed for QB" severity error;

        -- Test 5: Write to register 2 and read from register 0 and 1
        addW <= "0010";
        DATA <= "11110000";
        W <= '1';
        wait for CLK_PERIOD;
        W <= '0';

        addA <= "0000";
        addB <= "0001";
        wait for CLK_PERIOD;
        assert QA = "10101010" report "Test 5 failed for QA" severity error;
        assert QB = "01010101" report "Test 5 failed for QB" severity error;

        -- Test 6: Read from register 2
        addA <= "0010";
        addB <= "0010";
        wait for CLK_PERIOD;
        assert QA = "11110000" report "Test 6 failed for QA" severity error;
        assert QB = "11110000" report "Test 6 failed for QB" severity error;
        
        -- Test 7: Read from register 2
        RST <= '0';
        wait for CLK_PERIOD;
        assert QA = "00000000" report "Test 7 failed for QA" severity error;
        assert QB = "00000000" report "Test 7 failed for QB" severity error;


        -- End simulation
        wait;
    end process;

end Behavioral;