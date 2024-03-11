LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY log2 IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s: OUT std_logic_vector(4 downto 0);
			overflow: OUT std_logic;
			enable: IN std_logic
	);
END log2;

ARCHITECTURE arq_log2 OF log2 IS
BEGIN

	PROCESS (a, enable)
	BEGIN 
		IF enable = '1' THEN
				CASE a IS
					WHEN "00001" =>
						s <= "00000";
						overflow <= '0';
					WHEN "00010" =>
						s <= "00001";
						overflow <= '0';
					WHEN "00100" =>
						s <= "00010";
						overflow <= '0';
					WHEN "01000" =>
						s <= "00011";
						overflow <= '0';
					WHEN OTHERS =>
						s <= "00000";
						overflow <= '1';
				END CASE;
		ELSE
			s <= "00000";
			overflow <= '0';
		END IF;
		END PROCESS;

	
END arq_log2;
