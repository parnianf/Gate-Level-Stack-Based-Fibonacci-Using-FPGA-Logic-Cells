library verilog;
use verilog.vl_types.all;
entity counter10bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cnt             : out    vl_logic_vector(9 downto 0)
    );
end counter10bit;
