library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OP_TO_RFW is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           RFW : out STD_LOGIC);
end OP_TO_RFW;

architecture Behavioral of OP_TO_RFW is
begin
    RFW <= '0' when OP = x"0a" or OP = "UUUUUUUU" or OP = x"00" or OP = x"09" or OP = x"0c" or OP = x"14" else '1'; --write always except when store (op = 10)
end Behavioral;
