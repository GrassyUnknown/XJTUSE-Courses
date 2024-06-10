library verilog;
use verilog.vl_types.all;
entity step2 is
    port(
        T1              : out    vl_logic;
        RST1            : in     vl_logic;
        CLK1            : in     vl_logic;
        T4              : out    vl_logic;
        T2              : out    vl_logic;
        T3              : out    vl_logic;
        T5              : out    vl_logic
    );
end step2;
