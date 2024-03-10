library verilog;
use verilog.vl_types.all;
entity five_bits_sub_adder is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        isSubtrator     : in     vl_logic;
        s               : out    vl_logic_vector(4 downto 0);
        overflow        : out    vl_logic;
        enable          : in     vl_logic
    );
end five_bits_sub_adder;
