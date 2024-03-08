LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_gate IS
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END nand_gate;

ARCHITECTURE nand_gate OF nand_gate IS

BEGIN
	PROCESS
	BEGIN
		IF enable = '1' THEN
			s <= b NAND a;
		END IF;
	END PROCESS;
END nand_gate;
