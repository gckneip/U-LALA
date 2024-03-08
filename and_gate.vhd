LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic	
	);
END and_gate;

ARCHITECTURE and_gate OF and_gate IS

BEGIN
	PROCESS
	BEGIN
		if(enable = '1') THEN
			s <= a AND b;
		END IF;
	END PROCESS;
	
END and_gate;
