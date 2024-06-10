library verilog;
use verilog.vl_types.all;
entity exp2_1_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end exp2_1_vlg_sample_tst;
