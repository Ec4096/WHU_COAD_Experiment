vlib work
vlib activehdl

vlib activehdl/dist_mem_gen_v8_0_12
vlib activehdl/xil_defaultlib

vmap dist_mem_gen_v8_0_12 activehdl/dist_mem_gen_v8_0_12
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work dist_mem_gen_v8_0_12  -v2k5 \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../12.21test.srcs/sources_1/ip/dist_mem_gen_10_1/sim/dist_mem_gen_10.v" \


vlog -work xil_defaultlib \
"glbl.v"

