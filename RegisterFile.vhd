----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:50 09/30/2016 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
    Port ( --Clk : in STD_LOGIC;
			  Rst : in STD_LOGIC;
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

type ram is array(31 downto 0) of std_logic_vector(31 downto 0);
signal registros : ram := (others => "00000000000000000000000000000000");

begin
	process(Rst, rs1, rs2, rd, AluResult)
	begin
		if(Rst = '1') then
			registros <= (others => "00000000000000000000000000000000");
			crs1 <= (others => '0');
			crs2 <= (others => '0');
		else
			if(rd /= "00000") then
				registros(conv_integer(rd)) <= AluResult;
			end if;
			crs1 <= registros(conv_integer(rs1));
			crs2 <= registros(conv_integer(rs2)); 
		end if;
	end process;
end Behavioral;

