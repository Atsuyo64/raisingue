LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY PC IS
    PORT (
        CLK : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        SET : IN STD_LOGIC; -- EN if not SET
        --EN : IN STD_LOGIC;
        INPUT: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        SHOULD_INJECT_NOZ: IN STD_LOGIC;
        PC : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        FLUSH : OUT STD_LOGIC);
END PC;

ARCHITECTURE Behavioral OF PC IS
    SIGNAL cnt : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
    SIGNAL modulo5 : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"04";
    SIGNAL aleasFreeCnt :  STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'Event AND CLK = '1';
        IF RST = '0' THEN
            cnt <= x"00";
            modulo5 <= x"04";
            aleasFreeCnt <= x"00";
            FLUSH <= '1';
            --PC <= x"00";
        ELSE
            IF SET = '1' THEN
                modulo5 <= x"00";
                cnt <= INPUT + 1;
                aleasFreeCnt <= cnt;
                FLUSH <= '1';
            ELSE --EN = '1' THEN
                IF modulo5 = x"04" OR SHOULD_INJECT_NOZ = '0' THEN
                    modulo5 <= x"00";
                    cnt <= cnt + '1';
                    aleasFreeCnt <= cnt;
                ELSE
                    modulo5 <= modulo5 + 1;
                    aleasFreeCnt <= x"00";
                END IF;
                FLUSH <= '0';
            END IF;
        END IF;
    END PROCESS;
    PC <= aleasFreeCnt;
END Behavioral;