transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {project2.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/project2_TB.v}

vsim -t 1ps -L altera_ver -L cycloneiii_ver -L gate_work -L work -voptargs="+acc"  project2.v

add wave *
view structure
view signals
run -all
