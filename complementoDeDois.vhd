LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY comp_de_dois IS
	PORT(
	a,b:IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(6 downto 0);
	c4: out std_logic
	);
end comp_de_dois;