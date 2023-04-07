library verilog;
use verilog.vl_types.all;
entity Multiplexer2to1 is
    port(
        A               : in     vl_logic_vector(2 downto 0);
        B               : in     vl_logic_vector(2 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end Multiplexer2to1;
