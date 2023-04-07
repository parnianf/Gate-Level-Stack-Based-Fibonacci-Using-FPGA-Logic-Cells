library verilog;
use verilog.vl_types.all;
entity HalfAdder is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        en              : in     vl_logic;
        clr             : in     vl_logic;
        res             : out    vl_logic;
        c               : out    vl_logic
    );
end HalfAdder;
