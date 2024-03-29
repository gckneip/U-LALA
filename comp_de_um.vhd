LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY comp_de_um IS
    PORT(
        a: IN std_logic_vector(4 downto 0);
        s: OUT std_logic_vector(4 downto 0);
        enable: IN std_logic
    );
END comp_de_um;

ARCHITECTURE arq_comp_de_um OF comp_de_um IS

BEGIN
    PROCESS(a, enable)
    BEGIN
			IF enable = '1' THEN
				s <= NOT a;
			END IF;
    END PROCESS;
END arq_comp_de_um;
