echo " Prof. Marlon Moraes "
echo " marlon.moraes@pucrs.br"

vlib work
vmap work work

## comando de compilação.
vlog	./ps2_display7seg.sv
vlog	./ps2_display7seg_tb.sv

## comando de simulação
vsim -onfinish stop -voptargs=+acc -wlfdeleteonquit work.ps2_display7seg_tb


set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1 
set OpenOnFinish 0
set shortNames 1

## adição dos sinais na forma de onda.
add wave -radix hexadecimal sim:/*
configure wave -signalnamewidth 1
update

## execução da simulação.
run -all
wave zoom full
