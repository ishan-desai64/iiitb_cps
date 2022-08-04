# read design

read_verilog iiitb_cps.v

# generic synthesis
synth -top iiitb_cps

# mapping to mycells.lib
dfflibmap -liberty /home/ishan/iiitb_cps/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/ishan/iiitb_cps/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}
clean
flatten
# write synthesized design
write_verilog -noattr iiitb_cps_synth.v
