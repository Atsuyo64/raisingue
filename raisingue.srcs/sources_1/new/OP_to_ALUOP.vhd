    library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OP_to_ALUOP is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           ALUOP : out STD_LOGIC_VECTOR (4 downto 0));
end OP_to_ALUOP;

architecture Behavioral of OP_to_ALUOP is
begin
    with OP select
        ALUOP <= x"0" when x"01", --add
            x"1" when x"02",      --mul
            x"2" when x"03",      --sub
            x"3" when x"04",      --div
            x"4" when x"09",      --noz
            x"5" when x"0e",      --<=
            x"6" when x"0f",      -->=
            x"7" when x"10",      --<
            x"8" when x"11",      -->
            x"9" when x"12",      --==
            x"a" when x"13",      --!=
            
            x"f" when others;
end Behavioral;
