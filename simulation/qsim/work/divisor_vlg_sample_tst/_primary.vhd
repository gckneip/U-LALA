library verilog;
use verilog.vl_types.all;
entity divisor_vlg_sample_tst is
    port(
        d               : in     vl_logic_vector(3 downto 0);
        m               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end divisor_vlg_sample_tst;
