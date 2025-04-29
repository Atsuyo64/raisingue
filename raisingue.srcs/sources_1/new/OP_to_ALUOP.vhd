    library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OP_to_ALUOP is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           ALUOP : out STD_LOGIC_VECTOR (2 downto 0));
end OP_to_ALUOP;

architecture Behavioral of OP_to_ALUOP is
begin
    with OP select
        ALUOP <= "000" when x"01", --add
            "001" when x"02",      --mul
            "010" when x"03",      --sub
            "111" when x"04";      --div
end Behavioral;
