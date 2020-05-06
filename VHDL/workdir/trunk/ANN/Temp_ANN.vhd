Library IEEE;
use IEEE.std_logic_1164.ALL;
use std.textio.ALL;

use work.ANN_Lib.All;

Entity temp_ANN is
	generic (rows : integer := 10;
				cols : integer:= 10);
	port    (clk  : in bit;
				reset: in bit);
end entity;
	
Architecture Temp_ANN_arch of temp_ANN is
	File data_try  : TEXT open read_mode is "C:\Users\Haider\master_project\VHDL\workdir\trunk\ANN\data_check.txt";
	File data_out1 : TEXT open write_mode is "C:\Users\Haider\master_project\VHDL\workdir\trunk\ANN\data_out1.txt"; 
	signal weights : integer_array;
	signal data 	: integer_matrix;
--	for Neu : neuron_comp use entity work.neuron(neuron_arch);
	begin
		process(reset)
			variable BUF_IN, BUF_OUT : Line;
			variable int_var 			 : integer_array;
			variable data_matrix     : integer_matrix;
			variable N 					 : integer;
			begin
				weights <= (40, 30, 50, 20, 10, 70, 60, 10, 15, 95);
				if (clk'event and clk'last_value = '0') then
					N :=0;
					Read_while: while (N < (rows) and (not endfile(data_try)))
								loop
									readline (data_try, BUF_IN);
									for i in 0 to cols-1
										loop
										read (BUF_IN, int_var(i));
										end loop;
										data_matrix(N) := int_var;
									N := N+1;
								end loop Read_while;
				end if;
			end process;
			
			
			
end architecture;
