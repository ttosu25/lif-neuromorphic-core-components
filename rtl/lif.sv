

module lif(output logic spike, output logic signed [7:0] next_membrane , input logic signed [7:0] membrane, input logic signed [7:0]threshold, input logic signed [7:0] leak, input logic signed [7:0] V_reset,  input logic signed [7:0] V_syn,input logic clk);

	
	logic signed [15:0] mult;
	logic signed [7:0] temp_membrane;
	logic spike_next;
	
	always_comb
		begin
			mult = leak * membrane;
			temp_membrane = ($signed(mult) >>> 4) + $signed(V_syn); // we right shift by 4 to keep in Q4.4 format
			spike_next = (temp_membrane > threshold);
			
			
		end
	
	always_ff @(posedge clk)
		begin
			spike <= spike_next;
			
			if(spike_next)
				next_membrane <= V_reset;
				
			else
				next_membrane <= temp_membrane;
			
		end
			
endmodule