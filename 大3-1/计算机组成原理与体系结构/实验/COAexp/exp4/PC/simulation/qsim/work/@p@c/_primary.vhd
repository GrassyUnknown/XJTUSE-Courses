library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        LED             : out    vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(7 downto 0);
        T4              : in     vl_logic;
        LDAR            : in     vl_logic;
        CLR             : in     vl_logic;
        LDPC            : in     vl_logic
    );
end PC;
