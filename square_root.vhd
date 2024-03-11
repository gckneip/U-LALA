LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY square_root IS
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s: OUT std_logic_vector(4 downto 0);
			overflow: OUT std_logic;
			enable: IN std_logic
	);
END square_root;

ARCHITECTURE arq_square_root OF square_root IS
BEGIN

	PROCESS (a, enable)
	BEGIN 
		IF enable = '1' THEN
				CASE a IS
					WHEN "00000" =>
						s <= "00000";
						overflow <= '0';
					WHEN "00001" =>
						s <= "00001";
						overflow <= '0';
					WHEN "00100" =>
						s <= "00010";
						overflow <= '0';
					WHEN "01001" =>
						s <= "00011";
						overflow <= '0';
					WHEN OTHERS =>
						overflow <= '1';
				END CASE;
		END IF;
		END PROCESS;
	
END arq_square_root;
