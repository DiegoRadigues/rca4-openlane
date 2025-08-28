SIM_TOP=tb_ripple_carry_adder_4bit
RTL=hdl/ripple_carry_adder_4bit.v
TB=hdl/tb_ripple_carry_adder_4bit.v
VCD=hdl/rca.vcd
OUT=hdl/tb
WAVE=hdl/rca.gtkw

.PHONY: sim wave clean

sim:
	iverilog -g2012 -o $(OUT) $(TB) $(RTL)
	vvp $(OUT) | tee hdl/sim_output.txt
	@ls -lh $(VCD)

wave: sim
	gtkwave $(VCD) $(WAVE) &

clean:
	rm -f $(OUT) $(VCD) hdl/sim_output.txt
