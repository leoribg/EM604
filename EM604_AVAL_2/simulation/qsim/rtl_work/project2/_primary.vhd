library verilog;
use verilog.vl_types.all;
entity project2 is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        addressA        : in     vl_logic_vector(8 downto 0);
        addressB        : in     vl_logic_vector(8 downto 0);
        quotientFlag    : out    vl_logic_vector(7 downto 0);
        remainderFlag   : out    vl_logic_vector(8 downto 0);
        finished        : out    vl_logic
    );
end project2;
