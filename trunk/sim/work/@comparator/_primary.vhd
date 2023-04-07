library verilog;
use verilog.vl_types.all;
entity Comparator is
    port(
        A               : in     vl_logic_vector(2 downto 0);
        B               : in     vl_logic_vector(2 downto 0);
        GT              : out    vl_logic;
        EQ              : out    vl_logic
    );
end Comparator;
