
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY five_bits_multiplicator IS -- criando entidade e definindo as entradas
	PORT(
			a,b:IN std_logic_vector(4 downto 0); 
			s: OUT std_logic_vector(4 downto 0); 
			overflow: OUT std_logic;
			enable: IN std_logic
	);
END five_bits_multiplicator;

ARCHITECTURE arq_five_bits_multiplicator OF five_bits_multiplicator IS 

SIGNAL and_signal: std_logic_vector(15 downto 0); --sinal da saída de cada AND entre a e b
SIGNAL adder_out_signal: std_logic_vector(5 downto 0); --Sinal que sai dos somadores 
SIGNAL overflow_signal: std_logic_vector(1 downto 0);
SIGNAL adder_carry: std_logic_vector(2 downto 0);
SIGNAL detecta_0: std_logic_vector(1 downto 0); --Detecta 0 nas saídas e fará uma OR com o overflow_signal(1)

COMPONENT full_adder 
	PORT(
			a,b,c_in:IN std_logic;
			s,c_out: OUT std_logic;
			enable: IN std_logic
	);
END COMPONENT;

BEGIN 
and_signal(0) <= a(0) AND b(0);
and_signal(1) <= a(0) AND b(1);
and_signal(2) <= a(0) AND b(2);
and_signal(3) <= a(0) AND b(3);
and_signal(4) <= a(1) AND b(0);
and_signal(5) <= a(1) AND b(1);
and_signal(6) <= a(1) AND b(2);
and_signal(7) <= a(1) AND b(3);
and_signal(8) <= a(2) AND b(0);
and_signal(9) <= a(2) AND b(1);
and_signal(10) <= a(2) AND b(2);
and_signal(11) <= a(2) AND b(3);
and_signal(12) <= a(3) AND b(0);
and_signal(13) <= a(3) AND b(1);
and_signal(14) <= a(3) AND b(2);
and_signal(15) <= a(3) AND b(3);

overflow_signal(0) <= a(4) XOR b(4);
overflow_signal(1) <= and_signal(7) OR and_signal(10) OR and_signal(11) OR and_signal(13) OR and_signal(14) OR and_signal(15);


soma1_0: full_adder
	port map(a => and_signal(1) 
				,b => and_signal(4) 
				,c_in => '0'
				,enable => enable
				,s => adder_out_signal(0)
				,c_out => adder_carry(0)
				);
				
				
soma1_1: full_adder
	port map(a=> and_signal(2)
				,b => and_signal(5)
				,c_in => adder_carry(0)
				,enable => enable
				,s => adder_out_signal(1)
				,c_out => adder_carry(1)
				);
				
				
soma1_2: full_adder
	port map(a=> and_signal(3)
				,b => and_signal(6)
				,c_in => adder_carry(1)
				,enable => enable
				,s => adder_out_signal(2)
				--,c_out => '0'
				);
				
				
soma2_0: full_adder
	port map(a=> and_signal(8)
				,b => adder_out_signal(1)
				,c_in => '0'
				,enable => enable
				,s => adder_out_signal(3)
				,c_out => adder_carry(2)
				);
				
soma2_1: full_adder
	port map(a=> and_signal(9)
				,b => adder_out_signal(2)
				,c_in => adder_carry(2)
				,enable => enable
				,s => adder_out_signal(4)
				--,c_out => '0'
				);
			
soma3: full_adder
	port map (a=> and_signal(12)
				,b => adder_out_signal(4)
				,c_in => adder_carry(2)
				,enable => enable
				,s => adder_out_signal(5)
				--,c_out => '0'
				);

	PROCESS(and_signal(0), adder_out_signal(0), adder_out_signal(3),adder_out_signal(5), overflow_signal(1 downto 0))
	BEGIN
			IF enable = '1' THEN
				detecta_0(0) <= and_signal(0) OR adder_out_signal(0) OR adder_out_signal(3) OR adder_out_signal(5);
				detecta_0(1) <= detecta_0(0) OR overflow_signal(1); --Detecção de overflow pelas ANDs + verificar se a saida é diferente de 0
				s(0) <= and_signal(0);
				s(1) <= adder_out_signal(0);
				s(2) <= adder_out_signal(3);
				s(3) <= adder_out_signal(5);
				s(4) <= overflow_signal(0) AND detecta_0(1); --AND entre a XOR de A(4) com B(4) e a detecção de 0
				overflow <= NOT overflow_signal(0) AND overflow_signal(1); --AND entre a XOR de A(4) com B(4) e a detecção de overflow com ANDs
				
			ELSE 
				s <= "00000";
				overflow <= '0';
			END IF;
	END PROCESS;
	
END arq_five_bits_multiplicator;
