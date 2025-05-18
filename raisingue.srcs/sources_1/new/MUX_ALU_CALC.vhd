library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_ALU_CALC is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           ALU_OUT : in STD_LOGIC_VECTOR (7 downto 0);
           stdinput : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_ALU_CALC;

architecture Behavioral of MUX_ALU_CALC is
begin
    with OP select
        DOUT <= ALU_OUT when x"01",
        ALU_OUT when x"02",
        ALU_OUT when x"03",
        ALU_OUT when x"04",
        stdinput when x"0d",
        B when others;
end Behavioral;
