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
static const char *ng0 = "/home/kevin/Downloads/mojo-base-project-master/src/avr_interface.v";
static unsigned int ng1[] = {0U, 15U};
static unsigned int ng2[] = {0U, 1U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {7, 0};
static int ng6[] = {0, 0};
static int ng7[] = {9, 0};
static int ng8[] = {8, 0};
static unsigned int ng9[] = {255U, 0U};



static void NetDecl_43_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 8688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 4656U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t0 + 11448);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t15, 0, 8);
    t16 = 1U;
    t17 = t16;
    t18 = (t3 + 4);
    t19 = *((unsigned int *)t3);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t18);
    t17 = (t17 & t20);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 | t16);
    t23 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t23 | t17);
    xsi_driver_vfirst_trans(t11, 0, 0U);
    t24 = (t0 + 11240);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

}

static void Cont_101_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 8936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 6816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 11256);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_102_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 9184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 6496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11576);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1023U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 9);
    t18 = (t0 + 11272);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_103_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 9432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 7136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 11640);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 15U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 3);
    t18 = (t0 + 11288);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_106_4(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 9680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 4656U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t16, 8);

LAB16:    t22 = (t0 + 11704);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 15U;
    t28 = t27;
    t29 = (t3 + 4);
    t30 = *((unsigned int *)t3);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 3);
    t35 = (t0 + 11304);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 3056U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = ((char*)((ng1)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 4, t17, 4, t16, 4);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

}

static void Cont_107_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t17[8];
    char t26[8];
    char t34[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    int t58;
    int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;

LAB0:    t1 = (t0 + 9928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 4656U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t5 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB8;

LAB9:    memcpy(t34, t6, 8);

LAB10:    memset(t4, 0, 8);
    t66 = (t34 + 4);
    t67 = *((unsigned int *)t66);
    t68 = (~(t67));
    t69 = *((unsigned int *)t34);
    t70 = (t69 & t68);
    t71 = (t70 & 1U);
    if (t71 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t66) != 0)
        goto LAB24;

LAB25:    t73 = (t4 + 4);
    t74 = *((unsigned int *)t4);
    t75 = *((unsigned int *)t73);
    t76 = (t74 || t75);
    if (t76 > 0)
        goto LAB26;

LAB27:    t79 = *((unsigned int *)t4);
    t80 = (~(t79));
    t81 = *((unsigned int *)t73);
    t82 = (t80 || t81);
    if (t82 > 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t73) > 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t4) > 0)
        goto LAB32;

LAB33:    memcpy(t3, t77, 8);

LAB34:    t83 = (t0 + 11768);
    t84 = (t83 + 56U);
    t85 = *((char **)t84);
    t86 = (t85 + 56U);
    t87 = *((char **)t86);
    memset(t87, 0, 8);
    t88 = 1U;
    t89 = t88;
    t90 = (t3 + 4);
    t91 = *((unsigned int *)t3);
    t88 = (t88 & t91);
    t92 = *((unsigned int *)t90);
    t89 = (t89 & t92);
    t93 = (t87 + 4);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t94 | t88);
    t95 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t95 | t89);
    xsi_driver_vfirst_trans(t83, 0, 0);
    t96 = (t0 + 11320);
    *((int *)t96) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB6:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 2416U);
    t19 = *((char **)t18);
    memset(t17, 0, 8);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t19);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB14;

LAB12:    if (*((unsigned int *)t18) == 0)
        goto LAB11;

LAB13:    t25 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t25) = 1;

LAB14:    memset(t26, 0, 8);
    t27 = (t17 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t17);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t27) != 0)
        goto LAB17;

LAB18:    t35 = *((unsigned int *)t6);
    t36 = *((unsigned int *)t26);
    t37 = (t35 & t36);
    *((unsigned int *)t34) = t37;
    t38 = (t6 + 4);
    t39 = (t26 + 4);
    t40 = (t34 + 4);
    t41 = *((unsigned int *)t38);
    t42 = *((unsigned int *)t39);
    t43 = (t41 | t42);
    *((unsigned int *)t40) = t43;
    t44 = *((unsigned int *)t40);
    t45 = (t44 != 0);
    if (t45 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB10;

LAB11:    *((unsigned int *)t17) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t26) = 1;
    goto LAB18;

