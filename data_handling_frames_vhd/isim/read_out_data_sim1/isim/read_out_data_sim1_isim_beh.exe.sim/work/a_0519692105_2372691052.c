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
static const char *ng0 = "/home/ise/Documents/Projects/data_handling3/isim/read_out_data_sim1/read_out_data_sim1.vhd";



static void work_a_0519692105_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4384U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 5016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4192);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 5016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4192);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0519692105_2372691052_p_1(char *t0)
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

LAB0:    t1 = (t0 + 4632U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(117, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3408U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 1);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 5080);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 9272);
    t6 = (t0 + 5144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 9276);
    t6 = (t0 + 5208);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 9280);
    t6 = (t0 + 5272);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3408U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 1);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t5);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 5336);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 9288);
    *((int *)t2) = 0;
    t4 = (t0 + 9292);
    *((int *)t4) = 31;
    t11 = 0;
    t12 = 31;

LAB16:    if (t11 <= t12)
        goto LAB17;

LAB19:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 9296);
    *((int *)t2) = 32;
    t4 = (t0 + 9300);
    *((int *)t4) = 63;
    t11 = 32;
    t12 = 63;

LAB21:    if (t11 <= t12)
        goto LAB22;

LAB24:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 3408U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 1);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t5);

LAB28:    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB17:    xsi_set_current_line(133, ng0);
    t6 = (t0 + 9288);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB18:    t2 = (t0 + 9288);
    t11 = *((int *)t2);
    t4 = (t0 + 9292);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB19;

LAB20:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9288);
    *((int *)t6) = t11;
    goto LAB16;

LAB22:    xsi_set_current_line(137, ng0);
    t6 = (t0 + 9296);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB23:    t2 = (t0 + 9296);
    t11 = *((int *)t2);
    t4 = (t0 + 9300);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB24;

LAB25:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9296);
    *((int *)t6) = t11;
    goto LAB21;

LAB26:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 9304);
    t6 = (t0 + 5272);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 5336);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 9312);
    *((int *)t2) = 0;
    t4 = (t0 + 9316);
    *((int *)t4) = 31;
    t11 = 0;
    t12 = 31;

LAB30:    if (t11 <= t12)
        goto LAB31;

LAB33:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 9320);
    *((int *)t2) = 32;
    t4 = (t0 + 9324);
    *((int *)t4) = 63;
    t11 = 32;
    t12 = 63;

LAB35:    if (t11 <= t12)
        goto LAB36;

LAB38:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 3408U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 1.5000000000000000);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t5);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB27:    goto LAB26;

LAB29:    goto LAB27;

LAB31:    xsi_set_current_line(148, ng0);
    t6 = (t0 + 9312);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB32:    t2 = (t0 + 9312);
    t11 = *((int *)t2);
    t4 = (t0 + 9316);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB33;

LAB34:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9312);
    *((int *)t6) = t11;
    goto LAB30;

LAB36:    xsi_set_current_line(152, ng0);
    t6 = (t0 + 9320);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB37:    t2 = (t0 + 9320);
    t11 = *((int *)t2);
    t4 = (t0 + 9324);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB38;

LAB39:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9320);
    *((int *)t6) = t11;
    goto LAB35;

LAB40:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 9328);
    *((int *)t2) = 0;
    t4 = (t0 + 9332);
    *((int *)t4) = 31;
    t11 = 0;
    t12 = 31;

LAB44:    if (t11 <= t12)
        goto LAB45;

LAB47:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 9336);
    *((int *)t2) = 32;
    t4 = (t0 + 9340);
    *((int *)t4) = 63;
    t11 = 32;
    t12 = 63;

LAB49:    if (t11 <= t12)
        goto LAB50;

LAB52:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 3408U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 2);
    t2 = (t0 + 4440);
    xsi_process_wait(t2, t5);

LAB56:    *((char **)t1) = &&LAB57;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB45:    xsi_set_current_line(160, ng0);
    t6 = (t0 + 9328);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB46:    t2 = (t0 + 9328);
    t11 = *((int *)t2);
    t4 = (t0 + 9332);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB47;

LAB48:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9328);
    *((int *)t6) = t11;
    goto LAB44;

LAB50:    xsi_set_current_line(164, ng0);
    t6 = (t0 + 9336);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB51:    t2 = (t0 + 9336);
    t11 = *((int *)t2);
    t4 = (t0 + 9340);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB52;

LAB53:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9336);
    *((int *)t6) = t11;
    goto LAB49;

LAB54:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 9344);
    *((int *)t2) = 0;
    t4 = (t0 + 9348);
    *((int *)t4) = 31;
    t11 = 0;
    t12 = 31;

LAB58:    if (t11 <= t12)
        goto LAB59;

LAB61:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 9352);
    *((int *)t2) = 32;
    t4 = (t0 + 9356);
    *((int *)t4) = 63;
    t11 = 32;
    t12 = 63;

LAB63:    if (t11 <= t12)
        goto LAB64;

LAB66:    xsi_set_current_line(181, ng0);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB55:    goto LAB54;

LAB57:    goto LAB55;

LAB59:    xsi_set_current_line(172, ng0);
    t6 = (t0 + 9344);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB60:    t2 = (t0 + 9344);
    t11 = *((int *)t2);
    t4 = (t0 + 9348);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB61;

LAB62:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9344);
    *((int *)t6) = t11;
    goto LAB58;

LAB64:    xsi_set_current_line(176, ng0);
    t6 = (t0 + 9352);
    t13 = *((int *)t6);
    t14 = (t13 - 63);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 5400);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t18 = *((char **)t10);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);

LAB65:    t2 = (t0 + 9352);
    t11 = *((int *)t2);
    t4 = (t0 + 9356);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB66;

LAB67:    t13 = (t11 + 1);
    t11 = t13;
    t6 = (t0 + 9352);
    *((int *)t6) = t11;
    goto LAB63;

LAB68:    goto LAB2;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

}


extern void work_a_0519692105_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0519692105_2372691052_p_0,(void *)work_a_0519692105_2372691052_p_1};
	xsi_register_didat("work_a_0519692105_2372691052", "isim/read_out_data_sim1_isim_beh.exe.sim/work/a_0519692105_2372691052.didat");
	xsi_register_executes(pe);
}
