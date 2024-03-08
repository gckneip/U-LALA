LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_2_1 IS
	PORT(
			a,b,control:IN std_logic;
			s:OUT std_logic	
	);
END mux_2_1;

ARCHITECTURE mux_2_1 OF mux_2_1 IS

BEGIN
	s <= ((NOT control) AND a) OR (control AND b);
END mux_2_1;
