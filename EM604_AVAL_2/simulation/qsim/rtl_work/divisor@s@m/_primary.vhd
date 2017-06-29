library verilog;
use verilog.vl_types.all;
entity divisorSM is
    generic(
        Inicio          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        Desloca         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        Subtrai         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        EsqQuoc         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        Restaura        : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        Fim             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        ini_div         : in     vl_logic;
        clk             : in     vl_logic;
        bitP            : in     vl_logic;
        loadA           : out    vl_logic;
        loadB           : out    vl_logic;
        loadP           : out    vl_logic;
        enableA         : out    vl_logic;
        enableB         : out    vl_logic;
        enableP         : out    vl_logic;
        shift           : out    vl_logic;
        divEnd          : out    vl_logic;
        ctrlS           : out    vl_logic;
        state           : out    vl_logic_vector(2 downto 0);
        out_count       : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Inicio : constant is 1;
    attribute mti_svvh_generic_type of Desloca : constant is 1;
    attribute mti_svvh_generic_type of Subtrai : constant is 1;
    attribute mti_svvh_generic_type of EsqQuoc : constant is 1;
    attribute mti_svvh_generic_type of Restaura : constant is 1;
    attribute mti_svvh_generic_type of Fim : constant is 1;
end divisorSM;
