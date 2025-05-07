library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    signal CLK : std_logic := '0';
    constant period : time := 10 ns;
begin
    uut: entity work.main port map(CLK=>CLK,RST=>'1');
    simu: process
    begin
        while true loop
            CLK <= '0';
            wait for period/2;
            CLK <= '1';
            wait for period/2;
        end loop;
    end process;
    
end Behavioral;
