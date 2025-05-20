library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_MEM_B is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           MEM : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_MEM_B;

architecture Behavioral of MUX_MEM_B is
begin
    DOUT <= MEM when OP = x"0b" or OP = x"15" else B;
end Behavioral;
