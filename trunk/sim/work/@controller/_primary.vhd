library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        gt              : in     vl_logic;
        is_empty        : in     vl_logic;
        start           : in     vl_logic;
        sel_reg         : out    vl_logic;
        ld              : out    vl_logic;
        sel_cmp         : out    vl_logic;
        sel_sub         : out    vl_logic;
        push            : out    vl_logic;
        pop             : out    vl_logic;
        en              : out    vl_logic;
        done            : out    vl_logic
    );
end Controller;
