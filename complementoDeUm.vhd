LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY comp_de_um IS
	PORT(
	a:IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0)
	);
end comp_de_um;
ARCHITECTURE arq_comp_de_um OF comp_de_um IS
BEGIN
s <= a + 0001;
c_out <= a AND b;
END arq_comp_de_um;


