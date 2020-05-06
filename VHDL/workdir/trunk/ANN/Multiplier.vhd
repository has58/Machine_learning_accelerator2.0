Library IEEE;
use IEEE.std_logic_1164.ALL;

use work.ANN_Lib.All;

Entity adder is
	generic(N : integer := 10);
	port   (mul_result    : in  integer_array;
			  bias			 : in integer;
			  sig_con		 : in bit;
			  add_result	 : out integer);
	end entity;

use work.ANN_Lib.All;

Entity multiplier is
	generic(N : integer   := 10);
	port	 (data, weights : in  integer_array;
			  b, w0		 	 : in integer;			
			  mul_result    : out integer_array_with_bias);
	end entity;

use work.ANN_Lib.All;

Entity control_unit is
	port(clk 	 		  : in bit;
		  rst 	 		  : in bit;
		  control_signal : out control_signal_type);
	end entity;


	
Architecture multiplier_arch of multiplier is
	begin
		mul_gen:
		for i in 0 to (N - 1) generate
			mul_result(i) <= data(i) * weights(i);
		end generate mul_gen;
		mul_result(N) <= b * w0;
	end architecture;
	
Architecture control_unit_arch of control_unit is 
	signal con_sig : control_signal_type;
	begin
--		con_sig <= idle;
		process(clk, rst)
		begin
			if (rst = '0') then
				con_sig <= idle;
			else
				if (clk'event and clk'last_value = '0') then
					if (con_sig /= act_fun) then
						con_sig <= con_sig'rightof(con_sig);
					else
						con_sig <= mul;
					end if;
				end if;
			end if;
		end process;
		control_signal <= con_sig;
	end architecture;
	
--Architecture adder_arch of adder is
--	signal sum : integer;
--	begin
--		process(sig_con)
--			begin
--				sum <= 0;
--				for i in range(N)
--					loop
--						sum <= sum + mul_result(i);
--					end loop;
--				sum <= sum + bias;
--			end process;
--		add_result <= sum;
--	end architecture;