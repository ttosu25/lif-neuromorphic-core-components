module synapse_mem_tb;

logic clk;
logic we;
logic signed [7:0] dout;
logic signed [7:0] din;
logic [$clog2(4)-1:0] addr; // Here N = 4


// Generating clock signal
initial begin
    clk = 1'b0;
    forever
        #10 clk = ~clk;   
end


initial begin 
    
    // writing

    we   = 1'b0;
    din  = 8'b11101110;   
    addr = 2'b00;
    
    // reading
	@(negedge clk)
    we = 1'b1;
	
	// writing
	#20;
    we = 1'b0;
	din  = 8'b10101110;  
	
	// reading
	#20;
    we = 1'b1;


end



synapse_mem dut (
    .dout(dout),
    .din(din),
    .addr(addr),
    .we(we),
    .clk(clk)
);

endmodule
	
