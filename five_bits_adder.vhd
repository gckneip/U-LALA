LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY five_bits_adder IS -- criando entidade e definindo as entradas
	PORT(
			a,b:IN std_logic_vector(4 downto 0); 
			s: OUT std_logic_vector(4 downto 0); 
			overflow: OUT std_logic;
			enable: IN std_logic
	);
END five_bits_adder;

ARCHITECTURE arq_five_bits_adder OF five_bits_adder IS --criando arquitetura do somador de 4 bits

SIGNAL c: std_logic_vector(4 downto 0); 
SIGNAL sexo: std_logic_vector(4 downto 0); --Sinal da XOR entre isSubtrator e b
SIGNAL foda: std_logic_vector(3 downto 0); --Sinal das saidas dos somadores

COMPONENT full_adder 
	PORT(
			a,b,c_in:IN std_logic;
			s,c_out: OUT std_logic;
			enable: IN std_logic
	);
END COMPONENT;

BEGIN -- mapeando entradas dos componentes com a do componente final (four bits adder)

soma1: full_adder
	port map(a => a(0) 
				,b => b(0) --Precisa vir de um ex-or entre b e o controle
				,c_in => '0'
				,enable => enable
				,s => foda(0)
				,c_out => c(1)
				);
				
				
soma2: full_adder
	port map(a=> a(1)
				,b => b(1) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(1)
				,enable => enable
				,s => foda(1)
				,c_out => c(2)
				);
				
				
soma3: full_adder
	port map(a=> a(2)
				,b => b(2) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(2)
				,enable => enable
				,s => foda(2)
				,c_out => c(3)
				);
				
				
soma4: full_adder
	port map(a=> a(3)
				,b => b(3) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(3)
				,enable => enable
				,s => foda(3)
				,c_out => c(4)
				);
				
	PROCESS(enable, a(4), b(4), c(4), foda(3 downto 0))
	BEGIN
			IF enable = '1' THEN
				overflow <= (NOT(a(4)) AND NOT(b(4)) AND c(4)) OR (a(4) AND b(4) AND c(4)); 
				s(3 downto 0) <= foda(3 downto 0);
				s(4) <= ((a(4) AND b(4)) OR (a(4) AND NOT(c(4))) OR (b(4) AND NOT(c(4)))) AND (foda(0) OR foda(1) OR foda(2) OR foda(3));
			END IF;
	END PROCESS;
	
END arq_five_bits_adder;
