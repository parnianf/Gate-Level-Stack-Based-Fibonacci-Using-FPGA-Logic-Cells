library verilog;
use verilog.vl_types.all;
entity Multiplexer2to1HL is
    port(
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        sel             : in     vl_logic;
        \out\           : out    vl_logic
    );
end Multiplexer2to1HL;