LAB17:    t33 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB18;

LAB19:    t46 = *((unsigned int *)t34);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t34) = (t46 | t47);
    t48 = (t6 + 4);
    t49 = (t26 + 4);
    t50 = *((unsigned int *)t6);
    t51 = (~(t50));
    t52 = *((unsigned int *)t48);
    t53 = (~(t52));
    t54 = *((unsigned int *)t26);
    t55 = (~(t54));
    t56 = *((unsigned int *)t49);
    t57 = (~(t56));
    t58 = (t51 & t53);
    t59 = (t55 & t57);
    t60 = (~(t58));
    t61 = (~(t59));
    t62 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t62 & t60);
    t63 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t63 & t61);
    t64 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t64 & t60);
    t65 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t65 & t61);
    goto LAB21;

LAB22:    *((unsigned int *)t4) = 1;
    goto LAB25;

LAB24:    t72 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB25;

LAB26:    t77 = (t0 + 5456U);
    t78 = *((char **)t77);
    goto LAB27;

LAB28:    t77 = ((char*)((ng2)));
    goto LAB29;

LAB30:    xsi_vlog_unsigned_bit_combine(t3, 1, t78, 1, t77, 1);
    goto LAB34;

LAB32:    memcpy(t3, t78, 8);
    goto LAB34;

}

static void Cont_108_6(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 10176U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4656U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t16, 8);

LAB16:    t22 = (t0 + 11832);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t3 + 4);
    t30 = *((unsigned int *)t3);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 11336);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 5296U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = ((char*)((ng2)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t17, 1, t16, 1);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

}

static void Always_110_7(char *t0)
{
    char t8[8];
    char t9[8];
    char t26[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    int t58;
    int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    int t74;
    char *t75;
    int t76;
    int t77;
    int t78;
    int t79;
    int t80;

LAB0:    t1 = (t0 + 10424U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 11352);
    *((int *)t2) = 1;
    t3 = (t0 + 10456);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(110, ng0);

LAB5:    xsi_set_current_line(111, ng0);
    t4 = (t0 + 6176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 6016);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 1);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 6496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6336);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 10);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6656);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 7136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6976);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 7776);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7616);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 4176U);
    t3 = *((char **)t2);
    t2 = (t0 + 7456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t9, 0, 8);
    t6 = (t9 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    *((unsigned int *)t9) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 0);
    *((unsigned int *)t6) = t13;
    t14 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t14 & 7U);
    t15 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t15 & 7U);
    xsi_vlogtype_concat(t8, 4, 4, 2U, t9, 3, t3, 1);
    t16 = (t0 + 7296);
    xsi_vlogvar_assign_value(t16, t8, 0, 0, 4);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 7456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 3);
    t12 = (t11 & 1);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 3);
    t15 = (t14 & 1);
    *((unsigned int *)t5) = t15;
    t7 = (t0 + 7456);
    t16 = (t7 + 56U);
    t17 = *((char **)t16);
    memset(t9, 0, 8);
    t18 = (t9 + 4);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 2);
    t22 = (t21 & 1);
    *((unsigned int *)t9) = t22;
    t23 = *((unsigned int *)t19);
    t24 = (t23 >> 2);
    t25 = (t24 & 1);
    *((unsigned int *)t18) = t25;
    t27 = *((unsigned int *)t8);
    t28 = *((unsigned int *)t9);
    t29 = (t27 ^ t28);
    *((unsigned int *)t26) = t29;
    t30 = (t8 + 4);
    t31 = (t9 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB6;

LAB7:
LAB8:    t40 = (t26 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t26);
    t44 = (t43 & t42);
    t45 = (t44 != 0);
    if (t45 > 0)
        goto LAB9;

LAB10:
LAB11:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 4016U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB15;

LAB13:    if (*((unsigned int *)t2) == 0)
        goto LAB12;

LAB14:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;

LAB15:    memset(t9, 0, 8);
    t5 = (t8 + 4);
    t15 = *((unsigned int *)t5);
    t20 = (~(t15));
    t21 = *((unsigned int *)t8);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t5) != 0)
        goto LAB18;

