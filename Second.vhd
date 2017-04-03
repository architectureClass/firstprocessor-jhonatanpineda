----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:54 04/03/2017 
-- Design Name: 
-- Module Name:    Second - Behavioral 
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

entity Second is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Second;

architecture Behavioral of Second is

	COMPONENT PC
	PORT(
		Rst : IN std_logic;
		Clk : IN std_logic;
		Datain : IN std_logic_vector(31 downto 0);          
		Dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT IM
	PORT(
		A : IN std_logic_vector(31 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		S : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		Rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		A : IN std_logic_vector(12 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		Sc : IN std_logic;          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		Sc : IN std_logic_vector(2 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal DirAnt, Dir, Adress, SalidaIM, SalidaAlu, ConRS1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal ConRS2, SalidaSeu, SalidaMux : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal EntradaAlu : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

begin

	nPc: PC PORT MAP(
		Rst => Reset,
		Clk => Clk,
		Datain => DirAnt,
		Dataout => Dir
	);
	
	Pc0: PC PORT MAP(
		Rst => Reset,
		Clk => Clk,
		Datain => Dir,
		Dataout => Adress
	);
	
	Inst_Sumador: Sumador PORT MAP(
		A => Dir,
		B => "00000000000000000000000000000001",
		S => DirAnt
	);
		
	Inst_IM: IM PORT MAP(
		A => Adress,
		S => SalidaIM
	);
	
	Inst_UC: UC PORT MAP(
		OP => SalidaIm(31 downto 30),
		OP3 => SalidaIM(24 downto 19),
		S => EntradaAlu
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		Rst => Reset,
		rs1 => SalidaIM(18 downto 14),
		rs2 => SalidaIM(4 downto 0),
		rd => SalidaIM(29 downto 25),
		AluResult => SalidaAlu,
		crs1 => ConRS1,
		crs2 => ConRS2
	);
	
	Inst_SEU: SEU PORT MAP(
		A => SalidaIM(12 downto 0),
		S => SalidaSeu
	);
	
	Inst_MUX: MUX PORT MAP(
		A => ConRS2,
		B => SalidaSeu,
		Sc => SalidaIM(13),
		S => SalidaMux
	);
	
	Inst_ALU: ALU PORT MAP(
		A => ConRs1,
		B => SalidaMux,
		Sc => EntradaAlu,
		Result => SalidaAlu
	);
	
	AluResult <= SalidaAlu;


end Behavioral;

