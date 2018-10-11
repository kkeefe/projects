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
static const char *ng0 = "/home/kevin/project/ise/DecimalToBinary/BinaryToDecimal.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501539734_1035706684(char *, char *, char *, int );


static void work_a_1035171073_3212880686_p_0(char *t0)
{
    char t13[16];
    char t18[16];
    char t20[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    int t11;
    int t12;
    char *t14;
    char *t15;
    int t16;
    unsigned char t17;
    char *t19;
    char *t21;
    char *t22;
    int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t3 = (t0 + 1928U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 16U);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t5 = (11 - 11);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t3 = (t0 + 1808U);
    t4 = *((char **)t3);
    t8 = (11 - 11);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t3 = (t4 + t10);
    memcpy(t3, t1, 12U);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 5740);
    *((int *)t1) = 0;
    t2 = (t0 + 5744);
    *((int *)t2) = 11;
    t11 = 0;
    t12 = 11;

LAB2:    if (t11 <= t12)
        goto LAB3;

LAB5:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t5 = (15 - 15);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t3 = (t0 + 3568);
    t4 = (t3 + 56U);
    t14 = *((char **)t4);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t1, 16U);
    xsi_driver_first_trans_fast(t3);
    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 1928U);
    t4 = *((char **)t3);
    t5 = (15 - 3);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t3 = (t4 + t7);
    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 3;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 3);
    t8 = (t16 * -1);
    t8 = (t8 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t8;
    t17 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t3, t13, 4);
    if (t17 != 0)
        goto LAB6;

LAB8:
LAB7:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t5 = (15 - 7);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t3 = (t13 + 0U);
    t4 = (t3 + 0U);
    *((int *)t4) = 7;
    t4 = (t3 + 4U);
    *((int *)t4) = 4;
    t4 = (t3 + 8U);
    *((int *)t4) = -1;
    t16 = (4 - 7);
    t8 = (t16 * -1);
    t8 = (t8 + 1);
    t4 = (t3 + 12U);
    *((unsigned int *)t4) = t8;
    t17 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t1, t13, 4);
    if (t17 != 0)
        goto LAB9;

LAB11:
LAB10:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t5 = (15 - 11);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t3 = (t13 + 0U);
    t4 = (t3 + 0U);
    *((int *)t4) = 11;
    t4 = (t3 + 4U);
    *((int *)t4) = 8;
    t4 = (t3 + 8U);
    *((int *)t4) = -1;
    t16 = (8 - 11);
    t8 = (t16 * -1);
    t8 = (t8 + 1);
    t4 = (t3 + 12U);
    *((unsigned int *)t4) = t8;
    t17 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t1, t13, 4);
    if (t17 != 0)
        goto LAB12;

LAB14:
LAB13:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t5 = (15 - 14);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t3 = (t0 + 1808U);
    t4 = *((char **)t3);
    t16 = (11 - 11);
    t8 = (t16 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t3 = (t4 + t10);
    t17 = *((unsigned char *)t3);
    t15 = ((IEEE_P_1242562249) + 2976);
    t19 = (t18 + 0U);
    t21 = (t19 + 0U);
    *((int *)t21) = 14;
    t21 = (t19 + 4U);
    *((int *)t21) = 0;
    t21 = (t19 + 8U);
    *((int *)t21) = -1;
    t23 = (0 - 14);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t21 = (t19 + 12U);
    *((unsigned int *)t21) = t24;
    t14 = xsi_base_array_concat(t14, t13, t15, (char)97, t1, t18, (char)99, t17, (char)101);
    t21 = (t0 + 1928U);
    t22 = *((char **)t21);
    t21 = (t22 + 0);
    t24 = (15U + 1U);
    memcpy(t21, t14, t24);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1808U);
    t2 = *((char **)t1);
    t5 = (11 - 10);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t4 = ((IEEE_P_2592010699) + 4000);
    t14 = (t18 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 10;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (0 - 10);
    t8 = (t16 * -1);
    t8 = (t8 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t8;
    t3 = xsi_base_array_concat(t3, t13, t4, (char)97, t1, t18, (char)99, (unsigned char)2, (char)101);
    t15 = (t0 + 1808U);
    t19 = *((char **)t15);
    t15 = (t19 + 0);
    t8 = (11U + 1U);
    memcpy(t15, t3, t8);

LAB4:    t1 = (t0 + 5740);
    t11 = *((int *)t1);
    t2 = (t0 + 5744);
    t12 = *((int *)t2);
    if (t11 == t12)
        goto LAB5;

LAB15:    t16 = (t11 + 1);
    t11 = t16;
    t3 = (t0 + 5740);
    *((int *)t3) = t11;
    goto LAB2;

LAB6:    xsi_set_current_line(59, ng0);
    t15 = (t0 + 1928U);
    t19 = *((char **)t15);
    t8 = (15 - 3);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t15 = (t19 + t10);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 3;
    t22 = (t21 + 4U);
    *((int *)t22) = 0;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t23 = (0 - 3);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t24;
    t22 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t18, t15, t20, 3);
    t25 = (t0 + 1928U);
    t26 = *((char **)t25);
    t24 = (15 - 3);
    t27 = (t24 * 1U);
    t28 = (0 + t27);
    t25 = (t26 + t28);
    t29 = (t18 + 12U);
    t30 = *((unsigned int *)t29);
    t31 = (1U * t30);
    memcpy(t25, t22, t31);
    goto LAB7;

LAB9:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 1928U);
    t14 = *((char **)t4);
    t8 = (15 - 7);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t4 = (t14 + t10);
    t15 = (t20 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 7;
    t19 = (t15 + 4U);
    *((int *)t19) = 4;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t23 = (4 - 7);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t19 = (t15 + 12U);
    *((unsigned int *)t19) = t24;
    t19 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t18, t4, t20, 3);
    t21 = (t0 + 1928U);
    t22 = *((char **)t21);
    t24 = (15 - 7);
    t27 = (t24 * 1U);
    t28 = (0 + t27);
    t21 = (t22 + t28);
    t25 = (t18 + 12U);
    t30 = *((unsigned int *)t25);
    t31 = (1U * t30);
    memcpy(t21, t19, t31);
    goto LAB10;

LAB12:    xsi_set_current_line(67, ng0);
    t4 = (t0 + 1928U);
    t14 = *((char **)t4);
    t8 = (15 - 11);
    t9 = (t8 * 1U);
    t10 = (0 + t9);
    t4 = (t14 + t10);
    t15 = (t20 + 0U);
    t19 = (t15 + 0U);
    *((int *)t19) = 11;
    t19 = (t15 + 4U);
    *((int *)t19) = 8;
    t19 = (t15 + 8U);
    *((int *)t19) = -1;
    t23 = (8 - 11);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t19 = (t15 + 12U);
    *((unsigned int *)t19) = t24;
    t19 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t18, t4, t20, 3);
    t21 = (t0 + 1928U);
    t22 = *((char **)t21);
    t24 = (15 - 11);
    t27 = (t24 * 1U);
    t28 = (0 + t27);
    t21 = (t22 + t28);
    t25 = (t18 + 12U);
    t30 = *((unsigned int *)t25);
    t31 = (1U * t30);
    memcpy(t21, t19, t31);
    goto LAB13;

}

static void work_a_1035171073_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(79, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3632);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3488);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1035171073_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1035171073_3212880686_p_0,(void *)work_a_1035171073_3212880686_p_1};
	xsi_register_didat("work_a_1035171073_3212880686", "isim/signal_display_top_isim_beh.exe.sim/work/a_1035171073_3212880686.didat");
	xsi_register_executes(pe);
}
