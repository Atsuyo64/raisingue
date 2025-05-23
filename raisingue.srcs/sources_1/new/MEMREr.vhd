LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MEMREr IS
    PORT (
        CLK : IN STD_LOGIC;
        FLUSH : IN STD_LOGIC;
        INA : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        INB : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        INOP : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OUTA : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        OUTB : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OUTOP : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END MEMREr;

ARCHITECTURE Behavioral OF MEMREr IS
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'Event AND CLK = '1';
        IF FLUSH = '0' THEN
            OUTA <= INA(3 downto 0);
            OUTB <= INB;
            OUTOP <= INOP;
        ELSE
            OUTA <= x"0";  
            OUTB <= x"00";  
            OUTOP <= x"00";
        END IF;
    END PROCESS;
END Behavioral;