LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

USE IEEE.NUMERIC_STD.ALL;

ENTITY Flag_Memory IS
    PORT (
        input : IN STD_LOGIC;
        OP : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        RST : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        output : OUT STD_LOGIC);
END Flag_Memory;

ARCHITECTURE Behavioral OF Flag_Memory IS
    SIGNAL mem : STD_LOGIC := '0';
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'event AND CLK = '0';
        IF OP = x"09" THEN -- Writing
            mem <= input;
            output <= input;
        ELSE -- Reading
            output <= mem;
        END IF;

        IF RST = '0' THEN
            mem <= '0';
            output <= '0';
        END IF;
    END PROCESS;
END Behavioral;