library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( instr : in STD_LOGIC_VECTOR (31 downto 0);
--           CLK : IN STD_LOGIC;
           A : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           B : out STD_LOGIC_VECTOR (7 downto 0);
           C : out STD_LOGIC_VECTOR (7 downto 0);
           NOZ_FLAG : in STD_LOGIC;
           SET_PC : out STD_LOGIC;
           PC_VALUE : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           IS_REG_WRITE_OP : out STD_LOGIC;
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
            SET_PC <= '1' when instr(31 downto 24) = x"07" or (instr(31 downto 24) = x"08" and NOZ_FLAG = '0') else '0';
            PC_VALUE <= instr(23 downto 16) when instr(31 downto 24) = x"07" or (instr(31 downto 24) = x"08" and NOZ_FLAG = '0') else x"00";
            IS_REG_WRITE_OP <= '0' when instr(31 downto 24) = x"0a" or instr(31 downto 24) = x"0c" or instr(31 downto 24) = "UUUUUUUU" or instr(31 downto 24) = x"09" or instr(31 downto 24) = x"15" else '1';
--    end process;
end Behavioral;
