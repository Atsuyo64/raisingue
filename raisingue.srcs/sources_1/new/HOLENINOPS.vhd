library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HOLENINOPS is
    Port ( instr : in STD_LOGIC_VECTOR (7 downto 0);
           NOP_CNT : out STD_LOGIC_VECTOR (2 downto 0));
end HOLENINOPS;

architecture Behavioral of HOLENINOPS is
begin
    with instr select
        NOP_CNT <= x"7" when x"0", --IMPORTANT: 7 == DONT CHANGE NOP "COOLDOWN"
            x"4" when x"1", -- ADD
            x"4" when x"2", -- MUL
            x"4" when x"3", -- SUB
            x"4" when x"4", -- DIV
            x"6" when x"5", -- COP (ERROR)
            x"4" when x"6", -- AFC
            x"0" when x"7", -- JMP
            x"0" when x"8", -- JMF
            x"0" when x"9", -- NOZ
            x"0" when x"a", -- STR
            x"4" when x"b", -- LDR
            x"6" when others; -- Should not happen, 6 == ERROR

end Behavioral;
