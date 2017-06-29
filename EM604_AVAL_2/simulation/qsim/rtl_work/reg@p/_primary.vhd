library verilog;
use verilog.vl_types.all;
entity regP is
    port(
        inputP          : in     vl_logic_vector(8 downto 0);
        desloc          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        enable          : in     vl_logic;
        c_in            : in     vl_logic;
        c_out           : out    vl_logic;
        outP            : out    vl_logic_vector(8 downto 0)
    );
end regP;
