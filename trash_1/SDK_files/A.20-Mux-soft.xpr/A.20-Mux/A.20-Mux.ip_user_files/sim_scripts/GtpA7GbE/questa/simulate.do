onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib GtpA7GbE_opt

do {wave.do}

view wave
view structure
view signals

do {GtpA7GbE.udo}

run -all

quit -force
