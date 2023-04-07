library verilog;
use verilog.vl_types.all;
entity Sum1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        s               : out    vl_logic
    );
end Sum1bit;
