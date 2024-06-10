library verilog;
use verilog.vl_types.all;
entity PC_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(7 downto 0);
        CLR             : in     vl_logic;
        LDAR            : in     vl_logic;
        LDPC            : in     vl_logic;
        T4              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PC_vlg_sample_tst;
