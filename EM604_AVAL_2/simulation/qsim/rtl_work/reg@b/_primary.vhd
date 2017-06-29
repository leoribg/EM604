library verilog;
use verilog.vl_types.all;
entity regB is
    port(
        inputB          : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        enable          : in     vl_logic;
        outB            : out    vl_logic_vector(8 downto 0)
    );
end regB;
