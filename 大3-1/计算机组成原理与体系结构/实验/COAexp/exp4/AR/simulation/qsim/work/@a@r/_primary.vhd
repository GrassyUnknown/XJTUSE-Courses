library verilog;
use verilog.vl_types.all;
entity AR is
    port(
        ar              : out    vl_logic_vector(7 downto 0);
        ar_alk          : in     vl_logic;
        input_b         : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        pc_b            : in     vl_logic;
        load_pc         : in     vl_logic;
        pc_clk          : in     vl_logic;
        rst             : in     vl_logic;
        pc              : out    vl_logic_vector(7 downto 0)
    );
end AR;
