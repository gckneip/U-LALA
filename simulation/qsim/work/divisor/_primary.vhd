library verilog;
use verilog.vl_types.all;
entity divisor is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        enable          : in     vl_logic;
        overflow        : out    vl_logic;
        s               : out    vl_logic_vector(4 downto 0)
    );
end divisor;
