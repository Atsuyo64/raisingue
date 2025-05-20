library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_BC_MEM_INPUT is
    Port ( OP : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (7 downto 0);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_BC_MEM_INPUT;

architecture Behavioral of MUX_BC_MEM_INPUT is
begin
    with OP select
        DOUT <= B when x"0a", --store
            C when x"14",     --srf
            x"00" when others;
end Behavioral;
