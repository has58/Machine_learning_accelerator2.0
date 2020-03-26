 Library IEEE;
use IEEE.std_logic_1164.ALL;

package ANN_lib is
	Type integer_array is array(0 to 9) of integer;
	Type integer_matrix is array(0 to 9) of integer_array;
end package;

Package Body ANN_lib is 
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