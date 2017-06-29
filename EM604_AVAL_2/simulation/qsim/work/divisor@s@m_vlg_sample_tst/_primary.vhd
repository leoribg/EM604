library verilog;
use verilog.vl_types.all;
entity divisorSM_vlg_sample_tst is
    port(
        bitP            : in     vl_logic;
        clk             : in     vl_logic;
        ini_div         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end divisorSM_vlg_sample_tst;
