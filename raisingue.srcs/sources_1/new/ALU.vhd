--library xil_defaultlib;
--use xil_defaultlib.Common.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
--           sw          : in std_logic_vector(15 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Opcode : in STD_LOGIC_VECTOR (2 downto 0);
           Carry : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Negative : out STD_LOGIC);
end ALU;

architecture data_flow of ALU is
    --type OP is (add_op,mult_op,sub_op,and_op,or_op,xor_op,not_op);
    signal aux : std_logic_vector  (15 downto 0);
begin
    --wait on A,B,Opcode;
    aux <= (A * B);
    with opcode select
    S <= A + B when "000",
        aux(7 downto 0) when "001",
        A - B when "010",
        A and B when "011",
        A or B when "100",
        A xor B when "101",
        not A when "110",
        std_logic_vector(to_unsigned(to_integer(unsigned(A))/to_integer(unsigned(B)),8)) when "111"; --Division
    Carry <= '1' when Opcode = "000" and (A + B) < B else '0';
    Overflow <= '1' when Opcode = "001" and aux > 255 else '0';
    Negative <= '1' when Opcode = "010" and B > A else '0';
end data_flow;