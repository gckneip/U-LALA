library verilog;
use verilog.vl_types.all;
entity square_root is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        s               : out    vl_logic_vector(4 downto 0);
        overflow        : out    vl_logic;
        enable          : in     vl_logic
    );
end square_root;
