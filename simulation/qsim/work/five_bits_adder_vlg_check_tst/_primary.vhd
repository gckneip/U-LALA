library verilog;
use verilog.vl_types.all;
entity five_bits_adder_vlg_check_tst is
    port(
        overflow        : in     vl_logic;
        s               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end five_bits_adder_vlg_check_tst;
