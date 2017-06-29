library verilog;
use verilog.vl_types.all;
entity divisor is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        quotient        : out    vl_logic_vector(7 downto 0);
        remainder       : out    vl_logic_vector(8 downto 0);
        ini_div         : in     vl_logic;
        divEnd          : out    vl_logic;
        state           : out    vl_logic_vector(2 downto 0);
        signalOut       : out    vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        enA             : in     vl_logic;
        enB             : in     vl_logic
    );
end divisor;
