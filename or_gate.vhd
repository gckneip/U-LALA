LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END or_gate;

ARCHITECTURE or_gate OF or_gate IS

BEGIN
	PROCESS
	BEGIN
		IF enable = '1' THEN
			s <= a OR b;
		END IF;
	END PROCESS;
END or_gate;