LAB19:    t7 = (t9 + 4);
    t24 = *((unsigned int *)t9);
    t25 = *((unsigned int *)t7);
    t27 = (t24 || t25);
    if (t27 > 0)
        goto LAB20;

LAB21:    memcpy(t48, t9, 8);

LAB22:    t46 = (t48 + 4);
    t66 = *((unsigned int *)t46);
    t67 = (~(t66));
    t68 = *((unsigned int *)t48);
    t69 = (t68 & t67);
    t70 = (t69 != 0);
    if (t70 > 0)
        goto LAB30;

LAB31:
LAB32:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB33;

LAB34:
LAB35:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4976U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB6:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    goto LAB8;

LAB9:    xsi_set_current_line(120, ng0);
    t46 = ((char*)((ng3)));
    t47 = (t0 + 7616);
    xsi_vlogvar_assign_value(t47, t46, 0, 0, 1);
    goto LAB11;

LAB12:    *((unsigned int *)t8) = 1;
    goto LAB15;

LAB16:    *((unsigned int *)t9) = 1;
    goto LAB19;

LAB18:    t6 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB19;

LAB20:    t16 = (t0 + 3856U);
    t17 = *((char **)t16);
    memset(t26, 0, 8);
    t16 = (t17 + 4);
    t28 = *((unsigned int *)t16);
    t29 = (~(t28));
    t33 = *((unsigned int *)t17);
    t34 = (t33 & t29);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t16) != 0)
        goto LAB25;

LAB26:    t36 = *((unsigned int *)t9);
    t37 = *((unsigned int *)t26);
    t38 = (t36 & t37);
    *((unsigned int *)t48) = t38;
    t19 = (t9 + 4);
    t30 = (t26 + 4);
    t31 = (t48 + 4);
    t39 = *((unsigned int *)t19);
    t41 = *((unsigned int *)t30);
    t42 = (t39 | t41);
    *((unsigned int *)t31) = t42;
    t43 = *((unsigned int *)t31);
    t44 = (t43 != 0);
    if (t44 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB22;

LAB23:    *((unsigned int *)t26) = 1;
    goto LAB26;

LAB25:    t18 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB26;

LAB27:    t45 = *((unsigned int *)t48);
    t49 = *((unsigned int *)t31);
    *((unsigned int *)t48) = (t45 | t49);
    t32 = (t9 + 4);
    t40 = (t26 + 4);
    t50 = *((unsigned int *)t9);
    t51 = (~(t50));
    t52 = *((unsigned int *)t32);
    t53 = (~(t52));
    t54 = *((unsigned int *)t26);
    t55 = (~(t54));
    t56 = *((unsigned int *)t40);
    t57 = (~(t56));
    t58 = (t51 & t53);
    t59 = (t55 & t57);
    t60 = (~(t58));
    t61 = (~(t59));
    t62 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t62 & t60);
    t63 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t63 & t61);
    t64 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t64 & t60);
    t65 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t65 & t61);
    goto LAB29;

LAB30:    xsi_set_current_line(123, ng0);
    t47 = ((char*)((ng4)));
    t71 = (t0 + 7616);
    xsi_vlogvar_assign_value(t71, t47, 0, 0, 1);
    goto LAB32;

LAB33:    xsi_set_current_line(125, ng0);

LAB36:    xsi_set_current_line(126, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 6016);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB35;

LAB37:    xsi_set_current_line(129, ng0);

LAB40:    xsi_set_current_line(130, ng0);
    t4 = (t0 + 6176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng3)));
    memset(t8, 0, 8);
    t16 = (t6 + 4);
    t17 = (t7 + 4);
    t15 = *((unsigned int *)t6);
    t20 = *((unsigned int *)t7);
    t21 = (t15 ^ t20);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t27 = *((unsigned int *)t16);
    t28 = *((unsigned int *)t17);
    t29 = (t27 | t28);
    t33 = (~(t29));
    t34 = (t25 & t33);
    if (t34 != 0)
        goto LAB44;

LAB41:    if (t29 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t8) = 1;

LAB44:    t19 = (t8 + 4);
    t35 = *((unsigned int *)t19);
    t36 = (~(t35));
    t37 = *((unsigned int *)t8);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(133, ng0);

