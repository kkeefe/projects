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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Xilinx/projects/src/USB_to_SSD/process_trigger.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2941296346_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3544);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t13 = (8 - 1);
    t14 = (7 - t13);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t1 = (t3 + t16);
    t4 = (t0 + 1832U);
    t7 = *((char **)t4);
    t17 = (8 - 1);
    t18 = (7 - t17);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t4 = (t7 + t20);
    t2 = 1;
    if (8U == 8U)
        goto LAB11;

LAB12:    t2 = 0;

LAB13:    if ((!(t2)) != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 3688);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(59, ng0);
    t3 = xsi_get_transient_memory(8U);
    memset(t3, 0, 8U);
    t7 = t3;
    memset(t7, (unsigned char)2, 8U);
    t8 = (t0 + 3624);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3688);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(65, ng0);
    t10 = (t0 + 3688);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t22 = (t12 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 3624);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 3752);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

LAB11:    t21 = 0;

LAB14:    if (t21 < 8U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t8 = (t1 + t21);
    t9 = (t4 + t21);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB12;

LAB16:    t21 = (t21 + 1);
    goto LAB14;

}


extern void work_a_2941296346_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2941296346_3212880686_p_0};
	xsi_register_didat("work_a_2941296346_3212880686", "isim/tranLoc_TOP_isim_beh.exe.sim/work/a_2941296346_3212880686.didat");
	xsi_register_executes(pe);
}
