all:
	iverilog -g2012 sw.v ib.v isbm.v fifo.v mkreq.v mkwe.v arb.v cb.v cbsel.v ackor.v swtest.v
	vvp a.out
show:
	gtkwave sw.vcd
syn:
	yosys sw.ys
synsim:
	iverilog -gspecify ‒Ttyp synth.v swtest.v ../osu018_stdcells.v
	vvp a.out
