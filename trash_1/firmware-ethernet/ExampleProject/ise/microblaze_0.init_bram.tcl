cd /home/ise/Documents/Projects/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0
if { [ catch { xload xmp microblaze_0.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
