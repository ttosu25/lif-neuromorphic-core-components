//default values for membrane potentials should be imposed on reset (rst)
//in this implementation, word length has been parametised as W


module neuron_state #(parameter M) // M is the number of membranes and thus also the number of neurons
(output logic signed [7:0] dout, input logic signed [7:0] din , input logic [$clog2(M)-1:0]addr, input logic we, clk, rst);
	
	//membranes of each neuron
	logic signed [7:0] membranes[M-1:0]; 
	
	always_ff@(posedge clk)
	
		begin
		
			if(we) //we = 1 is a reading operation
				dout <= membranes[addr];
			else// we = 0 is a writing operation
				membranes[addr] <= din;	
		end
	

endmodule