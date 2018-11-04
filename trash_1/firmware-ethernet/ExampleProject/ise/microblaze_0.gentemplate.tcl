proc pngeninsttemplate {} {
  cd /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0
  if { [ catch { xload xmp microblaze_0.xmp } result ] } {
    exit 10
  }
  if { [catch {run mhs2hdl} result] } {
    return -1
  }
  return 0
}
if { [catch {pngeninsttemplate} result] } {
  exit -1
}
exit $result
