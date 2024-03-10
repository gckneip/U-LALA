LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY full_adder IS
	PORT(
			a,b,c_in:IN std_logic;
			s,c_out: OUT std_logic;
			enable: IN std_logic
	);
END full_adder;
ARCHITECTURE arq_full_adder OF full_adder IS
BEGIN

	PROCESS(enable, a, b, c_in)
	BEGIN
			IF enable = '1' THEN
				s <= a XOR b XOR c_in;
				c_out <= (a AND b)OR (a AND c_in) OR (b and c_in);
			END IF;
	END PROCESS;
END arq_full_adder;
