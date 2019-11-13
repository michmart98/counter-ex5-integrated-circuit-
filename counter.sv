
module counter
#()
//Input-Output List
(input logic clk,
input logic rst_n,
input logic satEn,
output logic[3:0] val_out);
logic[3:0] cnt;
//Functionality
always_ff @(posedge clk, negedge rst_n)
begin
 if(!rst_n) cnt <= 0;
 else begin
 if (satEn) begin
   if(cnt==11)
     cnt<=11;
   else
     cnt<=cnt+1;
   end
 else
   cnt<=cnt+1;
 end
end
assign val_out = cnt;
endmodule

