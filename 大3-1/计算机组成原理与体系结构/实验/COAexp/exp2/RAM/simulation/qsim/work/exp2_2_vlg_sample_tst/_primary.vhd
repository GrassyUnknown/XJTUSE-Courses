library verilog;
use verilog.vl_types.all;
entity exp2_2_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        CLK0            : in     vl_logic;
        d               : in     vl_logic_vector(7 downto 0);
        rw              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end exp2_2_vlg_sample_tst;
