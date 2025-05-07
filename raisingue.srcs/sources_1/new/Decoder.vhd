library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( instr : in STD_LOGIC_VECTOR (31 downto 0);
--           CLK : IN STD_LOGIC;
           A : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           B : out STD_LOGIC_VECTOR (7 downto 0);
           C : out STD_LOGIC_VECTOR (7 downto 0);
           OP : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
begin
--PROCESS
--    BEGIN
--        WAIT UNTIL CLK'Event AND CLK = '1';
            OP <= instr(31 downto 24);
            A <= instr(23 downto 16);
            B <= instr(15 downto 8);
            C <= instr(7 downto 0);
--    end process;
end Behavioral;
