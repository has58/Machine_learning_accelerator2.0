# Copyright (C) 1991-2012 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: Artificial_Neural_Networks.tcl
# Generated on: Fri Apr 10 10:55:52 2020

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "Artificial_Neural_Networks"]} {
		puts "Project Artificial_Neural_Networks is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists Artificial_Neural_Networks]} {
		project_open -revision Artificial_Neural_Networks Artificial_Neural_Networks
	} else {
		project_new -revision Artificial_Neural_Networks Artificial_Neural_Networks
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone II"
	set_global_assignment -name DEVICE EP2C35F484C7
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 12.1
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "20:08:41  MARCH 19, 2020"
	set_global_assignment -name LAST_QUARTUS_VERSION 12.1
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (VHDL)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name VHDL_FILE Artificial_Neural_Networks.vhd
	set_global_assignment -name VHDL_FILE ANN_lib.vhd
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name TEXT_FILE data.txt
	set_global_assignment -name TEXT_FILE data_check.txt
	set_global_assignment -name VHDL_FILE Multiplier.vhd
	set_global_assignment -name VHDL_FILE neuron.vhd
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
