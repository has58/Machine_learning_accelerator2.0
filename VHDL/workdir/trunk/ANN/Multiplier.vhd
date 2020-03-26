Library IEEE;
use IEEE.std_logic_1164.ALL;

use work.ANN_lib.ALL;

Entity multiplier is
	generic(N : integer := 10);
	port (
			data, weights : in integer_array;
			mul_result    : out integer_array);
	end entity;
	
Architecture multiplier_arch of multiplier is
	begin
		mul_gen:
		for i in 0 to N generate
		mul_result(i) <= data(i) * weights(i);
		end generate mul_gen;
	end architecture;