library verilog;
use verilog.vl_types.all;
entity ULA_vlg_check_tst is
    port(
        ledNegativo     : in     vl_logic;
        ledOverflow     : in     vl_logic;
        ledZero         : in     vl_logic;
        saida7SEG       : in     vl_logic_vector(20 downto 0);
        saidaLEDS       : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end ULA_vlg_check_tst;
