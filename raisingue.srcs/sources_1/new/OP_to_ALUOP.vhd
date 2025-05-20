    library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OP_to_ALUOP is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           ALUOP : out STD_LOGIC_VECTOR (7 downto 0));
end OP_to_ALUOP;

architecture Behavioral of OP_to_ALUOP is
begin
    with OP select
        ALUOP <= x"00" when x"01", --add
            x"01" when x"02",      --mul
            x"02" when x"03",      --sub
            x"03" when x"04",      --div
            x"04" when x"09",      --noz
            x"05" when x"0e",      --<=
            x"06" when x"0f",      -->=
            x"07" when x"10",      --<
            x"08" when x"11",      -->
            x"09" when x"12",      --==
            x"0a" when x"13",      --!=
            
            x"ff" when others;
end Behavioral;
