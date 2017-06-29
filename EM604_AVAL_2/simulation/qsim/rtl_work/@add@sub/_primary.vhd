library verilog;
use verilog.vl_types.all;
entity AddSub is
    port(
        inputP          : in     vl_logic_vector(8 downto 0);
        inputB          : in     vl_logic_vector(8 downto 0);
        ctrlS           : in     vl_logic;
        \out\           : out    vl_logic_vector(8 downto 0)
    );
end AddSub;
