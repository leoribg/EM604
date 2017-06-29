library verilog;
use verilog.vl_types.all;
entity project2_vlg_sample_tst is
    port(
        addressA        : in     vl_logic_vector(8 downto 0);
        addressB        : in     vl_logic_vector(8 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project2_vlg_sample_tst;
