library verilog;
use verilog.vl_types.all;
entity uA_reg_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        CLR             : in     vl_logic;
        d               : in     vl_logic_vector(6 downto 1);
        S               : in     vl_logic_vector(6 downto 1);
        sampler_tx      : out    vl_logic
    );
end uA_reg_vlg_sample_tst;
