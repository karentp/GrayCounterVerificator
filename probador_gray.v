
module probador_gray(
    output reg clk,
    output reg reset_L, enable,
    input [4:0] salida_gray, salida_gray_conductual 
);

reg verificador;

initial begin
	$dumpfile("gray_counter.vcd");
	$dumpvars;

    reset_L <= 1'b0;
    enable <= 1'b0;
    
    @(posedge clk);	
    reset_L <= 1'b1;
    enable <= 1'b1;

    repeat(93) begin
        @(posedge clk);	
            reset_L <= 1'b1;
            enable <= 1'b1;

    end
    
    @(posedge clk);

        reset_L <= 1'b0;
        enable <= 1'b1;

	$finish;
end  
   
   //verificador
    always  @(*)begin
        if ( salida_gray_conductual == salida_gray)
            verificador =1;
        else
            verificador =0;
    end

    //Valor inicial del reloj para que no sea indeterminado
	initial	clk 	<= 0;	

    //Toggle cada 2*10 nano segundos		
	always	#1 clk 	<= ~clk;

endmodule