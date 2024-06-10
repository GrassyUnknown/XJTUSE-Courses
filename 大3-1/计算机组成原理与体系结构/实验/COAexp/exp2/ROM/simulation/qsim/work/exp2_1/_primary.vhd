library verilog;
use verilog.vl_types.all;
entity exp2_1 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        q               : out    vl_logic_vector(23 downto 0);
        clk             : in     vl_logic;
        a               : in     vl_logic_vector(5 downto 0)
    );
end exp2_1;
