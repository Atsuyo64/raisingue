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
    signal mem : mem_t := (x"00000000", -- NEVER CHANGE THIS !
x"0600fe00",
x"0a020000",
x"0b010200",
x"0a010100",
x"06000000",
x"0a030000",
x"0b010300",
x"0a020100",
x"0b030100",
x"09000300",
x"082c0000",
x"06000100",
x"0a030000",
x"0b030300",
x"09000300",
x"08230000",
x"0600ff00",
x"0a040000",
x"0b010100",
x"0b020400",
x"03000102",
x"0a030000",
x"0b030300",
x"09000300",
x"081e0000",
x"06004200",
x"0a030000",
x"0b010300",
x"0a020100",
x"07220000",
x"06004000",
x"0a030000",
x"0b010300",
x"0a020100",
x"07230000",
x"06000100",
x"0a040000",
x"0b010100",
x"0b020400",
x"01000102",
x"0a030000",
x"0b010300",
x"0a010100",
x"07080000",
x"06006800",
x"0a040000",
x"0b010400",
x"0a030100",
x"06000100",
x"0a050000",
x"0b010300",
x"0b020500",
x"01000102",
x"0a040000",
x"0b010400",
x"0a030100",
others=>(others=>'0'));
begin
    process
    begin
--        Dout <= x"deadbeef";
        wait until CLK'event and CLK = '1';
        Dout <= mem(TO_INTEGER(unsigned(addr)));
    end process;
end Behavioral;
