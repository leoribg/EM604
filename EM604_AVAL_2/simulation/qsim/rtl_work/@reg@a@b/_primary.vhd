library verilog;
use verilog.vl_types.all;
entity RegAB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inputA          : in     vl_logic_vector(7 downto 0);
        inputB          : in     vl_logic_vector(7 downto 0);
        enA             : in     vl_logic;
        enB             : in     vl_logic;
        signalOut       : out    vl_logic;
        outA            : out    vl_logic_vector(7 downto 0);
        outB            : out    vl_logic_vector(7 downto 0)
    );
end RegAB;
