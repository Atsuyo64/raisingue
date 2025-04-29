LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY PC IS
    PORT (
        CLK : IN STD_LOGIC;
        SET : IN STD_LOGIC;
        EN : IN STD_LOGIC;
        INPUT: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        PC : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END PC;

ARCHITECTURE Behavioral OF PC IS
    SIGNAL cnt : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'Event AND CLK = '1';
        IF SET = '1' THEN
            cnt <= INPUT;
        ELSIF EN = '1' THEN
            cnt <= cnt + '1';
        END IF;
    END PROCESS;
    PC <= cnt;
END Behavioral;