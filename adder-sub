LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY five_bits_sub_adder IS -- criando entidade e definindo as entradas
	PORT(
			a,b:IN std_logic_vector(4 downto 0); 
			isSubtrator:IN std_logic;
			s: OUT std_logic_vector(4 downto 0); 
			overflow: OUT std_logic
	);
END five_bits_sub_adder;
ARCHITECTURE arq_five_bits_sub_adder OF five_bits_sub_adder IS --criando arquitetura do somador de 4 bits

SIGNAL c: std_logic_vector(3 downto 0); 
SIGNAL sexo: std_logic_vector(4 downto 0);

COMPONENT full_adder 
	PORT(
			a,b,c_in:IN std_logic;
			s,c_out: OUT std_logic
	);
END COMPONENT;

BEGIN -- mapeando entradas dos componentes com a do componente final (four bits adder)
PROCESS(isSubtrator, sexo, b)
BEGIN  
	IF isSubtrator = '1'
		THEN sexo <= isSubtrator XOR b; --Conferir se isso funciona: atribuir um vetor ao outro
	ELSE 
		sexo <= b;
	END IF
END PROCESS

soma1: full_adder
	port map(a => a(0) 
				,b => sexo(0) --Precisa vir de um ex-or entre b e o controle
				,c => isSubtrator --Vem direto do controle
				,s => s(0)
				,c_out => c(0)
				);
				
				
soma2: full_adder
	port map(a=> a(1)
				,b => sexo(1) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(0)
				,s => s(1)
				,c_out => c(1)
				);
				
				
soma3: full_adder
	port map(a=> a(2)
				,b => sexo(2) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(1)
				,s => s(2)
				,c_out => c(2)
				);
				
				
soma4: full_adder
	port map(a=> a(3)
				,b => sexo(3) --Precisa vir de um ex-or entre b e o controle
				,c_in => c(2)
				,s => s(3)
				,c_out => c(3)
				);

overflow <= (NOT(a(4)) AND NOT(b(4)) AND c(3)) OR (a(4) AND b(4) AND NOT(c(3))); 
s(4) <= ((a(4) AND b(4)) OR (a(4) AND NOT(c(3))) OR (b(4) AND NOT(c(3)))) AND (s(0) OR s(1) OR s(2) OR s(3));
	
END arq_five_bits_sub_adder;
