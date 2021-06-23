//++++++++++BANCO PRUEBAS +++++++++++++++


`timescale 	1ns	/ 100ps

`include "probador_gray.v"

 // Testbench

module bancopruebas_gray;

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk;			// From probador of probador_gray.v
    wire		enable;			// From probador of probador_gray.v
    wire		reset_L;		// From probador of probador_gray.v
    wire [4:0]		salida_gray;		// From contador_estructural of contador_gray_synth.v
    wire [4:0]		salida_gray_conductual;	// From contador_conductual of gray_counter.v
    // End of automatics
    

	gray_counter	contador_conductual(/*AUTOINST*/
					    // Outputs
					    .salida_gray_conductual(salida_gray_conductual[4:0]),
					    // Inputs
					    .clk		(clk),
					    .reset_L		(reset_L),
					    .enable		(enable));
	contador_gray_synth contador_estructural(/*AUTOINST*/
						 // Outputs
						 .salida_gray		(salida_gray[4:0]),
						 // Inputs
						 .clk			(clk),
						 .enable		(enable),
						 .reset_L		(reset_L));
	probador_gray probador(/*AUTOINST*/
			       // Outputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .enable		(enable),
			       // Inputs
			       .salida_gray	(salida_gray[4:0]),
			       .salida_gray_conductual(salida_gray_conductual[4:0]));
	

endmodule
