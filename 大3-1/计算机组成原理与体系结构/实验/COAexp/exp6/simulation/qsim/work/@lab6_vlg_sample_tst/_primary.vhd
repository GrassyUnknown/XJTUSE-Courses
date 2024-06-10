library verilog;
use verilog.vl_types.all;
entity Lab6_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        \IN\            : in     vl_logic_vector(7 downto 0);
        P11_2           : in     vl_logic;
        P12_3           : in     vl_logic;
        RST0            : in     vl_logic;
        STEP            : in     vl_logic;
        SWA             : in     vl_logic;
        SWB             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Lab6_vlg_sample_tst;
