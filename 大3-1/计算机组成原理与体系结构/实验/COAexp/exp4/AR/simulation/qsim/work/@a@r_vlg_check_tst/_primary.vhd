library verilog;
use verilog.vl_types.all;
entity AR_vlg_check_tst is
    port(
        ar              : in     vl_logic_vector(7 downto 0);
        pc              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end AR_vlg_check_tst;
