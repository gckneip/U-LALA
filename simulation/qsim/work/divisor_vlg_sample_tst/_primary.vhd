library verilog;
use verilog.vl_types.all;
entity divisor_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end divisor_vlg_sample_tst;
