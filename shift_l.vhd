LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_l IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END shift_l;

ARCHITECTURE arc_shift_l OF shift_l IS

BEGIN
	PROCESS(enable,a)
	BEGIN
		IF enable = '1' THEN
			s(4) <= a(4);
			s(0) <= '0';
			s(3 downto 1) <= a(2 downto 0);
		END IF;
	END PROCESS;
END arc_shift_l;
