onerror {exit -code 1}
vlib work
vlog -work work MyWatch_V1_0.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.MyWatch_V1_0_vlg_vec_tst -voptargs="+acc"
vcd file -direction MyWatch_V1_0.msim.vcd
vcd add -internal MyWatch_V1_0_vlg_vec_tst/*
vcd add -internal MyWatch_V1_0_vlg_vec_tst/i1/*
run -all
quit -f
