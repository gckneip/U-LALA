LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE WORK.pacoteBodePunha.all;

ENTITY ULA IS
	PORT(
	a,b:IN std_logic_vector(4 downto 0);
	c: IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(20 downto 0);
	ledNegativo: OUT std_logic;
	ledZero: OUT std_logic;
	ledOverflow: OUT std_logic
	);
END ULA;
ARCHITECTURE arq_ULA OF ULA IS

SIGNAL n: std_logic_vector(4 downto 0);
SIGNAL enable_components : std_logic_vector (15 downto 0);
SIGNAL entradaMUXFinal: MatrizMUX;
SIGNAL saidaMUXFinal: std_logic_vector (4 downto 0);


COMPONENT muxFinal 
    Port ( 
        inputs : in MatrizMUX ;
        seleciona : in STD_LOGIC_VECTOR(3 downto 0);
        output : out STD_LOGIC_VECTOR(4 downto 0)
    );
	END COMPONENT;
	 
	 
COMPONENT and_gate 
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic	
	);
END COMPONENT;
		
COMPONENT or_gate
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;
		
COMPONENT nand_gate
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;
		
COMPONENT nor_gate
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;

COMPONENT xor_gate
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;

COMPONENT xnor_gate
	PORT(
			a,b:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;
	
COMPONENT comp_de_um
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
    );
END COMPONENT;

COMPONENT comp_de_dois
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
    );
END COMPONENT;

COMPONENT five_bits_sub_adder
	PORT(
			a,b:IN std_logic_vector(4 downto 0); 
			isSubtrator:IN std_logic;
			s: OUT std_logic_vector(4 downto 0); 
			enable: IN std_logic;
			overflow: OUT std_logic
	);
END COMPONENT;
		
COMPONENT shift_r
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;

COMPONENT shift_l
	PORT(
			a:IN std_logic_vector(4 downto 0);
			s:OUT std_logic_vector(4 downto 0);
			enable: IN std_logic
	);
END COMPONENT;

COMPONENT conversor_display7Seg
	PORT (
		entrada: IN std_logic_vector(4 downto 0);
		saida: OUT std_logic_vector(20 downto 0)
	);
END COMPONENT;


BEGIN
    PROCESS (c)  
    BEGIN
        CASE c IS
            WHEN "0000" =>
                enable_components(0) <= '1';  
            WHEN "0001" =>
                enable_components(1) <= '1';
				WHEN "0010" =>
                enable_components(2) <= '1';  
				WHEN "0011" =>
                enable_components(3) <= '1'; 
				WHEN "0100" =>
                enable_components(4) <= '1';
				WHEN "0101" =>
                enable_components(5) <= '1';
				WHEN "0110" =>
                enable_components(6) <= '1';
				WHEN "0111" =>
                enable_components(7) <= '1';
				WHEN "1000" =>
                enable_components(8) <= '1';
				WHEN "1001" =>
                enable_components(9) <= '1';
				WHEN "1010" =>
                enable_components(10) <= '1';
				WHEN "1011" =>
                enable_components(11) <= '1';
				WHEN "1100" =>
                enable_components(12) <= '1';
				WHEN "1101" =>
                enable_components(13) <= '1';
				WHEN "1110" =>
                enable_components(14) <= '1';
				WHEN "1111" =>
                enable_components(15) <= '1';
				
        END CASE;
    END PROCESS;
	 
	 MUX_Final: muxFinal
		PORT MAP(
			inputs => entradaMUXFinal,
			seleciona => c,
			output => saidaMUXFinal
		);
	 
---------------------------------------OPERACOES-----------------------------------------	 
	 
	ANDGate: and_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(0),
			enable => enable_components(0)
		);
		
	ORGate: or_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(1),
			enable => enable_components(1)
		);
		
	NANDGate: nand_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(2),
			enable => enable_components(2)
		);
		
	NORGate: nor_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(3),
			enable => enable_components(3)
		);
		
	XORGate: xor_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(4),
			enable => enable_components(4)
		);
	XNORGate: xnor_gate
		PORT MAP (
			a => a,
			b => b,
			s => entradaMUXFinal(5),
			enable => enable_components(5)
		);
	
	complementadorDeUm: comp_de_um
		PORT MAP (
			a     => a,
			s => entradaMUXFinal(6),
			enable => enable_components(6)
		);
	complementadorDeDois: comp_de_dois
		PORT MAP (
			a     => a,
			s => entradaMUXFinal(7),
			enable => enable_components(7)
		);
		
	somador: five_bits_sub_adder
		PORT MAP (
			a => a,
			b => b,
			isSubtrator => '0',
			enable => enable_components(8),
			s => entradaMUXFinal(8) 
		);
	subtrator: five_bits_sub_adder
		PORT MAP (
			a => a,
			b => b,
			isSubtrator => '1',
			enable => enable_components(9),
			s => entradaMUXFinal(9) 
		);
		
	ShiftRight: shift_r
		PORT MAP (
			a(4 downto 0) => a,
			s => entradaMUXFinal(12),
			enable => enable_components(12)

		);
		
	ShiftLeft: shift_l
		PORT MAP (
			a => a,
			s => entradaMUXFinal(13),
			enable => enable_components(13)
		);
		
	Conversor7Seg: conversor_display7Seg
		PORT MAP (
			entrada => saidaMUXFinal,
			saida => s
		);
		
-------------------------------------------- LEDS-------------------------------		
		--Codigo do LED zero
		PROCESS(saidaMUXFinal)
		BEGIN
			if saidaMUXFinal(3 downto 0) = "0000" THEN
				ledZero <= '1';
			ELSE 
				ledZero <= '0';
			END IF;
		END PROCESS;
		
		--Codigo do LED negativo
		PROCESS(saidaMUXFinal)
		BEGIN
			if saidaMUXFinal(4) = '1' THEN
				ledNegativo <= '1';
			ELSE 
				ledNegativo <= '0';
			END IF;
		END PROCESS;
		

	

END arq_ULA;
