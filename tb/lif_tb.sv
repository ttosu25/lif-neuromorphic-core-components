module lif_tb;

	logic spike;
	logic clk;
	logic signed [7:0] mem1;
	logic signed [7:0] mem2;
	logic signed [7:0] threshold;
	logic signed [7:0] leak;
	logic signed [7:0] V_reset;
	logic signed [7:0] V_syn;
	
	//clock pulsing
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
	
	
	initial begin
	// Test plan, produce two neurons with complementary voltages,
	
	//T1: Every signal has a known value after the first clock cycle completes
	
	//T2: the neuron that does not exceed the threshold does not spike
	
	//T3: the neuron that does exceed the threshold does spike
	
	//T4: the neuron that spikes has its membrane set to V_reset
	
	//initialise lif parameters
	
	leak = 8'b00011000; // leak is 1.5 in Q4.4
	V_reset = 8'b00000000;
	V_syn = 8'b00010000;//V_syn is one volt
	threshold = 8'b00100100; // Threshold is 2.25 V
		
	@(negedge clk)
	mem1 = 8'b00100000; // 2V neuron should result in a spike Q4.4
	
	//@(negedge clk)
	//mem1 = 8'b11100000; //-2V neuron should result in no spike
	end
	
	
	lif dut(
	.spike(spike),
	.clk(clk),
	.membrane(mem1),
	.next_membrane(mem2),
	.threshold(threshold),
	.leak(leak),
	.V_reset(V_reset),
	.V_syn(V_syn));

endmodule