library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    signal CLK : std_logic := '0';
    constant period : time := 10 ns;
begin
    uut: entity work.main
    generic map (g_num_bits => 1)
    port map(PCLOCK=>CLK,IRST=>'0',sw=>x"0002",PC_out=>open, OUT0=>open,ss_seg=>open, ss_an=>open);
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
