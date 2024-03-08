LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0)	
	);
END xnor_gate;

ARCHITECTURE xnor_gate OF xnor_gate IS

BEGIN
	s <= b XNOR a;
END xnor_gate;
