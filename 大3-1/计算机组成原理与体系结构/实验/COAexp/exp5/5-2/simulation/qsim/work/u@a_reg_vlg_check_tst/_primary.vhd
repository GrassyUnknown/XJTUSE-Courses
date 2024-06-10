library verilog;
use verilog.vl_types.all;
entity uA_reg_vlg_check_tst is
    port(
        q               : in     vl_logic_vector(6 downto 1);
        sampler_rx      : in     vl_logic
    );
end uA_reg_vlg_check_tst;
