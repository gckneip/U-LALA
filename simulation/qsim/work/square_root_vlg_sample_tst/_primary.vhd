library verilog;
use verilog.vl_types.all;
entity square_root_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end square_root_vlg_sample_tst;
