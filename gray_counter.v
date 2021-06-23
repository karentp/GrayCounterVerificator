module gray_counter(
    input clk,
    input reset_L, enable,
    output reg [4:0] salida_gray_conductual
);

    reg [4:0] salida_shift, counter;

   always @(*) begin
       if (!reset_L) begin
           counter = 0;
       end
       
   end
   always @(posedge clk) begin
       if(reset_L & enable) begin
        counter = counter +1;
        salida_shift = counter >> 1;
        salida_gray_conductual = counter ^ salida_shift;
       end
       
   end 
 
endmodule