proc exportToSDK {} {
  cd /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0
  if { [ catch { xload xmp microblaze_0.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "/home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0" "$sExportDir" "hw" ] 
if { [ file exists /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "/home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/scrodEthernetExample.bit ] } {
   puts "Copying bit file /home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/scrodEthernetExample.bit to $sExportDir" 
   file copy -force "/home/ise/Xilinx/trash_1/firmware-ethernet/ExampleProject/ise/scrodEthernetExample.bit" $sExportDir
}
exit $result
