onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib SeedMem1024_opt

do {wave.do}

view wave
view structure
view signals

do {SeedMem1024.udo}

run -all

quit -force
