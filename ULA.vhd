LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ULA IS
	PORT(
	a,b:IN std_logic_vector(4 downto 0);
	c: IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(4 downto 0)
	);
END ULA;
ARCHITECTURE arq_ULA OF ULA IS


TYPE MatrizMUX IS ARRAY(15 downto 0) OF std_logic_vector(4 downto 0);

SIGNAL n: std_logic_vector(4 downto 0);
SIGNAL enable_components : std_logic_vector (15 downto 0);
SIGNAL entradaMUXFinal: MatrizMUX;


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
	
COMPONENT comp_de_um
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
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
			s:OUT std_logic_vector(4 downto 0)	
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
			entradaMUXFinal => inputs,
			seleciona => c,
			s => output
		);
	 
	 
	ANDGate: and_gate
		PORT MAP (
			a => a,
			b => b,
			entradaMUXFinal(0) => s,
			enable_components(0) => enable
		);
		
	ORGate: or_gate
		PORT MAP (
			a => a,
			b => b,
			entradaMUXFinal(1) => s,
			enable_components(1) => enable
		);
		
	NANDGate: nand_gate
		PORT MAP (
			a => a,
			b => b,
			entradaMUXFinal(2) => s,
			enable_components(2) => enable
		);
		
	NORGate: nor_gate
		PORT MAP (
			a => a,
			b => b,
			entradaMUXFinal(3) => s,
			enable_components(3) => enable
		);
	
	complementadorDeUm: comp_de_um
		PORT MAP (
			a     => a,
			s      => n,
			entradaMUXFinal(6) => s,
			enable_components(6) => enable
		);
		
	ShiftRight: shift_r
		PORT MAP (
			a(4 downto 0) => a,
			entradaMUXFinal(12) => s,
			enable_components(12) => enable

		);
		
	ShiftLeft: shift_l
		PORT MAP (
			a => a,
			entradaMUXFinal(13) => s
		);

END arq_ULA;
