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
    signal mem : mem_t := (x"06000500",x"0a080000",x"0b010800",x"0a040100",x"06000100",x"0a100000",x"0b010400",x"0b021000",x"01000102",x"0a0c0000",x"0b010c00",x"0a080100",others=>(others=>'0'));
begin
    process
    begin
--        Dout <= x"deadbeef";
        wait until CLK'event and CLK = '1';
        Dout <= mem(TO_INTEGER(unsigned(addr)));
    end process;
end Behavioral;
