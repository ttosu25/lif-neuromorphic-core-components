module control_unit_W_tb;

	//initialising parameters
	parameter WORD_LENGTH = 8;
	parameter NEURON_COUNT = 4; //assumes 1 to 1 mapping of neurons to synapses by address

	//declaring signals
	logic clk;
	logic rst;
	logic s_i;
	logic s_we;
	logic n_we;
	logic signed [WORD_LENGTH-1:0] V_syn;
	logic signed [WORD_LENGTH-1:0] weight;
	logic [$clog2(NEURON_COUNT)-1:0] addr;
	
	//test cases:
	
	//T1: parameters successfully initialise on reset
	//T2: V_syn equals weight when s_i is 1, and equals 0 when s_i is 0
	//T3: V_syn remains constant during lif read operation
	//T4: address increments after  lif read operation
	//T5: n_we toggless

	
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
		
	end
	
	initial begin
	
		//T1
		#5 rst = 1'b1; 
		#5 rst = 1'b0; 
		//pulses reset for a small duration of time
		
		//T2
		s_i = 1'b0;
		weight = 1'b1;
		
		@(posedge clk)
		//read operation from lif happens - check T3
		//address should increment - check T4
		
		@(posedge clk)
		s_i = 1'b1; //back to read operation from synapses check T2
		
		//Checking for T5 is trivial
		
	end
	
	
	control_unit_W #(.W(WORD_LENGTH), .N(NEURON_COUNT) ) cu(
		.s_we(s_we),
		.n_we(n_we),
		.addr(addr),
		.V_syn(V_syn),
		.weight(weight),
		.s_i(s_i),
		.clk(clk),
		.rst(rst)
	);

endmodule