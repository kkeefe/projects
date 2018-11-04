cd /home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_1
if { [ catch { xload xmp microblaze_1.xmp } result ] } {
  exit 10
}
xset intstyle default
save proj
exit 0
