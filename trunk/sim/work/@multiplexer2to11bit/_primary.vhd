library verilog;
use verilog.vl_types.all;
entity Multiplexer2to11bit is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        sel             : in     vl_logic;
        \out\           : out    vl_logic
    );
end Multiplexer2to11bit;
