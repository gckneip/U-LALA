LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_r IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END shift_r;

ARCHITECTURE shift_r OF shift_r IS

SIGNAL d: std_logic_vector(3 downto 1);

COMPONENT mux_2_1
	PORT(
			a,b,control:IN std_logic;
			s:OUT std_logic	
	);
END COMPONENT;

BEGIN
	PROCESS
	BEGIN
		IF enable = '1' THEN
			s(4) <= a(4);
			s(3) <= '0';
			s(2 downto 0) <= a(3 downto 1);
		END IF;
	END PROCESS;
		
		
END shift_r;
