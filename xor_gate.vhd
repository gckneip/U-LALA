LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate IS
	PORT(
		a,b:IN std_logic_vector(4 downto 0);
		s:OUT std_logic_vector(4 downto 0);
		enable: IN std_logic
			
	);
END xor_gate;

ARCHITECTURE xor_gate OF xor_gate IS

BEGIN
	PROCESS(enable,a,b)
	BEGIN
		IF enable = '1' THEN
		s <= a XOR b;
		END IF;
	END PROCESS;
END xor_gate;
