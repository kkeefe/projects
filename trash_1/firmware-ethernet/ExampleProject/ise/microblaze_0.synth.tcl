proc pnsynth {} {
  cd /home/ise/Documents/Projects/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0
  if { [ catch { xload xmp microblaze_0.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
