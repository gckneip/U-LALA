LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY conversor_display7Seg IS
	PORT (
		entrada: IN std_logic_vector(4 downto 0);
		saida: OUT std_logic_vector(20 downto 0)
	);
END conversor_display7Seg;

ARCHITECTURE arc_conversor_display7Seg of conversor_display7Seg IS


--As entradas do seg7 seram mapeadas assim: a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,g3 sendo a1 o mais significativo e g3 o menos. lembrando qe o mais significativo da entrada controla o g3;
BEGIN	
	PROCESS(entrada)
	BEGIN
		CASE entrada IS
			WHEN "00000" =>
				saida <= "000000100000011111111";
			WHEN "00001" =>
				saida <= "100111100000011111111";
			WHEN "00010" =>
				saida <= "001001000000011111111";
			WHEN "00011" =>
				saida <= "000011000000011111111";
			WHEN "00100" =>
				saida <= "100110000000011111111";
			WHEN "00101" =>
				saida <= "010010000000011111111";
			WHEN "00110" =>
				saida <= "010000000000011111111";
			WHEN "00111" =>
				saida <= "000111100000011111111";
			WHEN "01000" =>
				saida <= "000000000000011111111";
			WHEN "01001" =>
				saida <= "000010000000011111111";
			WHEN "01010" =>
				saida <= "000000110011111111111";
			WHEN "01011" =>
				saida <= "100111110011111111111";
			WHEN "01100" =>
				saida <= "001001010011111111111";
			WHEN "01101" =>
				saida <= "000011010011111111111";
			WHEN "01110" =>
				saida <= "100110010011111111111";
			WHEN "01111" =>
				saida <= "010010010011111111111";
			WHEN "11111" =>
				saida <= "100111100000011111110";
			WHEN "11110" =>
				saida <= "001001000000011111110";
			WHEN "11101" =>
				saida <= "000011000000011111110";
			WHEN "11100" =>
				saida <= "100110000000011111110";
			WHEN "11011" =>
				saida <= "010010000000011111110";
			WHEN "11010" =>
				saida <= "010000000000011111110";
			WHEN "11001" =>
				saida <= "000111100000011111110";
			WHEN "11000" =>
				saida <= "000000000000011111110";
			WHEN "10111" =>
				saida <= "000010000000011111110";
			WHEN "10110" =>
				saida <= "000000110011111111110";
			WHEN "10101" =>
				saida <= "100111110011111111110";
			WHEN "10100" =>
				saida <= "001001010011111111110";
			WHEN "10011" =>
				saida <= "000011010011111111110";
			WHEN "10010" =>
				saida <= "100110010011111111110";
			WHEN "10001" =>
				saida <= "010010010011111111110";
			WHEN "10000" =>
				saida <= "010000010011111111110";
		END CASE;
		END PROCESS;
END ARCHITECTURE;
		
				
	
