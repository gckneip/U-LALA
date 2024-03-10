onerror {quit -f}
vlib work
vlog -work work U-LALA.vo
vlog -work work U-LALA.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ULA_vlg_vec_tst
vcd file -direction U-LALA.msim.vcd
vcd add -internal ULA_vlg_vec_tst/*
vcd add -internal ULA_vlg_vec_tst/i1/*
add wave /*
run -all
