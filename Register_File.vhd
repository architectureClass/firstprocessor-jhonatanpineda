library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Register_File is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Reset : in  STD_LOGIC;
           DataWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type ram is array(31 downto 0) of std_logic_vector(31 downto 0);

signal registros : ram := (others => "00000000000000000000000000000000");

begin
	process(Reset,Rs1,Rs2,Rd,DataWrite)
		begin
		 if(Reset = '1') then
			 registros<=(others => "00000000000000000000000000000000");
			 CRs1 <= (others => '0');
			 CRs2 <= (others => '0');
		 else
			 if(Rd /= "00000") then
					registros(conv_integer(Rd)) <= DataWrite;
			 end if;
			 CRs1 <= registros(conv_integer(Rs1));
			 CRs2 <= registros(conv_integer(Rs2));
		 end if;
	end process;
			 
end Behavioral;

