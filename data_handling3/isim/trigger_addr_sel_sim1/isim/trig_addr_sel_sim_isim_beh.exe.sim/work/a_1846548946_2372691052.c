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
static const char *ng0 = "/home/ise/Xilinx/projects/src/data_handling/isim/trigger_addr_sel_sim1/trig_addr_sel_sim.vhd";



static void work_a_1846548946_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2912);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2912);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1846548946_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 3352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(93, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 6616);
    t6 = (t0 + 3800);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6624);
    *((int *)t2) = 0;
    t4 = (t0 + 6628);
    *((int *)t4) = 63;
    t11 = 0;
    t12 = 63;

LAB12:    if (t11 <= t12)
        goto LAB13;

LAB15:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 1);
    t2 = (t0 + 3160);
    xsi_process_wait(t2, t5);

LAB19:    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(101, ng0);
    t6 = (t0 + 6624);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 3864);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB14:    t2 = (t0 + 6624);
    t11 = *((int *)t2);
    t4 = (t0 + 6628);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB15;

LAB16:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 6624);
    *((int *)t6) = t11;
    goto LAB12;

LAB17:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 6632);
    t6 = (t0 + 3800);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 6640);
    *((int *)t2) = 0;
    t4 = (t0 + 6644);
    *((int *)t4) = 63;
    t11 = 0;
    t12 = 63;

LAB21:    if (t11 <= t12)
        goto LAB22;

LAB24:    xsi_set_current_line(113, ng0);

LAB28:    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB18:    goto LAB17;

LAB20:    goto LAB18;

LAB22:    xsi_set_current_line(109, ng0);
    t6 = (t0 + 6640);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 3864);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB23:    t2 = (t0 + 6640);
    t11 = *((int *)t2);
    t4 = (t0 + 6644);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB24;

LAB25:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 6640);
    *((int *)t6) = t11;
    goto LAB21;

LAB26:    goto LAB2;

LAB27:    goto LAB26;

LAB29:    goto LAB27;

}


extern void work_a_1846548946_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1846548946_2372691052_p_0,(void *)work_a_1846548946_2372691052_p_1};
	xsi_register_didat("work_a_1846548946_2372691052", "isim/trig_addr_sel_sim_isim_beh.exe.sim/work/a_1846548946_2372691052.didat");
	xsi_register_executes(pe);
}