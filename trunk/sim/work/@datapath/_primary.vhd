library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        sel_reg         : in     vl_logic;
        ld              : in     vl_logic;
        sel_cmp         : in     vl_logic;
        sel_sub         : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        en              : in     vl_logic;
        N               : in     vl_logic_vector(2 downto 0);
        gt              : out    vl_logic;
        is_empty        : out    vl_logic;
        result          : out    vl_logic_vector(4 downto 0)
    );
end Datapath;
