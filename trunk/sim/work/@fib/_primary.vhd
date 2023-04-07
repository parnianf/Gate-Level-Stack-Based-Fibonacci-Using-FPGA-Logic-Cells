library verilog;
use verilog.vl_types.all;
entity Fib is
    port(
        N               : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        start           : in     vl_logic;
        done            : out    vl_logic;
        result          : out    vl_logic_vector(4 downto 0)
    );
end Fib;
