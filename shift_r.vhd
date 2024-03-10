LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_r IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END shift_r;

ARCHITECTURE arc_shift_r OF shift_r IS

BEGIN
	PROCESS(enable,a)
	BEGIN
		IF enable = '1' THEN
			s(4) <= a(4);
			s(3) <= '0';
			s(2 downto 0) <= a(3 downto 1);
		END IF;
	END PROCESS;
		
		
END arc_shift_r;
