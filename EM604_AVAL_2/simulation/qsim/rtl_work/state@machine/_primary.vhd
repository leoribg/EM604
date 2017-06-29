library verilog;
use verilog.vl_types.all;
entity stateMachine is
    generic(
        S0              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        S1              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        S2              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        S3              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        S4              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        S5              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        S6              : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0)
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        signalOut       : in     vl_logic;
        enA             : out    vl_logic;
        enB             : out    vl_logic;
        ini_div         : out    vl_logic;
        addressA        : in     vl_logic_vector(8 downto 0);
        addressB        : in     vl_logic_vector(8 downto 0);
        addressBus      : out    vl_logic_vector(8 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
    attribute mti_svvh_generic_type of S4 : constant is 1;
    attribute mti_svvh_generic_type of S5 : constant is 1;
    attribute mti_svvh_generic_type of S6 : constant is 1;
end stateMachine;
