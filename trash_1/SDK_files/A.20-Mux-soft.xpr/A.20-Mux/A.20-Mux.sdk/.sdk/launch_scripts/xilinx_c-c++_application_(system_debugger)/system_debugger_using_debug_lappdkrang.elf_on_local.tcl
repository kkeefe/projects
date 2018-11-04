connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT1 210203A0FE56A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT1 210203A0FE56A"} -index 0
dow /home/twili/xilinx_projects/A.20-Mux/A.20-Mux.sdk/LAPPDKrang/Debug/LAPPDKrang.elf
bpadd -addr &main
