library verilog;
use verilog.vl_types.all;
entity LDR0_2_vlg_sample_tst is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        I2              : in     vl_logic;
        I3              : in     vl_logic;
        LDRI            : in     vl_logic;
        RD_B            : in     vl_logic;
        RJ_B            : in     vl_logic;
        RS_B            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LDR0_2_vlg_sample_tst;
