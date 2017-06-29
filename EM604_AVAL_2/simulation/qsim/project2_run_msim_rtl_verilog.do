transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/stateMachine.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/regP.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/regB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/regAB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/regA.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/project2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/memROM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/divisorSM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/divisor.v}

vlog -vlog01compat -work work +incdir+C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1 {C:/Users/Leonardo/Documents/Mestrado/EM604/EM604_2_V1/project2_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  project2_TB.v

add wave *
view structure
view signals
run -all
