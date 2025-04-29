LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

USE IEEE.NUMERIC_STD.ALL;

ENTITY Data_Memory IS
    PORT (
        addr : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Din : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        RW : IN STD_LOGIC; -- 0 => Write, 1 => Read
        RST : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        --Press X to
        Dout : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END Data_Memory;

ARCHITECTURE Behavioral OF Data_Memory IS
    SUBTYPE data_t IS STD_LOGIC_VECTOR(7 DOWNTO 0);
    TYPE mem_t IS ARRAY (0 TO 255) OF data_t;
    SIGNAL mem : mem_t := (OTHERS => (OTHERS => '0'));
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'event AND CLK = '1';
        IF RW = '0' THEN -- Writing
            mem(TO_INTEGER(unsigned(addr))) <= Din;
        ELSE -- Reading
            Dout <= mem(TO_INTEGER(unsigned(addr)));
        END IF;

        IF RST = '0' THEN
            mem <= (OTHERS => (OTHERS => '0'));
            Dout <= (OTHERS => '0');
        END IF;
    END PROCESS;
END Behavioral;