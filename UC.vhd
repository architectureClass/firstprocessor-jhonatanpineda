----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:18 10/04/2016 
-- Design Name: 
-- Module Name:    UC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           S : out  STD_LOGIC_VECTOR (2 downto 0));
end UC;

architecture Behavioral of UC is

begin

	process(OP, OP3)
	begin
		case OP is
			when "10" =>
				case OP3 is
					when "000000" => S <= "000"; --add
					when "000100" => S <= "001"; --sub
					when "000001" => S <= "010"; --and
					when "000101" => S <= "011"; --andn
					when "000010" => S <= "100"; --or
					when "000110" => S <= "101"; --orn
					when "000011" => S <= "110"; --xor
					when "000111" => S <= "111"; --xnor
					when others => S <= "000";
				end case;
			when others => S <= "000";
		end case;
	end process;
	
end Behavioral;

