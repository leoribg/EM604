library verilog;
use verilog.vl_types.all;
entity regA is
    port(
        inputA          : in     vl_logic_vector(7 downto 0);
        c_in            : in     vl_logic;
        shift           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        enable          : in     vl_logic;
        outA            : out    vl_logic_vector(7 downto 0);
        c_out           : out    vl_logic
    );
end regA;
