library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEMREr is
    Port ( INA : in STD_LOGIC_VECTOR (7 downto 0);
           INB : in STD_LOGIC_VECTOR (7 downto 0);
           INOP : in STD_LOGIC_VECTOR (7 downto 0);
           OUTA : out STD_LOGIC_VECTOR (7 downto 0);
           OUTB : out STD_LOGIC_VECTOR (7 downto 0);
           OUTOP : out STD_LOGIC_VECTOR (7 downto 0)
    );
end MEMREr;

architecture Behavioral of MEMREr is
begin
    OUTA <= INA;
    OUTB <= INB;
    OUTOP <= INOP;
end Behavioral;
