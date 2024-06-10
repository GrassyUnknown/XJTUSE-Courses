library verilog;
use verilog.vl_types.all;
entity AR_vlg_sample_tst is
    port(
        ar_alk          : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        input_b         : in     vl_logic;
        load_pc         : in     vl_logic;
        pc_b            : in     vl_logic;
        pc_clk          : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end AR_vlg_sample_tst;
