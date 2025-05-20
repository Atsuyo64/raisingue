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
           Opcode : in STD_LOGIC_VECTOR (4 downto 0);
           NozFlag : out STD_LOGIC;
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Negative : out STD_LOGIC);
end ALU;

architecture data_flow of ALU is
    signal aux : std_logic_vector  (15 downto 0);
    signal cle,cge,clt,cgt,ceq,cne: std_logic_vector(7 downto 0);
begin
  cle <= x"01" when unsigned(A) <= unsigned(B) else x"00";
  cge <= x"01" when unsigned(A) >= unsigned(B) else x"00";
  clt <= x"01" when unsigned(A) <  unsigned(B) else x"00";
  cgt <= x"01" when unsigned(A) >  unsigned(B) else x"00";
  ceq <= x"01" when unsigned(A) =  unsigned(B) else x"00";
  cne <= x"01" when unsigned(A) /= unsigned(B) else x"00";
    aux <= (A * B);
    with opcode select
    S <= A + B when x"0",
        aux(7 downto 0) when x"1",
        A - B when x"2",
        std_logic_vector(to_unsigned(to_integer(unsigned(A))/to_integer(unsigned(B)),8)) when x"3", --Division
        --A and B when "0011",
        --A or B when "0100",
        A when x"4", -- noz
        cle when x"5", --<=
        cge when x"6", -->=
        clt when x"7", --< 
        cgt when x"8", --> 
        ceq when x"9", --==
        cne when x"a", --!=
        A when x"f",
        A when others;
    Carry <= '1' when Opcode = "000" and (A + B) < B else '0';
    Overflow <= '1' when Opcode = "001" and aux > 255 else '0';
    Negative <= '1' when Opcode = "010" and B > A else '0';
    NozFlag <= '1' when Opcode = "101" and (A > 0 or A < 0) else '0';
end data_flow;