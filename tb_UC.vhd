--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:08:37 10/04/2016
-- Design Name:   
-- Module Name:   D:/Arquitectura/Componentes/UC/tb_UC.vhd
-- Project Name:  UC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UC
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_UC IS
END tb_UC;
 
ARCHITECTURE behavior OF tb_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         S : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          OP => OP,
          OP3 => OP3,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
      OP <= "10";
		OP3 <= "000000";
      wait for 20 ns;
		
		OP3 <= "000100";
      wait for 20 ns;	
		
		OP3 <= "000001";
      wait for 20 ns;	
		
		OP3 <= "000010";
      wait for 20 ns;	
		
		OP3 <= "000011";
      wait for 20 ns;	
		
		OP3 <= "000111";
      wait for 20 ns;	
		
		OP3 <= "100101";
      wait for 20 ns;	
		
		OP3 <= "100110";
      wait for 20 ns;	
		
		OP <= "11";
      wait for 20 ns;	

      wait;
   end process;

END;
