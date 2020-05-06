Library IEEE;
use IEEE.std_logic_1164.ALL;

use work.ANN_lib.ALL;

Entity neuron is
	generic(N : integer := 10);
	port (
			data, weights : in integer_array;
			clk			  : in bit;
			bias, w0		  : in integer;
			neuron_out    : out integer);
	end entity;
	
Architecture neuron_arch of neuron is
	for M1 : multiplier_comp use entity work.multiplier(multiplier_arch);
	signal mul_result : integer_array_with_bias;
	begin
		M1 : multiplier_comp
					generic map (N)
					port map (data, weights, bias, w0, integer_array_with_bias);
	end architecture;