----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:10 09/30/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
			  Sc : in STD_LOGIC_VECTOR(2 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(A, B, Sc)
begin
	case Sc is
		when "000" => Result <= A + B;
		when "001" => Result <= A - B;
		when "010" => Result <= A and B;
		when "011" => Result <= A and not B;
		when "100" => Result <= A or B;
		when "101" => Result <= A or not B;
		when "110" => Result <= A xor B;
		when "111" => Result <= A xnor B;
		when others => Result <= "00000000000000000000000000000000";
	end case;
end process;
end Behavioral;

