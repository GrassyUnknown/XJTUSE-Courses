library verilog;
use verilog.vl_types.all;
entity ALU_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        CN4             : in     vl_logic;
        F               : in     vl_logic_vector(7 downto 0);
        S               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_vlg_check_tst;
