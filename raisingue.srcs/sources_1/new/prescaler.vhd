LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY prescaler IS
    GENERIC (
        g_num_bits : INTEGER := 1
    );
    PORT (
        ClockIn : IN STD_LOGIC;
        ClockOut : OUT STD_LOGIC);
END prescaler;

ARCHITECTURE Beh OF prescaler IS
    SIGNAL counter : STD_LOGIC_VECTOR ((g_num_bits - 1) DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL ClockIn'Event AND ClockIn = '1';
        counter <= counter + '1';
        ClockOut <= counter(g_num_bits - 1);
    END PROCESS;
END Beh;