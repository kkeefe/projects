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
static const char *ng0 = "/home/kevin/project/ise/SSD_display/SSD_display.vhd";
extern char *IEEE_P_2592010699;



static void work_a_0224324906_3212880686_p_0(char *t0)
{
    char t18[16];
    char t20[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    int t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t21;
    char *t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    int t28;
    int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3512);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 1968U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 + 1);
    t4 = (t0 + 1968U);
    t11 = *((char **)t4);
    t4 = (t11 + 0);
    *((int *)t4) = t10;
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1968U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 == 62499);
    if (t1 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1968U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t12 = (3 - 2);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 1352U);
    t8 = *((char **)t5);
    t9 = (3 - 3);
    t15 = (t9 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t5 = (t8 + t17);
    t1 = *((unsigned char *)t5);
    t19 = ((IEEE_P_2592010699) + 4000);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 2;
    t22 = (t21 + 4U);
    *((int *)t22) = 0;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t10 = (0 - 2);
    t23 = (t10 * -1);
    t23 = (t23 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t23;
    t11 = xsi_base_array_concat(t11, t18, t19, (char)97, t2, t20, (char)99, t1, (char)101);
    t23 = (3U + 1U);
    t3 = (4U != t23);
    if (t3 == 1)
        goto LAB11;

LAB12:    t22 = (t0 + 3608);
    t24 = (t22 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t11, 4U);
    xsi_driver_first_trans_delta(t22, 0U, 4U, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 5768);
    t9 = xsi_mem_cmp(t2, t4, 4U);
    if (t9 == 1)
        goto LAB14;

LAB19:    t8 = (t0 + 5772);
    t10 = xsi_mem_cmp(t8, t4, 4U);
    if (t10 == 1)
        goto LAB15;

LAB20:    t19 = (t0 + 5776);
    t28 = xsi_mem_cmp(t19, t4, 4U);
    if (t28 == 1)
        goto LAB16;

LAB21:    t22 = (t0 + 5780);
    t29 = xsi_mem_cmp(t22, t4, 4U);
    if (t29 == 1)
        goto LAB17;

LAB22:
LAB18:    xsi_set_current_line(61, ng0);

LAB13:    goto LAB9;

LAB11:    xsi_size_not_matching(4U, t23, 0);
    goto LAB12;

LAB14:    xsi_set_current_line(57, ng0);
    t25 = (t0 + 1192U);
    t26 = *((char **)t25);
    t12 = (15 - 15);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t25 = (t26 + t14);
    t27 = (t0 + 3672);
    t30 = (t27 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t25, 4U);
    xsi_driver_first_trans_delta(t27, 0U, 4U, 0LL);
    goto LAB13;

LAB15:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (15 - 11);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 3672);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t19 = (t11 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t2, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 0LL);
    goto LAB13;

LAB16:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (15 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 3672);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t19 = (t11 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t2, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 0LL);
    goto LAB13;

LAB17:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (15 - 3);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 3672);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t19 = (t11 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t2, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 0LL);
    goto LAB13;

LAB23:;
}

static void work_a_0224324906_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    int t15;
    char *t16;
    int t18;
    char *t19;
    int t21;
    char *t22;
    int t24;
    char *t25;
    int t27;
    char *t28;
    int t30;
    char *t31;
    int t33;
    char *t34;
    int t36;
    char *t37;
    int t39;
    char *t40;
    int t42;
    char *t43;
    int t45;
    char *t46;
    int t48;
    char *t49;
    int t51;
    char *t52;
    unsigned char t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;

