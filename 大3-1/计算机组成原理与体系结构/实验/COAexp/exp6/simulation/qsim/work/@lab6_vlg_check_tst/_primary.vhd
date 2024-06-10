library verilog;
use verilog.vl_types.all;
entity Lab6_vlg_check_tst is
    port(
        \BUS\           : in     vl_logic_vector(7 downto 0);
        LED_B           : in     vl_logic;
        P10_1           : in     vl_logic;
        P36_9           : in     vl_logic;
        P37_10          : in     vl_logic;
        RAM_B           : in     vl_logic;
        SW_B            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Lab6_vlg_check_tst;
