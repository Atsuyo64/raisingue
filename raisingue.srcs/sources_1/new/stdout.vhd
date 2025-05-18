library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stdout is
    PORT (
        input : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        cell : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OP : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        RST : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        output0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        output1 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        output2 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end stdout;

architecture Behavioral of stdout is
    SIGNAL mem0 : STD_LOGIC_VECTOR(7 downto 0) :=  (others=>'0');
    SIGNAL mem1 : STD_LOGIC_VECTOR(7 downto 0) :=  (others=>'0');
    SIGNAL mem2 : STD_LOGIC_VECTOR(7 downto 0) :=  (others=>'0');
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL CLK'event AND CLK = '0';
        IF OP = x"0c" THEN -- Writing
            IF cell = x"00" THEN
                mem0 <= input;
                output0 <= input;
                output1 <= mem1;
                output2 <= mem2;
            ELSIF cell = x"01" THEN
                mem1 <= input;
                output1 <= input;
                output0 <= mem0;
                output2 <= mem2;
            ELSIF cell = x"02" THEN
                mem2 <= input;
                output2 <= input;
                output1 <= mem1;
                output0 <= mem0;
            ELSE    
                output0 <= mem0;
                output1 <= mem1;
                output2 <= mem2;
            END IF;
        ELSE -- Reading
            output0 <= mem0;
            output1 <= mem1;
            output2 <= mem2;
        END IF;

        IF RST = '0' THEN
            mem0 <= (others=>'0');
            mem1 <= (others=>'0');
            mem2 <= (others=>'0');
            output0 <= x"0";
            output1 <= x"0";
            output2 <= x"0";
        END IF;
    END PROCESS;
begin


end Behavioral;
