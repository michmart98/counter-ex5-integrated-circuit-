module counter_tb;

logic clk, rst_n;
logic cnt_enable;
logic [3:0] counter_out;
always begin //generate clock
 clk = 1;
 #5ns;
 clk = 0;
 #5ns;
end
counter
// #(.4 (4))
cntr_name
 (.clk (clk),
 .rst_n (rst_n),
 .satEn (cnt_enable),
 .val_out (counter_out));
initial begin
  $display("Sarting Testbench");
 cnt_enable <= 0; //Set starting values
 rst_n <= 1;
 @(posedge clk); //First posedge occurred(10ns)
 rst_n <= 0;
 @(posedge clk); //Second posedge occurred(20ns)
 rst_n <= 1;
 @(posedge clk); //And so on...
 $strobe("@%0t: counter_out-> %b", $time, counter_out);
 cnt_enable <= 1;
 repeat(13) begin //counter->11 multiple times
 @(posedge clk);
 $strobe("@%0t: counter_out-> %b", $time, counter_out);
 end
 cnt_enable <= 0;
 repeat(7) @(posedge clk); //counter-> goes over 11 and after some repeats overflows
 @(negedge clk); //At negative edge!
 rst_n <= 0;
 cnt_enable <= 0;
 @(posedge clk);
 rst_n <= 1;
 repeat(3) @(posedge clk); //reset
 $display("Finished");
 //Test case code here
end
endmodule

