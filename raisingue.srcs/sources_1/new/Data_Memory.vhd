library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

entity Data_Memory is
    Port ( addr : in STD_LOGIC_VECTOR (7 downto 0);
           Din : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC; -- 0 => Write, 1 => Read
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           --Press X to
           Dout : out STD_LOGIC_VECTOR (7 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is
    subtype data_t is std_logic_vector(7 downto 0);
    type mem_t is array (0 to 255) of data_t;
    signal mem : mem_t := (others=>(others=>'0'));
begin
    process
    begin
        wait until CLK'event and CLK = '1';
        if RW = '0' then -- Writing
            mem(TO_INTEGER(unsigned(addr))) <= Din;
        else -- Reading
            Dout <= mem(TO_INTEGER(unsigned(addr)));
        end if;
        
        if RST = '0' then
            mem <= (others=>(others=>'0'));
            Dout <= (others => '0');
        end if;
    end process;
end Behavioral;
