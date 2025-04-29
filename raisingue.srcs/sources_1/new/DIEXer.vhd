library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIEXer is
    Port ( INA : in STD_LOGIC_VECTOR (7 downto 0);
           INB : in STD_LOGIC_VECTOR (7 downto 0);
           INC : in STD_LOGIC_VECTOR (7 downto 0);
           INOP : in STD_LOGIC_VECTOR (7 downto 0);
           OUTA : out STD_LOGIC_VECTOR (7 downto 0);
           OUTB : out STD_LOGIC_VECTOR (7 downto 0);
           OUTC : out STD_LOGIC_VECTOR (7 downto 0);
           OUTOP : out STD_LOGIC_VECTOR (7 downto 0)
    );
end DIEXer;

architecture Behavioral of DIEXer is
begin
    OUTA <= INA;
    OUTB <= INB;
    OUTC <= INC;
    OUTOP <= INOP;
end Behavioral;
