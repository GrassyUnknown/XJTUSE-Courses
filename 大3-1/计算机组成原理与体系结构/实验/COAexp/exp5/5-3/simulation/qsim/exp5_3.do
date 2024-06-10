onerror {exit -code 1}
vlib work
vlog -work work exp5_3.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.LDR0_2_vlg_vec_tst -voptargs="+acc"
vcd file -direction exp5_3.msim.vcd
vcd add -internal LDR0_2_vlg_vec_tst/*
vcd add -internal LDR0_2_vlg_vec_tst/i1/*
run -all
quit -f
