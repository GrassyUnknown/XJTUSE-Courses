library verilog;
use verilog.vl_types.all;
entity LDR0_2 is
    port(
        LDR0            : out    vl_logic;
        I1              : in     vl_logic;
        I0              : in     vl_logic;
        LDRI            : in     vl_logic;
        LDR1            : out    vl_logic;
        LDR2            : out    vl_logic;
        R0_B            : out    vl_logic;
        I3              : in     vl_logic;
        I2              : in     vl_logic;
        RS_B            : in     vl_logic;
        RD_B            : in     vl_logic;
        R1_B            : out    vl_logic;
        R2_B            : out    vl_logic;
        RJ_B            : in     vl_logic
    );
end LDR0_2;
