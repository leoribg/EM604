library verilog;
use verilog.vl_types.all;
entity memROM is
    port(
        control         : in     vl_logic;
        address         : in     vl_logic_vector(8 downto 0);
        readEn          : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end memROM;
