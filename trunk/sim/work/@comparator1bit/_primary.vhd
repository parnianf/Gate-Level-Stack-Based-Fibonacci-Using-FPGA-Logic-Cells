library verilog;
use verilog.vl_types.all;
entity Comparator1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        eq              : in     vl_logic;
        gt              : in     vl_logic;
        \EQ\            : out    vl_logic;
        \GT\            : out    vl_logic
    );
end Comparator1bit;
