Library IEEE;
use IEEE.std_logic_1164.ALL;

package ANN_lib is
	
	Type integer_array is array(0 to 9) of integer;
	Type integer_matrix is array(0 to 9) of integer_array;
	Type control_signal_type is (idle, mul, add, act_fun);
	Type integer_array_with_bias is array (0 to 10) of integer;
	
	component multiplier_comp is
		generic(N : integer := 10);
		port (
				data, weights : in integer_array;
				mul_result    : out integer_array);
	end component;

	component neuron_comp is
		generic(N : integer := 10);
		port (
				data, weights : in integer_array;
				clk			  : in bit;
				bias			  : in integer;
				mul_result    : out integer_array);
	end component;
	
	component control_unit_comp is
	port(clk 	 : in bit;
		  rst 	 : in bit;
		  sig_con : out control_signal_type);
	end component;

end package;

Package Body ANN_lib is
--	for M1 : multiplier_comp use entity work.multiplier(multiplier_arch);
--	for MUL : multiplier_comp use entity work.multiplier(multiplier_arch);
--	function dot_product_func(data 		: in integer_array;
--									  weights   : in integer_array)
--									  return integer is
--			variable result : integer_array;
--			begin
--			gen_loop : 
--			for i in 0 to 3 generate
--				mul1 : mul port map (weights(i), data(i), result(i)); 
--			end generate gen_loop;
--			return result;
--		end function;
end package body;