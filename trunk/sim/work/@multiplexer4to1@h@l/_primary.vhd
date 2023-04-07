library verilog;
use verilog.vl_types.all;
entity Multiplexer4to1HL is
    port(
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic
    );
end Multiplexer4to1HL;
