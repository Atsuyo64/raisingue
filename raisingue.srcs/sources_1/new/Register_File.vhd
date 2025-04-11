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

entity Register_File is
    Port ( addA : in STD_LOGIC_VECTOR (3 downto 0);
           addB : in STD_LOGIC_VECTOR (3 downto 0);
           addW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end Register_File;

architecture Behavioral of Register_File is
    subtype data_t is std_logic_vector(7 downto 0);
    type mem_t is array (0 to 15) of data_t;
    signal mem : mem_t := (others=>(others=>'0'));
begin
    process --(CLK) --Note to self: trigger on both edges
    begin
        wait until CLK'event and CLK = '1';
        
        if W = '1' then
            mem(to_integer(unsigned(addW))) <= DATA;
        end if;
        
        if W='1' and addA = addW then
            QA <= DATA;
        else
            QA <= mem(to_integer(unsigned(addA)));
        end if;
        
        if W='1' and addB = addW then
            QB <= DATA;
        else
            QB <= mem(to_integer(unsigned(addB)));
        end if;
        
        if RST = '0' then
            mem <= (others=>(others=>'0'));
            QA <= (others=>'0');
            QB <= (others=>'0');
        end if;
    end process;
end Behavioral;
