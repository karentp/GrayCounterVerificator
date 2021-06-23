BANCO  = bancopruebas_gray.v


all: prueba_gray


prueba_gray: 
	@echo ----------------------------------
	@echo Corriendo pruebas del bus control :
	@echo ----------------------------------
	emacs --batch $(BANCO) -f verilog-batch-auto 
	iverilog -o prueba.vvp $(BANCO) cmos_cells.v gray_counter.v contador_gray_synth.v
	vvp prueba.vvp
	gtkwave .\gray_counter.vcd .\graycounterverificador.gtkw

prueba_gray_decimal:
	 gtkwave .\gray_counter.vcd .\gray_counter_decimal.gtkw
