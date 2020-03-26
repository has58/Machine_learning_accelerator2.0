Library IEEE;
use IEEE.std_logic_1164.ALL;

use work.ANN_lib.ALL;

package ANN_lib is
	Type integer_array is array(0 to 9) of integer;
	Type integer_matrix is array(0 to 9) of integer_array;
	component multiplier_comp is
		generic(N : integer := 10);
		port (
				data, weights : in integer_array;
				mul_result    : out integer_array);
	end component;
--	for MUL : multiplier_comp use entity work.multiplier(multiplier_arch);
end package;

Package Body ANN_lib is
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