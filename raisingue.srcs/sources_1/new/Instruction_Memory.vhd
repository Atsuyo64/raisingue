library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

entity Instruction_Memory is
    Port ( addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           --Press X to
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
    subtype data_t is std_logic_vector(31 downto 0);
    type mem_t is array (0 to 255) of data_t;
    signal mem : mem_t := (others=>(others=>'0'));
begin
    process
    begin
        wait until CLK'event and CLK = '1';
        Dout <= mem(TO_INTEGER(unsigned(addr)));
    end process;
end Behavioral;
