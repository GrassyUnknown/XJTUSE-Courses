library verilog;
use verilog.vl_types.all;
entity PC_vlg_check_tst is
    port(
        LED             : in     vl_logic_vector(7 downto 0);
        Q               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end PC_vlg_check_tst;
