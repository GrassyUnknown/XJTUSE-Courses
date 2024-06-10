library verilog;
use verilog.vl_types.all;
entity step2_vlg_sample_tst is
    port(
        CLK1            : in     vl_logic;
        RST1            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end step2_vlg_sample_tst;
