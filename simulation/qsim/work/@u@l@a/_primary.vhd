library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        c               : in     vl_logic_vector(3 downto 0);
        saida7SEG       : out    vl_logic_vector(20 downto 0);
        saidaLEDS       : out    vl_logic_vector(4 downto 0);
        ledNegativo     : out    vl_logic;
        ledZero         : out    vl_logic;
        ledOverflow     : out    vl_logic
    );
end ULA;
