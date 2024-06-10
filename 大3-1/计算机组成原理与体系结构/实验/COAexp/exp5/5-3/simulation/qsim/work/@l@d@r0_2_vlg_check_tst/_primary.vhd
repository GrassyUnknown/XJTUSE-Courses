library verilog;
use verilog.vl_types.all;
entity LDR0_2_vlg_check_tst is
    port(
        LDR0            : in     vl_logic;
        LDR1            : in     vl_logic;
        LDR2            : in     vl_logic;
        R0_B            : in     vl_logic;
        R1_B            : in     vl_logic;
        R2_B            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end LDR0_2_vlg_check_tst;