LAB51:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 5136U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t8 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 0);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    t5 = (t0 + 6336);
    t6 = (t0 + 6336);
    t7 = (t6 + 72U);
    t16 = *((char **)t7);
    t17 = ((char*)((ng7)));
    t18 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t9, t26, t48, ((int*)(t16)), 2, t17, 32, 1, t18, 32, 1);
    t19 = (t9 + 4);
    t20 = *((unsigned int *)t19);
    t58 = (!(t20));
    t30 = (t26 + 4);
    t21 = *((unsigned int *)t30);
    t59 = (!(t21));
    t74 = (t58 && t59);
    t31 = (t48 + 4);
    t22 = *((unsigned int *)t31);
    t76 = (!(t22));
    t77 = (t74 && t76);
    if (t77 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 5136U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t8 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (t10 >> 4);
    *((unsigned int *)t8) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 4);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t14 & 15U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 15U);
    t5 = (t0 + 6976);
    xsi_vlogvar_assign_value(t5, t8, 0, 0, 4);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6016);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6656);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB47:    goto LAB39;

LAB43:    t18 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB44;

LAB45:    xsi_set_current_line(130, ng0);

LAB48:    xsi_set_current_line(131, ng0);
    t30 = (t0 + 5136U);
    t31 = *((char **)t30);
    t30 = (t0 + 6336);
    t32 = (t0 + 6336);
    t40 = (t32 + 72U);
    t46 = *((char **)t40);
    t47 = ((char*)((ng5)));
    t71 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t9, t26, t48, ((int*)(t46)), 2, t47, 32, 1, t71, 32, 1);
    t72 = (t9 + 4);
    t41 = *((unsigned int *)t72);
    t58 = (!(t41));
    t73 = (t26 + 4);
    t42 = *((unsigned int *)t73);
    t59 = (!(t42));
    t74 = (t58 && t59);
    t75 = (t48 + 4);
    t43 = *((unsigned int *)t75);
    t76 = (!(t43));
    t77 = (t74 && t76);
    if (t77 == 1)
        goto LAB49;

LAB50:    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6016);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB47;

LAB49:    t44 = *((unsigned int *)t48);
    t78 = (t44 + 0);
    t45 = *((unsigned int *)t9);
    t49 = *((unsigned int *)t26);
    t79 = (t45 - t49);
    t80 = (t79 + 1);
    xsi_vlogvar_assign_value(t30, t31, t78, *((unsigned int *)t26), t80);
    goto LAB50;

LAB52:    t23 = *((unsigned int *)t48);
    t78 = (t23 + 0);
    t24 = *((unsigned int *)t9);
    t25 = *((unsigned int *)t26);
    t79 = (t24 - t25);
    t80 = (t79 + 1);
    xsi_vlogvar_assign_value(t5, t8, t78, *((unsigned int *)t26), t80);
    goto LAB53;

}

static void Always_142_8(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 10672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 11368);
    *((int *)t2) = 1;
    t3 = (t0 + 10704);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(142, ng0);

LAB5:    xsi_set_current_line(143, ng0);
    t4 = (t0 + 4816U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(147, ng0);

LAB10:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 6016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6176);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 6336);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6496);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 6656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6816);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB8:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 7296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7456);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 7616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7776);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 6976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7136);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB2;

LAB6:    xsi_set_current_line(143, ng0);

LAB9:    xsi_set_current_line(144, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 6176);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng9)));
    t3 = (t0 + 11896);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 255U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 7);

LAB1:    return;
}


extern void work_m_12079722177723164890_3411995372_init()
{
	static char *pe[] = {(void *)NetDecl_43_0,(void *)Cont_101_1,(void *)Cont_102_2,(void *)Cont_103_3,(void *)Cont_106_4,(void *)Cont_107_5,(void *)Cont_108_6,(void *)Always_110_7,(void *)Always_142_8,(void *)implSig1_execute};
	xsi_register_didat("work_m_12079722177723164890_3411995372", "isim/signal_display_top_isim_beh.exe.sim/work/m_12079722177723164890_3411995372.didat");
	xsi_register_executes(pe);
}
