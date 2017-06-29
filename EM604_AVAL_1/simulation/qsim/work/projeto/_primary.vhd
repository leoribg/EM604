library verilog;
use verilog.vl_types.all;
entity projeto is
    port(
        S               : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        M               : in     vl_logic;
        CIN_N           : in     vl_logic;
        F               : out    vl_logic_vector(3 downto 0);
        COUT_N          : out    vl_logic
    );
end projeto;
