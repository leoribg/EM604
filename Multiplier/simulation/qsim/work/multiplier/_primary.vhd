library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        loadA           : in     vl_logic;
        loadB           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        S               : out    vl_logic_vector(15 downto 0)
    );
end multiplier;
