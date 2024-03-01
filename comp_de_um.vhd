LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY comp_de_um IS
	PORT(
	a:IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0);
	enable: IN std_logic
	);
end comp_de_um;
ARCHITECTURE arq_comp_de_um OF comp_de_um IS

SIGNAL COMPLEMENTO: std_logic_vector(3 downto 0);



COMPONENT four_bits_adder IS
	PORT(
			a,b:IN std_logic_vector(3 downto 0); --vetor de 0 a 3
			s: OUT std_logic_vector(3 downto 0); --vetor de 0 a 3
			c4: OUT std_logic
	);
END COMPONENT;

BEGIN
	somador :four_bits_adder
		PORT MAP (a => a, b => COMPLEMENTO, s=> n, c4 => c4);
		
	PROCESS(enable)
	BEGIN
		IF enable ='1' then
				COMPLEMENTO => 0001
		END IF;
	END PROCESS;
END arq_comp_de_um;


