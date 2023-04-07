library verilog;
use verilog.vl_types.all;
entity Register1bit is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        \in\            : in     vl_logic;
        ld              : in     vl_logic;
        \out\           : out    vl_logic
    );
end Register1bit;
