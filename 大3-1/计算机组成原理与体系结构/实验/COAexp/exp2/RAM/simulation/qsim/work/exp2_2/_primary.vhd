library verilog;
use verilog.vl_types.all;
entity exp2_2 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        q               : out    vl_logic_vector(7 downto 0);
        rw              : in     vl_logic;
        CLK0            : in     vl_logic;
        a               : in     vl_logic_vector(7 downto 0);
        d               : in     vl_logic_vector(7 downto 0)
    );
end exp2_2;
