library verilog;
use verilog.vl_types.all;
entity Carry1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        ci              : in     vl_logic;
        c               : out    vl_logic
    );
end Carry1bit;
