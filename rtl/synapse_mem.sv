
//N specifies the number of synapses in the memory unit


module synapse_mem #(parameter int N)
(output logic signed [7:0] dout, input logic signed [7:0] din , input logic [$clog2(N)-1:0]addr, input logic we, clk);

	//weights for memory
	logic signed [7:0] weights[N-1:0]; 
	
	always_ff@(posedge clk)
	
		begin
		
			if(we) //we = 1 is a reading operation
				dout <= weights[addr];
			else// we = 0 is a writing operation
				weights[addr] <= din;	
		end

endmodule