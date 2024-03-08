LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0)	
	);
END nand_gate;

ARCHITECTURE nand_gate OF nand_gate IS

BEGIN
	s <= b NAND a;
END nand_gate;
