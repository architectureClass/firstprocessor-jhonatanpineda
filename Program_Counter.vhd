library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Program_Counter is
    Port ( DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin

	process(Reset, Clk, DataIn)
	begin
		if(Reset = '1') then
			DataOut <= (others => '0');
		elsif(rising_edge(Clk)) then
			DataOut <= DataIn;
		end if;
	end process;

end Behavioral;

