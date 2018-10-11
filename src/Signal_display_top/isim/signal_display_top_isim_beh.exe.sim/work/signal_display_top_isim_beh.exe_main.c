/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *VL_P_2533777724;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_16541823861846354283_2073120511_init();
    work_m_12980924396447625287_3513507642_init();
    work_m_08561629014786330630_3892401115_init();
    work_m_02422493368751821422_1511779718_init();
    work_m_15208462536306246333_3351766677_init();
    work_m_12079722177723164890_3411995372_init();
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    vl_p_2533777724_init();
    work_a_0513500448_3212880686_init();
    work_a_1035171073_3212880686_init();
    work_a_0224324906_3212880686_init();
    work_a_3585982107_3212880686_init();
    work_a_3676624467_3212880686_init();
    work_a_0457197821_3212880686_init();


    xsi_register_tops("work_a_0457197821_3212880686");
    xsi_register_tops("work_m_16541823861846354283_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    VL_P_2533777724 = xsi_get_engine_memory("vl_p_2533777724");

    return xsi_run_simulation(argc, argv);

}
