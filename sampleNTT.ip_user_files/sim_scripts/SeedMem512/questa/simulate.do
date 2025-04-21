onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib SeedMem512_opt

do {wave.do}

view wave
view structure
view signals

do {SeedMem512.udo}

run -all

quit -force
