library verilog;
use verilog.vl_types.all;
entity divisor is
    port(
        d               : in     vl_logic_vector(3 downto 0);
        m               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0);
        r               : out    vl_logic_vector(3 downto 0)
    );
end divisor;
