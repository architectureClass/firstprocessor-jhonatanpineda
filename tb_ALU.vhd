--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:18:39 09/30/2016
-- Design Name:   
-- Module Name:   D:/Arquitectura/Componentes/ALU/tb_ALU.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Sc : IN  std_logic_vector(2 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Sc : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Sc => Sc,
          Result => Result
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		Sc <= "000";
		A <= "00000000000000000000000010001000";
		B <= "00000000000000000000000000001000";
      wait for 100 ns;
		
		Sc <= "001";
		wait for 100 ns;
		
		Sc <= "010";
		wait for 100 ns;
		
		Sc <= "011";
		wait for 100 ns;
		
		Sc <= "100";
		wait for 100 ns;
		
		Sc <= "101";
		wait for 100 ns;
		
		Sc <= "110";
		wait for 100 ns;
		
		Sc <= "111";
		wait;
   end process;

END;
