library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( instr : in STD_LOGIC_VECTOR (31 downto 0);
           A : out STD_LOGIC_VECTOR (7 downto 0);
           B : out STD_LOGIC_VECTOR (7 downto 0);
           C : out STD_LOGIC_VECTOR (7 downto 0);
           OP : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
begin
    OP <= instr(7 downto 0);
    A <= instr(15 downto 8);
    B <= instr(23 downto 16);
    C <= instr(31 downto 24);
end Behavioral;
