LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_r IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0)	
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
d(1) <= a(1);
d(2) <= a(2);
d(3) <= a(3);
	mux_1: mux_2_1
		port map(a => a(0)
					,b => d(1)
					,control => '0'
					,s => s(0)
					);
					
	mux_2: mux_2_1
		port map(a => d(1)
					,b => d(2)
					,control => '0'
					,s => s(1)
					);
					
	mux_3: mux_2_1
		port map(a => d(2)
					,b => d(3)
					,control => '0'
					,s => s(2)
					);
				
	mux_4: mux_2_1
		port map(a => d(3)
					,b => '0'
					,control => '0'
					,s => s(3)
					);

s(4) <= a(4);
END shift_r;