LAB0:    t1 = (t0 + 3192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t4 = (3 - 3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 5784);
    t9 = xsi_mem_cmp(t7, t2, 4U);
    if (t9 == 1)
        goto LAB5;

LAB21:    t10 = (t0 + 5788);
    t12 = xsi_mem_cmp(t10, t2, 4U);
    if (t12 == 1)
        goto LAB6;

LAB22:    t13 = (t0 + 5792);
    t15 = xsi_mem_cmp(t13, t2, 4U);
    if (t15 == 1)
        goto LAB7;

LAB23:    t16 = (t0 + 5796);
    t18 = xsi_mem_cmp(t16, t2, 4U);
    if (t18 == 1)
        goto LAB8;

LAB24:    t19 = (t0 + 5800);
    t21 = xsi_mem_cmp(t19, t2, 4U);
    if (t21 == 1)
        goto LAB9;

LAB25:    t22 = (t0 + 5804);
    t24 = xsi_mem_cmp(t22, t2, 4U);
    if (t24 == 1)
        goto LAB10;

LAB26:    t25 = (t0 + 5808);
    t27 = xsi_mem_cmp(t25, t2, 4U);
    if (t27 == 1)
        goto LAB11;

LAB27:    t28 = (t0 + 5812);
    t30 = xsi_mem_cmp(t28, t2, 4U);
    if (t30 == 1)
        goto LAB12;

LAB28:    t31 = (t0 + 5816);
    t33 = xsi_mem_cmp(t31, t2, 4U);
    if (t33 == 1)
        goto LAB13;

LAB29:    t34 = (t0 + 5820);
    t36 = xsi_mem_cmp(t34, t2, 4U);
    if (t36 == 1)
        goto LAB14;

LAB30:    t37 = (t0 + 5824);
    t39 = xsi_mem_cmp(t37, t2, 4U);
    if (t39 == 1)
        goto LAB15;

LAB31:    t40 = (t0 + 5828);
    t42 = xsi_mem_cmp(t40, t2, 4U);
    if (t42 == 1)
        goto LAB16;

LAB32:    t43 = (t0 + 5832);
    t45 = xsi_mem_cmp(t43, t2, 4U);
    if (t45 == 1)
        goto LAB17;

LAB33:    t46 = (t0 + 5836);
    t48 = xsi_mem_cmp(t46, t2, 4U);
    if (t48 == 1)
        goto LAB18;

LAB34:    t49 = (t0 + 5840);
    t51 = xsi_mem_cmp(t49, t2, 4U);
    if (t51 == 1)
        goto LAB19;

LAB35:
LAB20:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5964);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB67;

LAB68:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);

LAB4:    xsi_set_current_line(67, ng0);

LAB71:    t2 = (t0 + 3528);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB72;

LAB1:    return;
LAB5:    xsi_set_current_line(68, ng0);
    t52 = (t0 + 5844);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB37;

LAB38:    t55 = (t0 + 3736);
    t56 = (t55 + 56U);
    t57 = *((char **)t56);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    memcpy(t59, t52, 8U);
    xsi_driver_first_trans_delta(t55, 0U, 8U, 0LL);
    goto LAB4;

LAB6:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5852);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB39;

LAB40:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB7:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5860);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB41;

LAB42:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB8:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5868);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB43;

LAB44:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB9:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5876);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB45;

LAB46:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB10:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5884);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB47;

LAB48:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB11:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5892);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB49;

LAB50:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB12:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5900);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB51;

LAB52:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB13:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5908);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB53;

LAB54:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB14:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5916);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB55;

LAB56:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB15:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5924);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB57;

LAB58:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB16:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5932);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB59;

LAB60:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB17:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5940);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB61;

LAB62:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB18:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5948);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB63;

LAB64:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB19:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5956);
    t54 = (8U != 8U);
    if (t54 == 1)
        goto LAB65;

LAB66:    t7 = (t0 + 3736);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_delta(t7, 0U, 8U, 0LL);
    goto LAB4;

LAB36:;
LAB37:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB38;

LAB39:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB40;

LAB41:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB42;

LAB43:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB44;

LAB45:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB46;

LAB47:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB48;

LAB49:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB50;

LAB51:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB52;

LAB53:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB54;

LAB55:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB56;

LAB57:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB58;

LAB59:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB60;

LAB61:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB62;

LAB63:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB64;

LAB65:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB66;

LAB67:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB68;

LAB69:    t3 = (t0 + 3528);
    *((int *)t3) = 0;
    goto LAB2;

LAB70:    goto LAB69;

LAB72:    goto LAB70;

}


extern void work_a_0224324906_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0224324906_3212880686_p_0,(void *)work_a_0224324906_3212880686_p_1};
	xsi_register_didat("work_a_0224324906_3212880686", "isim/signal_display_top_isim_beh.exe.sim/work/a_0224324906_3212880686.didat");
	xsi_register_executes(pe);
}
