	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB			   "Fib_TB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"70000 us"
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Accumulator.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Comparator.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Fib.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/FPGA_Cells.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/MUX.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/MUX_HighLevel.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Register.v
    vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Stack.v
    vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Subtractor.v

	#vlog 	+acc -incr -source  +define+SIM 	$inc_path/implementation_option.vh
		
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	#add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 