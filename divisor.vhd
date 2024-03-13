LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY divisor IS
PORT(
        a,b:IN std_logic_vector(4 downto 0);
        enable:IN std_logic;
        overflow:OUT std_logic;
        s:OUT std_logic_vector(4 downto 0)
);
END divisor;

ARCHITECTURE arq_divisor OF divisor IS

BEGIN

process (a, b)
    variable q: std_logic_vector(3 downto 0);
    variable operando_dividendo: std_logic_vector(3 downto 0);
    variable b_comp1: std_logic_vector(3 downto 0);
    variable divisor: std_logic_vector(3 downto 0);
begin 
q:="0000"; 
operando_dividendo:= a(3 downto 0);
b_comp1:= not b(3 downto 0);
divisor:= b(3 downto 0);


for i in 0 to 4 loop
	if operando_dividendo >= divisor then
		operando_dividendo:= operando_dividendo - divisor;
		q:= q + "0001";
	end if;
end loop;

    if q = "0000" then
    overflow <= '1';
    else
    overflow <= '0';
    end if;

if enable = '1' then
    s(3 downto 0) <= q;
    s(4) <= a(4) XOR b(4);
    else
    s <= "00000";
    overflow <= '0';
    end if;
    end process;
END arq_divisor;