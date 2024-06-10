onerror {exit -code 1}
vlib work
vlog -work work Lab6.vo
vlog -work work Lab6.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Lab6_vlg_vec_tst -voptargs="+acc"
vcd file -direction Lab6.msim.vcd
vcd add -internal Lab6_vlg_vec_tst/*
vcd add -internal Lab6_vlg_vec_tst/i1/*
run -all
quit -f
