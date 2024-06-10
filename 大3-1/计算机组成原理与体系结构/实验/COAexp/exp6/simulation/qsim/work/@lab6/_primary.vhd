library verilog;
use verilog.vl_types.all;
entity Lab6 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        SW_B            : out    vl_logic;
        CLK             : in     vl_logic;
        STEP            : in     vl_logic;
        RST0            : in     vl_logic;
        \IN\            : in     vl_logic_vector(7 downto 0);
        RAM_B           : out    vl_logic;
        SWA             : in     vl_logic;
        SWB             : in     vl_logic;
        LED_B           : out    vl_logic;
        P10_1           : out    vl_logic;
        P11_2           : in     vl_logic;
        P12_3           : in     vl_logic;
        \BUS\           : out    vl_logic_vector(7 downto 0);
        P37_10          : out    vl_logic;
        P36_9           : out    vl_logic
    );
end Lab6;
