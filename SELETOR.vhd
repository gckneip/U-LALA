LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY seletor IS
	PORT(
	a:IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0);
	);
end seletor;


ARCHITECTURE arq_seletor OF seletor IS


BEGIN
s <= a + 0001;
c_out <= a AND b;
END arq_seletor;


