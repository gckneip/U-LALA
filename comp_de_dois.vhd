LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY comp_de_dois IS
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
    );
END comp_de_dois;

ARCHITECTURE arq_comp_de_dois OF comp_de_dois IS

SIGNAL saida_comp_de_um: std_logic_vector(4 downto 0);

COMPONENT comp_de_um
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
    );
	 END COMPONENT	;
	
COMPONENT five_bits_sub_adder
	PORT(
			a,b: IN std_logic_vector(4 downto 0); 
			isSubtrator:IN std_logic;
			s: OUT std_logic_vector(4 downto 0); 
			overflow: OUT std_logic
	);
	END COMPONENT;
	

BEGIN

	complementadorDeUm: comp_de_um
		PORT MAP (
			a     => a,
			s => saida_comp_de_um,
			enable => enable
		);
	adder_sub: five_bits_sub_adder
	PORT MAP (
		a => saida_comp_de_um,
		b => "00001",
		isSubtrator => '0',
		s => s
	);

END arq_comp_de_dois;
