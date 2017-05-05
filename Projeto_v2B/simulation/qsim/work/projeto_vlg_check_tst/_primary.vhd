library verilog;
use verilog.vl_types.all;
entity projeto_vlg_check_tst is
    port(
        COUT_N          : in     vl_logic;
        F               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end projeto_vlg_check_tst;
