library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OP_TO_MEMOP is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           RW : out STD_LOGIC);
end OP_TO_MEMOP;

architecture Behavioral of OP_TO_MEMOP is
begin
    RW <= '0' when OP = x"0a" else '1'; -- 10 == store
end Behavioral;
