library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


 
ENTITY TB_Register_File IS
END TB_Register_File;
 
ARCHITECTURE behavior OF TB_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Reset : IN  std_logic;
         DataWrite : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal DataWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Reset => Reset,
          DataWrite => DataWrite,
          CRs1 => CRs1,
          CRs2 => CRs2
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
			  Rs1 <= "00001";
           Rs2 <= "00010";
           Rd  <= "00000";
           DataWrite <= "00000000000000000000000000000100";
      wait for 20 ns;	
			  Rs1 <= "01000";
           Rs2 <= "10000";
           Rd  <= "00001";
           DataWrite <= "00000000000000000000000000000100";
      wait for 20 ns;
			  Rs1 <= "00101";
           Rs2 <= "00110";
           Rd  <= "10000";
           DataWrite <="00000000000000000000000000000100";
      wait;
   end process;

END;
