transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Besic/OneDrive\ -\ TU\ Wien/Bachelorstudents/Armin/Digital_asynchron_PLL {C:/Users/Besic/OneDrive - TU Wien/Bachelorstudents/Armin/Digital_asynchron_PLL/Digital_async_PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Besic/OneDrive\ -\ TU\ Wien/Bachelorstudents/Armin/Digital_asynchron_PLL {C:/Users/Besic/OneDrive - TU Wien/Bachelorstudents/Armin/Digital_asynchron_PLL/adder2bit.v}

vlog -vlog01compat -work work +incdir+C:/Users/Besic/OneDrive\ -\ TU\ Wien/Bachelorstudents/Armin/Digital_asynchron_PLL {C:/Users/Besic/OneDrive - TU Wien/Bachelorstudents/Armin/Digital_asynchron_PLL/PLL_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  PLL_tb

add wave *
view structure
view signals
run -all
