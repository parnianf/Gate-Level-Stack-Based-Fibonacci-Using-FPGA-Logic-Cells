library verilog;
use verilog.vl_types.all;
entity FullAdder1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        ci              : in     vl_logic;
        s               : out    vl_logic;
        c               : out    vl_logic
    );
end FullAdder1bit;
