cd /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0/
if { [ catch { xload xmp microblaze_0.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0
