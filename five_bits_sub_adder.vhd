LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY five_bits_sub_adder IS 
	PORT(
			a,b:IN std_logic_vector(4 downto 0); 
			isSubtrator:IN std_logic;
			s: OUT std_logic_vector(4 downto 0); 
			overflow: OUT std_logic;
			enable: IN std_logic
	);
END five_bits_sub_adder;

ARCHITECTURE arq_five_bits_sub_adder OF five_bits_sub_adder IS

SIGNAL b_xor: std_logic_vector(4 downto 0);
SIGNAL overflow_xor: std_logic;
SIGNAL carry: std_logic_vector(4 downto 0);
SIGNAL adder_result: std_logic_vector(4 downto 0);

COMPONENT full_adder 
	PORT(
			a,b,c_in:IN std_logic;
			s,c_out: OUT std_logic;
			enable: IN std_logic
	);
END COMPONENT;

BEGIN

b_xor(0) <= isSubtrator XOR b(0);
b_xor(1) <= isSubtrator XOR b(1);
b_xor(2) <= isSubtrator XOR b(2);
b_xor(3) <= isSubtrator XOR b(3);
b_xor(4) <= isSubtrator XOR b(4);

soma1: full_adder
	port map(a => a(0) 
				,b => b_xor(0)
				,c_in => isSubtrator 
				,enable => enable
				,s => adder_result(0)
				,c_out => carry(0)
				);
				
				
soma2: full_adder
	port map(a=> a(1)
				,b => b_xor(1)
				,c_in => carry(0)
				,enable => enable
				,s => adder_result(1)
				,c_out => carry(1)
				);
				
				
soma3: full_adder
	port map(a=> a(2)
				,b => b_xor(2)
				,c_in => carry(1)
				,enable => enable
				,s => adder_result(2)
				,c_out => carry(2)
				);
				
				
soma4: full_adder
	port map(a=> a(3)
				,b => b_xor(3)
				,c_in => carry(2)
				,enable => enable
				,s => adder_result(3)
				,c_out => carry(3)
				);
				
soma5: full_adder
	port map(a=> a(4)
				,b => b_xor(4)
				,c_in => carry(3)
				,enable => enable
				,s => adder_result(4)
				,c_out => carry(4)
				);


	PROCESS(enable, carry(3), carry(4), adder_result(4 downto 0))
	BEGIN
			IF enable = '1' THEN
				overflow <= carry(3) XOR carry(4);
				s <= adder_result;
			ELSE
			s <= "00000";
			overflow <= '0';
			END IF;
	END PROCESS;
	
END arq_five_bits_sub_adder;