LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY TB_Program_Counter IS
END TB_Program_Counter;
 
ARCHITECTURE behavior OF TB_Program_Counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(
         DataIn : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          DataIn => DataIn,
          Reset => Reset,
          Clk => Clk,
          DataOut => DataOut
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Reset <= '1';
		DataIn <= "10000000000000000000000000000000";
      wait for 20 ns;
		
		Reset <= '0';
		DataIn <= "00000000000000000000000000000001";
      wait;
   end process;

END;
