
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name exampleProject -dir "/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/planAhead_run_2" -part xc6slx150tfgg676-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/scrodEthernetExample.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise} {coregen} {ipcore_dir} }
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_axi4_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_axi_cdma_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/ise/microblaze_0_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/bram8x3000.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/fifo16x64.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/fifo18x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/fifo32x512RxAxi.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/fifo8x64.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/fifoDist8x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {coregen/udp64kfifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/AXIS_fifo_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/AXIS_fifo_1.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/projectSrc/scrodEthernetExample.ucf" [current_fileset -constrset]
add_files [list {/home/ise/Xilinx/firmware-Projects/trash/trash_1/firmware-ethernet/ExampleProject/projectSrc/scrodEthernetExample.ucf}] -fileset [get_property constrset [current_run]]
link_design
