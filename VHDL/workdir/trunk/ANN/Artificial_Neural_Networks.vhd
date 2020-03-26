Library IEEE;
use IEEE.std_logic_1164.ALL;
use std.textio.ALL;

use work.ANN_lib.ALL;

Entity Artificial_Neural_Networks is
	generic (rows : integer := 10;
				cols : integer:= 10);
	port    (clk  : in bit);
end entity;
	
Architecture Artificial_Neural_Networks_arch of Artificial_Neural_Networks is
	File data_try  : TEXT open read_mode is "C:\Users\Haider\master_project\VHDL\workdir\trunk\ANN\data.txt";
	File data_out1 : TEXT open write_mode is "C:\Users\Haider\master_project\VHDL\workdir\trunk\ANN\data_out1.txt"; 
--	File data_out2 : TEXT open write_mode is "C:\Users\Haider\vlsi2\workdir\trunk\VHDL\file_reader\data_set\data_out2.txt"; 
--	File data_try1 : TEXT open read_mode is "C:\Users\Haider\vlsi2\workdir\trunk\VHDL\file_reader\data_set\data_try1.txt";
--	signal weights : integer_array;
	signal data 	: integer_matrix;
	begin
--		weights <= (40, 30, 50, 20, 10, 70, 60, 10, 15, 95);
		process(clk)
			variable BUF_IN, BUF_OUT : Line;
			variable int_var 			 : integer_array;
			variable data_matrix     : integer_matrix;
			variable N 					 : integer;
			begin
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
					for i in 0 to (rows - 1)
						loop
							for j in 0 to (cols -1)
								loop
									data_matrix(i)(j) := data_matrix(i)(j) + 1;
								end loop;
						end loop;
					N := 0;
					write_while: while (N < (rows))
								loop
									int_var := data_matrix(N);
									for i in 0 to cols-1
										loop
											write (BUF_OUT, int_var(i));
											write (BUF_OUT, ' ');
										end loop;
										writeline(data_out1, BUF_OUT); 
										N := N+1;
								end loop write_while;
				end if;
			end process; 
	end architecture; 