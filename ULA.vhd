LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY ULA IS
	PORT(
	a,b:IN std_logic_vector(4 downto 0);
	c: IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(13 downto 0)
	);
END ULA;
ARCHITECTURE arq_ULA OF ULA IS


SIGNAL n: std_logic_vector(4 downto 0);
SIGNAL enable_components : std_logic_vector (15 downto 0);




COMPONENT comp_de_um IS
	PORT(
	a:IN std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0);
	enable: IN std_logic
	);
END COMPONENT;
BEGIN
    PROCESS (c)  
    BEGIN
        CASE c IS
            WHEN "0000" =>
                enable_components(0) <= '1';  
            WHEN OTHERS =>
                enable_comp1 <= '0'; 
        END CASE;
    END PROCESS;
	
	complementadorDeUm: comp_de_um
		PORT MAP (
			 a(3 downto 0)      => a(3 downto 0),
			 s(3 downto 0)      => n(3 downto 0),
			 enable => enable_comp1
		);

END arq_ULA;
