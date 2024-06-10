library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        CN4             : out    vl_logic;
        M               : in     vl_logic;
        CN              : in     vl_logic;
        A               : out    vl_logic_vector(7 downto 0);
        A0_B1           : in     vl_logic;
        \IN\            : in     vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(7 downto 0);
        S               : out    vl_logic_vector(3 downto 0);
        Sclk            : in     vl_logic;
        F               : out    vl_logic_vector(7 downto 0)
    );
end ALU;
