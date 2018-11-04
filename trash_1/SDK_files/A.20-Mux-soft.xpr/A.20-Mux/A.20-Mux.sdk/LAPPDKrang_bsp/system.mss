
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = standalone
 PARAMETER OS_VER = 6.6
 PARAMETER PROC_INSTANCE = microblaze_0
 PARAMETER stdin = microblaze_0_local_memory_iomodule_0
 PARAMETER stdout = microblaze_0_local_memory_iomodule_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 2.6
 PARAMETER HW_INSTANCE = microblaze_0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.2
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_dlmb_bram_if_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.2
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_ilmb_bram_if_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = iomodule
 PARAMETER DRIVER_VER = 2.5
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_iomodule_0
END


