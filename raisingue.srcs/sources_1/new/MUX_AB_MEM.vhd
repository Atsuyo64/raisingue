library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_AB_MEM is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_AB_MEM;

architecture Behavioral of MUX_AB_MEM is
begin
    with OP select
        DOUT <= A when x"0a", --store
        B when x"0b",         --load
        x"00" when others;
end Behavioral;
