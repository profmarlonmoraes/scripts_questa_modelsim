if {! [ file exists work ] } { 
	echo "criando biblioteca WORK..."
	vlib work
	echo " "
} else {
	echo "apagando biblioteca WORK..."
	vdel -all
	echo "recriando biblioteca WORK..."
	vlib work
	echo " "
}

## comando de compilação.
vcom 	./decoder_scancode_ascii_map.vhd
vlog	./decoder_scancode_ascii_golden.sv
vlog	./decoder_scancode_ascii_tb.sv

## comando de simulação
vsim -onfinish stop -voptargs=+acc -wlfdeleteonquit work.decoder_scancode_ascii_tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1 
set OpenOnFinish 0

## adição dos sinais na forma de onda.
add wave -radix hexadecimal sim:/*


## execução da simulação.
run -all
