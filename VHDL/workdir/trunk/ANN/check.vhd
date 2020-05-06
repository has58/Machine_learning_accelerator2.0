Library IEEE;
use IEEE.std_logic_1164.ALL;
use std.textio.ALL;

use work.ANN_Lib.All;

Entity check is
	port(clk 	 : in bit;
		  rst     : in bit;
		  sig_out : out control_signal_type);
	end entity;
	
	
Architecture check_arch of check is
	for CU : control_unit_comp use entity work.control_unit(control_unit_arch);
	begin
			CU : control_unit_comp port map (clk, rst, sig_out);
	end architecture;