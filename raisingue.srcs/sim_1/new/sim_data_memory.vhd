library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Data_Memory is
    
end tb_Data_Memory;

architecture Behavioral of tb_Data_Memory is

    -- Component Declaration for the Unit Under Test (UUT)
    component Data_Memory
        Port (
            addr : in STD_LOGIC_VECTOR (7 downto 0);
            Din : in STD_LOGIC_VECTOR (7 downto 0);
            RW : in STD_LOGIC;
            RST : in STD_LOGIC;
            CLK : in STD_LOGIC;
            Dout : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Inputs
    signal addr : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal Din : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal RW : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';

    -- Outputs
    signal Dout : STD_LOGIC_VECTOR (7 downto 0);

    -- Clock period definitions
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Data_Memory
        Port Map (
            addr => addr,
            Din => Din,
            RW => RW,
            RST => RST,
            CLK => CLK,
            Dout => Dout
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

        -- Test Write operation
        addr <= "00000001"; -- Address 1
        Din <= "00000010"; -- Data 2
        RW <= '0'; -- Write mode
        wait for CLK_PERIOD;

        -- Test Read operation
        RW <= '1'; -- Read mode
        wait for CLK_PERIOD;
        assert Dout = "00000010" report "Read operation failed at address 1" severity error;

        -- Test Write operation at another address
        addr <= "00000010"; -- Address 2
        Din <= "00000100"; -- Data 4
        RW <= '0'; -- Write mode
        wait for CLK_PERIOD;

        -- Test Read operation at another address
        RW <= '1'; -- Read mode
        wait for CLK_PERIOD;
        assert Dout = "00000100" report "Read operation failed at address 2" severity error;

        -- Test Reset operation
        RST <= '0';
        wait for CLK_PERIOD;
        RST <= '1';
        wait for CLK_PERIOD;
        assert Dout = "00000000" report "Reset operation failed" severity error;

        -- Test Write and Read after Reset
        addr <= "00000001"; -- Address 1
        Din <= "00000011"; -- Data 3
        RW <= '0'; -- Write mode
        wait for CLK_PERIOD;

        RW <= '1'; -- Read mode
        wait for CLK_PERIOD;
        assert Dout = "00000011" report "Read operation failed after reset" severity error;

        -- End simulation
        wait;
    end process;

end Behavioral;
