library verilog;
use verilog.vl_types.all;
entity uA_reg is
    port(
        q               : out    vl_logic_vector(6 downto 1);
        S               : in     vl_logic_vector(6 downto 1);
        CLR             : in     vl_logic;
        d               : in     vl_logic_vector(6 downto 1);
        clk             : in     vl_logic
    );
end uA_reg;
