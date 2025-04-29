library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RF_AFC is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           QA : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_RF_AFC;

architecture Behavioral of MUX_RF_AFC is
begin
    DOUT <= B when OP = x"06" else QA;
end Behavioral;
