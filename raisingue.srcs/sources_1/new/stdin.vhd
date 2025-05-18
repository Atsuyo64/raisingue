library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity stdin is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           offset : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end stdin;

architecture Behavioral of stdin is
    --SIGNAL interm : STD_LOGIC := '0';
begin
    DOUT <= x"01" when OP = x"0d" and offset < x"10" and sw(TO_INTEGER(unsigned(offset))) = '1' else x"00"; 
end Behavioral;
