--library xil_defaultlib;
--use xil_defaultlib.Common.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Opcode : in STD_LOGIC_VECTOR (2 downto 0);
           NozFlag : out STD_LOGIC;
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Negative : out STD_LOGIC);
end ALU;

architecture data_flow of ALU is
    signal aux : std_logic_vector  (15 downto 0);
begin
    aux <= (A * B);
    with opcode select
    S <= A + B when "000",
        aux(7 downto 0) when "001",
        A - B when "010",
        A and B when "011",
        A or B when "100",
        A when "101", -- noz
        A when "110",
        std_logic_vector(to_unsigned(to_integer(unsigned(A))/to_integer(unsigned(B)),8)) when "111", --Division
        A when others;
    Carry <= '1' when Opcode = "000" and (A + B) < B else '0';
    Overflow <= '1' when Opcode = "001" and aux > 255 else '0';
    Negative <= '1' when Opcode = "010" and B > A else '0';
    NozFlag <= '1' when Opcode = "101" and (A > 0 or A < 0) else '0';
end data_flow;