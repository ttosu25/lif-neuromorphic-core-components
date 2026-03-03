
//N specifies the number of synapses in the memory unit
//in this implementation, word length has been parametised as W
//default values for weights should be imposed on reset (rst)


module synapse_mem #(parameter int N, W)
(output logic signed [W-1:0] dout, input logic signed [W-1:0] din , input logic [$clog2(N)-1:0]addr, input logic we, clk, rst);

	//weights for memory
	logic signed [W-1:0] weights[N-1:0]; 
	
	always_ff@(posedge clk)
	
		begin
		
			if(we) //we = 1 is a reading operation
				dout <= weights[addr];
			else// we = 0 is a writing operation
				weights[addr] <= din;	
		end

endmodule