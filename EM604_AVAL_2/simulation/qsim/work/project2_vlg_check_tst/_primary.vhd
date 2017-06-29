library verilog;
use verilog.vl_types.all;
entity project2_vlg_check_tst is
    port(
        finished        : in     vl_logic;
        quotientFlag    : in     vl_logic_vector(7 downto 0);
        remainderFlag   : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end project2_vlg_check_tst;
