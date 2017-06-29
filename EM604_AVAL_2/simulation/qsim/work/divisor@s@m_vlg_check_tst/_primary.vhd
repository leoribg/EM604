library verilog;
use verilog.vl_types.all;
entity divisorSM_vlg_check_tst is
    port(
        ctrlS           : in     vl_logic;
        divEnd          : in     vl_logic;
        enableA         : in     vl_logic;
        enableB         : in     vl_logic;
        enableP         : in     vl_logic;
        loadA           : in     vl_logic;
        loadB           : in     vl_logic;
        loadP           : in     vl_logic;
        out_count       : in     vl_logic_vector(2 downto 0);
        shift           : in     vl_logic;
        state           : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end divisorSM_vlg_check_tst;
