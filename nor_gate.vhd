LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END nor_gate;

ARCHITECTURE nor_gate OF nor_gate IS

BEGIN
	PROCESS
	BEGIN
		IF enable = '1' THEN
			s <= NOT(b OR a);
		END IF;
	END PROCESS;
END nor_gate;
