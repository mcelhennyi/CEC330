/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#define CC_CLANG

#include "iki.h"
#ifdef __GNUC__
#include <stdlib.h>
#else
#define alloca _alloca
#endif
static const char *ng0 = "Function max ended without a return statement\n";
static const char *ng1 = "Function min ended without a return statement\n";
static const char *ng2 = "Function maximum ended without a return statement\n";

extern void _execute_28(char *, char *);
extern void execute_28(char *, char *);
extern void _execute_29(char *, char *);
extern void execute_29(char *, char *);
extern void _execute_30(char *, char *);
extern void execute_30(char *, char *);
extern void _execute_31(char *, char *);
extern void execute_31(char *, char *);
extern void _execute_32(char *, char *);
extern void execute_32(char *, char *);
extern void _transaction_0(char *, char *, unsigned int , unsigned int , unsigned int );
extern void transaction_0(char *, char *, unsigned int , unsigned int , unsigned int );



//SHA1: 4146722322_2583028914_121038446_838278302_1561933240
unsigned char _ieee_p_9a7ef1cb_sub_0(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_0(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_0");
unsigned char ieee_p_9a7ef1cb_sub_0(char *t1, char *t2, char *t3)
{
    unsigned char t0;
    int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char* dummy_clang_label = &&LAB0;


LAB0:    *((unsigned char *)((t3 + 88LL))) = (unsigned char)4;

LAB2:    t4 = *((int *)((((t3 + 72U)) + 8LL)));
    t5 = (t4 == 1);
    if (t5 != 0)
        goto LAB4;

LAB6:    t6 = (t3 + 96U);
    _iki_std_memcpy(t6, (t3 + 72U), 16LL);
    t4 = *((int *)((t6 + 0LL)));
    t7 = (t3 + 92LL);
    *((int *)t7) = t4;
    t8 = t4;
    t10 = *((int *)((t6 + 4LL)));
    t9 = t10;
    t11 = *((int *)((t6 + 12LL)));
    t19 = ((char)(t11));

LAB15:    if ((t8 * t19) <= (t9 * t19))
        goto LAB16;

LAB18:
LAB5:    t7 = (t3 + 88LL);
    t0 = *((unsigned char *)t7);

LAB3:
LAB1:    return t0;

LAB4:    t6 = (t3 + 64LL);
    t7 = *((char **)t6);
    t9 = *((int *)((((t3 + 72U)) + 0LL)));
    t10 = *((int *)((((t3 + 72U)) + 4LL)));
    t11 = *((int *)((((t3 + 72U)) + 12LL)));
    if (t9 > t10)
        goto LAB7;

LAB8:    if (t11 == (-1))
        goto LAB12;

LAB13:    t8 = t9;

LAB9:    t12 = *((int *)((((t3 + 72U)) + 0LL)));
    t13 = *((int *)((((t3 + 72U)) + 12LL)));
    t14 = (t8 - t12);
    t15 = (t14 * t13);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t18 = *((unsigned char *)((t7 + t17)));
    t0 = t18;
    goto LAB3;

LAB7:    if (t11 == 1)
        goto LAB10;

LAB11:    t8 = t10;
    goto LAB9;

LAB10:    t8 = t9;
    goto LAB9;

LAB12:    t8 = t10;
    goto LAB9;

LAB14:    goto LAB5;

LAB16:    t20 = (t1 + 4464LL);
    t21 = (t3 + 88LL);
    t12 = ((*((unsigned char *)t21)) - 0);
    t15 = (t12 * 1);
    t16 = (t15 * 9);
    t22 = (t3 + 64LL);
    t23 = *((char **)t22);
    t24 = (t3 + 92LL);
    t13 = *((int *)((((t3 + 72U)) + 0LL)));
    t14 = *((int *)((((t3 + 72U)) + 12LL)));
    t25 = ((*((int *)t24)) - t13);
    t17 = (t25 * t14);
    t26 = *((int *)((((t3 + 72U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t13, t26, t14, *((int *)t24));
    t27 = (1U * t17);
    t28 = (0 + t27);
    t5 = *((unsigned char *)((t23 + t28)));
    t29 = (t5 - 0);
    t30 = (t29 * 1);
    t31 = (t16 + t30);
    t32 = (1U * t31);
    t33 = (0 + t32);
    t18 = *((unsigned char *)((t20 + t33)));
    t34 = (t3 + 88LL);
    *((unsigned char *)((t34 + 0))) = t18;

LAB17:    t7 = (t3 + 96U);
    t4 = *((int *)((t7 + 4LL)));
    t9 = t4;
    t10 = *((int *)((t7 + 12LL)));
    t19 = ((char)(t10));
    t20 = (t3 + 92LL);
    t8 = *((int *)t20);
    if (t8 == t9)
        goto LAB18;

LAB19:    t8 = (t8 + t19);
    *((int *)t20) = t8;
    goto LAB15;

LAB20:;
}


//SHA1: 2331204640_1493357658_2770314875_1683509905_1657636054
unsigned char _ieee_p_9a7ef1cb_sub_1(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_1(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_1");
unsigned char ieee_p_9a7ef1cb_sub_1(char *t1, char *t2, char *t3)
{
    unsigned char t0;
    char *t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t1 + 4545LL);
    t5 = (t3 + 64LL);
    t6 = ((*((unsigned char *)t5)) - 0);
    t7 = (t6 * 1);
    t8 = (t7 * 9);
    t9 = (t3 + 65LL);
    t10 = ((*((unsigned char *)t9)) - 0);
    t11 = (t10 * 1);
    t12 = (t8 + t11);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = *((unsigned char *)((t4 + t14)));
    t0 = t15;

LAB3:
LAB1:    return t0;

LAB4:;
}


//SHA1: 2331204640_1493357658_2770314875_1683509905_1657636054
unsigned char _ieee_p_9a7ef1cb_sub_2(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_2(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_2");
unsigned char ieee_p_9a7ef1cb_sub_2(char *t1, char *t2, char *t3)
{
    unsigned char t0;
    char *t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t1 + 4626LL);
    t5 = (t3 + 64LL);
    t6 = ((*((unsigned char *)t5)) - 0);
    t7 = (t6 * 1);
    t8 = (t7 * 9);
    t9 = (t3 + 65LL);
    t10 = ((*((unsigned char *)t9)) - 0);
    t11 = (t10 * 1);
    t12 = (t8 + t11);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = *((unsigned char *)((t4 + t14)));
    t0 = t15;

LAB3:
LAB1:    return t0;

LAB4:;
}


//SHA1: 2331204640_1493357658_2770314875_1683509905_1657636054
unsigned char _ieee_p_9a7ef1cb_sub_3(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_3(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_3");
unsigned char ieee_p_9a7ef1cb_sub_3(char *t1, char *t2, char *t3)
{
    unsigned char t0;
    char *t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t1 + 4707LL);
    t5 = (t3 + 64LL);
    t6 = ((*((unsigned char *)t5)) - 0);
    t7 = (t6 * 1);
    t8 = (t7 * 9);
    t9 = (t3 + 65LL);
    t10 = ((*((unsigned char *)t9)) - 0);
    t11 = (t10 * 1);
    t12 = (t8 + t11);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t15 = *((unsigned char *)((t4 + t14)));
    t0 = t15;

LAB3:
LAB1:    return t0;

LAB4:;
}


//SHA1: 408001695_1661084342_3424722890_3121441869_2921625491
unsigned char _ieee_p_9a7ef1cb_sub_4(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_4(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_4");
unsigned char ieee_p_9a7ef1cb_sub_4(char *t1, char *t2, char *t3)
{
    unsigned char t0;
    char *t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t1 + 4788LL);
    t5 = (t3 + 64LL);
    t6 = ((*((unsigned char *)t5)) - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t10 = *((unsigned char *)((t4 + t9)));
    t0 = t10;

LAB3:
LAB1:    return t0;

LAB4:;
}


//SHA1: 3383938279_610162374_3677429212_2277295055_767639953
unsigned char _ieee_p_9a7ef1cb_sub_5(char *, char *, char *);
unsigned char ieee_p_9a7ef1cb_sub_5(char *, char *, char *) _asm("_ieee_p_9a7ef1cb_sub_5");
unsigned char ieee_p_9a7ef1cb_sub_5(char *t1, char *t2, char *t3)
{
    char t6[72];
    char t10[72];
    unsigned char t0;
    unsigned char t4;
    unsigned char t5;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    if (_iki_vhdl_event_signal_parameter((t3 + 64LL), 0U, 1) == 1)
        goto LAB7;

LAB8:    t5 = (unsigned char)0;

LAB9:    if (t5 == 1)
        goto LAB4;

LAB5:    t4 = (unsigned char)0;

LAB6:    t0 = t4;

LAB3:
LAB1:    return t0;

LAB4:    t11 = (t10 + 0LL);
    *((char **)t11) = t3;
    *((unsigned char *)((t10 + 64U))) = *((unsigned char *)(_iki_vhdl_last_value_signal_parameter((t3 + 64LL), 0)));
    t12 = _ieee_p_9a7ef1cb_sub_4(t1, t2, t10);
    t13 = (t12 == (unsigned char)2);
    t4 = t13;
    goto LAB6;

LAB7:    t7 = (t6 + 0LL);
    *((char **)t7) = t3;
    *((unsigned char *)((t6 + 64U))) = *((unsigned char *)(((*((char **)((t3 + 80LL)))) + (*((unsigned int *)((t3 + 88LL)))))));
    t8 = _ieee_p_9a7ef1cb_sub_4(t1, t2, t6);
    t9 = (t8 == (unsigned char)3);
    t5 = t9;
    goto LAB9;

LAB10:;
}


//SHA1: 2517412556_1173174444_3761327090_2349501507_2096742548
int _ieee_p_d09549db_sub_6(char *, char *, char *);
int ieee_p_d09549db_sub_6(char *, char *, char *) _asm("_ieee_p_d09549db_sub_6");
int ieee_p_d09549db_sub_6(char *t1, char *t2, char *t3)
{
    int t0;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t3 + 64LL);
    t5 = (t3 + 68LL);
    t6 = ((*((int *)t4)) > (*((int *)t5)));
    if (t6 != 0)
        goto LAB4;

LAB6:    t4 = (t3 + 68LL);
    t0 = *((int *)t4);

LAB3:
LAB1:    return t0;

LAB4:    t7 = (t3 + 64LL);
    t0 = *((int *)t7);
    goto LAB3;

LAB5:    _iki_call_fatal_stop(ng0);
    t0 = 0;
    goto LAB1;

LAB7:    goto LAB5;

LAB8:    goto LAB5;

}


//SHA1: 4107120251_3849604014_3934433165_1792561586_2858734104
int _ieee_p_d09549db_sub_7(char *, char *, char *);
int ieee_p_d09549db_sub_7(char *, char *, char *) _asm("_ieee_p_d09549db_sub_7");
int ieee_p_d09549db_sub_7(char *t1, char *t2, char *t3)
{
    int t0;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t3 + 64LL);
    t5 = (t3 + 68LL);
    t6 = ((*((int *)t4)) < (*((int *)t5)));
    if (t6 != 0)
        goto LAB4;

LAB6:    t4 = (t3 + 68LL);
    t0 = *((int *)t4);

LAB3:
LAB1:    return t0;

LAB4:    t7 = (t3 + 64LL);
    t0 = *((int *)t7);
    goto LAB3;

LAB5:    _iki_call_fatal_stop(ng1);
    t0 = 0;
    goto LAB1;

LAB7:    goto LAB5;

LAB8:    goto LAB5;

}


//SHA1: 2113425410_2271130401_1410983190_938961052_1228902997
char *_ieee_p_d09549db_sub_8(char *, char *, char *);
char *ieee_p_d09549db_sub_8(char *, char *, char *) _asm("_ieee_p_d09549db_sub_8");
char *ieee_p_d09549db_sub_8(char *t1, char *t2, char *t3)
{
    char t10[16];
    char t11[16];
    char *t0;
    int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t12;
    int t13;
    int t14;
    char t15;
    int t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    char* dummy_clang_label = &&LAB0;


LAB0:    t5 = 0;
    t4 = *((int *)((((t3 + 88U)) + 8LL)));
    t4 = (t4 * 1U);
    t6 = _iki_align(t4);
    t5 = (t5 + t6);
    t7 = _iki_spushz(t4);
    t8 = t7;
    _iki_std_memset(t8, (unsigned char)0, t4);
    t9 = *((int *)((((t3 + 88U)) + 8LL)));
    t9 = (t9 * 1U);
    _iki_std_memcpy(t11, (t3 + 88U), 16LL);
    _iki_std_memcpy((t10 + 0LL), t11, 16LL);
    t12 = _iki_spush(t9);
    *((char **)((t3 + 104LL))) = t12;
    _iki_std_memcpy(t12, t7, t9);
    _iki_std_memcpy((t3 + 112U), t10, 16LL);

LAB2:    t7 = (t3 + 132U);
    _iki_std_memcpy(t7, (t3 + 88U), 16LL);
    t4 = *((int *)((t7 + 0LL)));
    t8 = (t3 + 128LL);
    *((int *)t8) = t4;
    t13 = t4;
    t16 = *((int *)((t7 + 4LL)));
    t14 = t16;
    t17 = *((int *)((t7 + 12LL)));
    t15 = ((char)(t17));

LAB4:    if ((t13 * t15) <= (t14 * t15))
        goto LAB5;

LAB7:    t8 = (t3 + 104LL);
    t12 = *((char **)t8);
    t19 = (t3 + 64U);
    _iki_std_memcpy(t19, (t3 + 112U), 16LL);
    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t20 = _iki_dpush(t4);
    _iki_std_memcpy(t20, t12, t4);
    t0 = t20;

LAB3:    _iki_spop(t5);
    _iki_spop(t9);

LAB1:    return t0;

LAB5:    t12 = (t1 + 4797LL);
    t18 = (t3 + 80LL);
    t19 = *((char **)t18);
    t20 = (t3 + 128LL);
    t21 = *((int *)((((t3 + 88U)) + 0LL)));
    t22 = *((int *)((((t3 + 88U)) + 12LL)));
    t23 = ((*((int *)t20)) - t21);
    t6 = (t23 * t22);
    t24 = *((int *)((((t3 + 88U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t21, t24, t22, *((int *)t20));
    t25 = (1U * t6);
    t26 = (0 + t25);
    t27 = *((unsigned char *)((t19 + t26)));
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    _iki_vhdl_check_range_of_index_op(0, 8, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = *((unsigned char *)((t12 + t31)));
    if (t32 != 0)
        goto LAB8;

LAB10:
LAB9:    t8 = (t1 + 4891LL);
    t12 = (t3 + 80LL);
    t19 = *((char **)t12);
    t20 = (t3 + 128LL);
    t4 = *((int *)((((t3 + 88U)) + 0LL)));
    t16 = *((int *)((((t3 + 88U)) + 12LL)));
    t17 = ((*((int *)t20)) - t4);
    t6 = (t17 * t16);
    t21 = *((int *)((((t3 + 88U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t4, t21, t16, *((int *)t20));
    t25 = (1U * t6);
    t26 = (0 + t25);
    t27 = *((unsigned char *)((t19 + t26)));
    t22 = (t27 - 0);
    t29 = (t22 * 1);
    _iki_vhdl_check_range_of_index_op(0, 8, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = *((unsigned char *)((t8 + t31)));
    t33 = (t3 + 104LL);
    t34 = *((char **)t33);
    t35 = (t3 + 128LL);
    t23 = *((int *)((((t3 + 112U)) + 0LL)));
    t24 = *((int *)((((t3 + 112U)) + 12LL)));
    t28 = ((*((int *)t35)) - t23);
    t36 = (t28 * t24);
    t37 = *((int *)((((t3 + 112U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t23, t37, t24, *((int *)t35));
    t38 = (1U * t36);
    t39 = (0 + t38);
    *((unsigned char *)((t34 + t39))) = t32;

LAB6:    t8 = (t3 + 132U);
    t4 = *((int *)((t8 + 4LL)));
    t14 = t4;
    t16 = *((int *)((t8 + 12LL)));
    t15 = ((char)(t16));
    t12 = (t3 + 128LL);
    t13 = *((int *)t12);
    if (t13 == t14)
        goto LAB7;

LAB14:    t13 = (t13 + t15);
    *((int *)t12) = t13;
    goto LAB4;

LAB8:    if ((unsigned char)0 == 0)
        goto LAB11;

LAB12:    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t6 = _iki_align(t4);
    t5 = (t5 + t6);
    t8 = _iki_spushz(t4);
    t12 = t8;
    _iki_std_memset(t12, (unsigned char)1, t4);
    t18 = (t3 + 104LL);
    t19 = *((char **)t18);
    t16 = *((int *)((((t3 + 112U)) + 8LL)));
    t16 = (t16 * 1U);
    _iki_std_memcpy((t19 + 0), t8, t16);
    t8 = (t3 + 104LL);
    t12 = *((char **)t8);
    t18 = (t3 + 64U);
    _iki_std_memcpy(t18, (t3 + 112U), 16LL);
    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t19 = _iki_dpush(t4);
    _iki_std_memcpy(t19, t12, t4);
    t0 = t19;
    goto LAB3;

LAB11:    t33 = (t1 + 4806LL);
    _iki_vhdl_report(t33, 85U, (unsigned char)1);
    goto LAB12;

LAB13:    goto LAB9;

LAB15:;
}


//SHA1: 2113425410_2271130401_1410983190_938961052_1228902997
char *_ieee_p_d09549db_sub_9(char *, char *, char *);
char *ieee_p_d09549db_sub_9(char *, char *, char *) _asm("_ieee_p_d09549db_sub_9");
char *ieee_p_d09549db_sub_9(char *t1, char *t2, char *t3)
{
    char t10[16];
    char t11[16];
    char *t0;
    int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t12;
    int t13;
    int t14;
    char t15;
    int t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    char* dummy_clang_label = &&LAB0;


LAB0:    t5 = 0;
    t4 = *((int *)((((t3 + 88U)) + 8LL)));
    t4 = (t4 * 1U);
    t6 = _iki_align(t4);
    t5 = (t5 + t6);
    t7 = _iki_spushz(t4);
    t8 = t7;
    _iki_std_memset(t8, (unsigned char)0, t4);
    t9 = *((int *)((((t3 + 88U)) + 8LL)));
    t9 = (t9 * 1U);
    _iki_std_memcpy(t11, (t3 + 88U), 16LL);
    _iki_std_memcpy((t10 + 0LL), t11, 16LL);
    t12 = _iki_spush(t9);
    *((char **)((t3 + 104LL))) = t12;
    _iki_std_memcpy(t12, t7, t9);
    _iki_std_memcpy((t3 + 112U), t10, 16LL);

LAB2:    t7 = (t3 + 132U);
    _iki_std_memcpy(t7, (t3 + 88U), 16LL);
    t4 = *((int *)((t7 + 0LL)));
    t8 = (t3 + 128LL);
    *((int *)t8) = t4;
    t13 = t4;
    t16 = *((int *)((t7 + 4LL)));
    t14 = t16;
    t17 = *((int *)((t7 + 12LL)));
    t15 = ((char)(t17));

LAB4:    if ((t13 * t15) <= (t14 * t15))
        goto LAB5;

LAB7:    t8 = (t3 + 104LL);
    t12 = *((char **)t8);
    t19 = (t3 + 64U);
    _iki_std_memcpy(t19, (t3 + 112U), 16LL);
    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t20 = _iki_dpush(t4);
    _iki_std_memcpy(t20, t12, t4);
    t0 = t20;

LAB3:    _iki_spop(t5);
    _iki_spop(t9);

LAB1:    return t0;

LAB5:    t12 = (t1 + 4900LL);
    t18 = (t3 + 80LL);
    t19 = *((char **)t18);
    t20 = (t3 + 128LL);
    t21 = *((int *)((((t3 + 88U)) + 0LL)));
    t22 = *((int *)((((t3 + 88U)) + 12LL)));
    t23 = ((*((int *)t20)) - t21);
    t6 = (t23 * t22);
    t24 = *((int *)((((t3 + 88U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t21, t24, t22, *((int *)t20));
    t25 = (1U * t6);
    t26 = (0 + t25);
    t27 = *((unsigned char *)((t19 + t26)));
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    _iki_vhdl_check_range_of_index_op(0, 8, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = *((unsigned char *)((t12 + t31)));
    if (t32 != 0)
        goto LAB8;

LAB10:
LAB9:    t8 = (t1 + 4994LL);
    t12 = (t3 + 80LL);
    t19 = *((char **)t12);
    t20 = (t3 + 128LL);
    t4 = *((int *)((((t3 + 88U)) + 0LL)));
    t16 = *((int *)((((t3 + 88U)) + 12LL)));
    t17 = ((*((int *)t20)) - t4);
    t6 = (t17 * t16);
    t21 = *((int *)((((t3 + 88U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t4, t21, t16, *((int *)t20));
    t25 = (1U * t6);
    t26 = (0 + t25);
    t27 = *((unsigned char *)((t19 + t26)));
    t22 = (t27 - 0);
    t29 = (t22 * 1);
    _iki_vhdl_check_range_of_index_op(0, 8, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = *((unsigned char *)((t8 + t31)));
    t33 = (t3 + 104LL);
    t34 = *((char **)t33);
    t35 = (t3 + 128LL);
    t23 = *((int *)((((t3 + 112U)) + 0LL)));
    t24 = *((int *)((((t3 + 112U)) + 12LL)));
    t28 = ((*((int *)t35)) - t23);
    t36 = (t28 * t24);
    t37 = *((int *)((((t3 + 112U)) + 4LL)));
    _iki_vhdl_check_range_of_index_op(t23, t37, t24, *((int *)t35));
    t38 = (1U * t36);
    t39 = (0 + t38);
    *((unsigned char *)((t34 + t39))) = t32;

LAB6:    t8 = (t3 + 132U);
    t4 = *((int *)((t8 + 4LL)));
    t14 = t4;
    t16 = *((int *)((t8 + 12LL)));
    t15 = ((char)(t16));
    t12 = (t3 + 128LL);
    t13 = *((int *)t12);
    if (t13 == t14)
        goto LAB7;

LAB14:    t13 = (t13 + t15);
    *((int *)t12) = t13;
    goto LAB4;

LAB8:    if ((unsigned char)0 == 0)
        goto LAB11;

LAB12:    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t6 = _iki_align(t4);
    t5 = (t5 + t6);
    t8 = _iki_spushz(t4);
    t12 = t8;
    _iki_std_memset(t12, (unsigned char)1, t4);
    t18 = (t3 + 104LL);
    t19 = *((char **)t18);
    t16 = *((int *)((((t3 + 112U)) + 8LL)));
    t16 = (t16 * 1U);
    _iki_std_memcpy((t19 + 0), t8, t16);
    t8 = (t3 + 104LL);
    t12 = *((char **)t8);
    t18 = (t3 + 64U);
    _iki_std_memcpy(t18, (t3 + 112U), 16LL);
    t4 = *((int *)((((t3 + 112U)) + 8LL)));
    t4 = (t4 * 1U);
    t19 = _iki_dpush(t4);
    _iki_std_memcpy(t19, t12, t4);
    t0 = t19;
    goto LAB3;

LAB11:    t33 = (t1 + 4909LL);
    _iki_vhdl_report(t33, 85U, (unsigned char)1);
    goto LAB12;

LAB13:    goto LAB9;

LAB15:;
}


//SHA1: 453951426_1408845083_1256613812_2377148298_2407474500
int _ieee_p_d7c7ad0f_sub_10(char *, char *, char *);
int ieee_p_d7c7ad0f_sub_10(char *, char *, char *) _asm("_ieee_p_d7c7ad0f_sub_10");
int ieee_p_d7c7ad0f_sub_10(char *t1, char *t2, char *t3)
{
    int t0;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char* dummy_clang_label = &&LAB0;


LAB0:
LAB2:    t4 = (t3 + 64LL);
    t5 = (t3 + 68LL);
    t6 = ((*((int *)t4)) > (*((int *)t5)));
    if (t6 != 0)
        goto LAB4;

LAB6:    t4 = (t3 + 68LL);
    t0 = *((int *)t4);

LAB3:
LAB1:    return t0;

LAB4:    t7 = (t3 + 64LL);
    t0 = *((int *)t7);
    goto LAB3;

LAB5:    _iki_call_fatal_stop(ng2);
    t0 = 0;
    goto LAB1;

LAB7:    goto LAB5;

LAB8:    goto LAB5;

}


//SHA1: 841272765_1127851311_2980313597_1205066493_1298965095
extern void _transaction_0(char *, char *, unsigned int , unsigned int , unsigned int );
extern void transaction_0(char *, char *, unsigned int , unsigned int , unsigned int ) _asm("_transaction_0");
extern void transaction_0(char *t0, char *t1, unsigned int t2, unsigned int t3, unsigned int t4)
{
    char *t5;
    int t6;
    char *t7;
    char* dummy_clang_label = &&LAB0;


LAB0:    t5 = (t0 + ((t3 + 760LL)));
    t6 = _iki_std_memcmp(t5, t1, t4);
    if (t6 == 0)
        goto LAB3;

LAB2:    _iki_schedule_process((t0 + 3344LL));
    _iki_schedule_process((t0 + 3504LL));
    t1 = _iki_vhdl_event_callback((t0 + 624LL), t1, t3, t4);
    t7 = (t0 + ((t3 + 784LL)));
    _iki_std_memcpy(t7, t5, t4);
    _iki_dynamic_transaction_vhdl((t0 + 624LL), t1, t3, t4);
    _iki_std_memcpy(t5, t1, t4);

LAB3:    t1 = _iki_vhdl_event_callback((t0 + 624LL), t1, t3, t4);

LAB1:    return;

}


//SHA1: 44238978_4230300915_2162248465_1421174860_3389813570
extern void _execute_28(char *, char *);
extern void execute_28(char *, char *) _asm("_execute_28");
extern void execute_28(char *t0, char *t1)
{
    char t3[136];
    char t7[16];
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    char* dummy_clang_label = &&LAB0;


LAB0:    _iki_stmt_online(4194355U);
    if (_iki_vhdl_rising_edge((t1 + 40LL), 0U) != 0)
        goto LAB2;

LAB4:
LAB3:
LAB1:    return;

LAB2:    _iki_stmt_online(4194356U);
    t2 = (t0 + 2456LL);
    *((int *)((t3 + 104U))) = 1;
    *((char **)((t3 + 80U))) = ((*((char **)((t1 + 200LL)))) + (*((unsigned int *)((t1 + 208LL)))));
    t4 = (t3 + 88U);
    *((int *)((((t4 + 0LL)) + 0LL))) = 7;
    *((int *)((((t4 + 0LL)) + 4LL))) = 0;
    *((int *)((((t4 + 0LL)) + 12LL))) = (-1);
    *((unsigned int *)((((t4 + 0LL)) + 8LL))) = 8;
    t5 = _iki_std_logic_arith_unsigned_integer_plus(t0, t2, t3);
    t6 = (t3 + 64U);
    *((int *)((((t7 + 0LL)) + 0LL))) = 7;
    *((int *)((((t7 + 0LL)) + 4LL))) = 0;
    *((int *)((((t7 + 0LL)) + 12LL))) = (-1);
    *((unsigned int *)((((t7 + 0LL)) + 8LL))) = 8;
    t8 = _iki_vhdl_array_compare_size(t7, t6, 1U);
    _iki_std_memcpy((t1 + 440LL), t5, 8U);
    _iki_vhdl_schedule_transaction_signal_fast_setback0((t1 + 192LL), (t1 + 416LL), 8U);
    _iki_dpop(((*((unsigned int *)((t3 + 72U)))) * 1U));
    goto LAB3;

}


//SHA1: 4286534685_4048137496_2848962953_1940317551_3247563595
extern void _execute_29(char *, char *);
extern void execute_29(char *, char *) _asm("_execute_29");
extern void execute_29(char *t0, char *t1)
{
    char t3[120];
    char *t2;
    char *t4;
    char *t5;
    unsigned char t6;
    char* dummy_clang_label = &&LAB0;


LAB0:    _iki_stmt_online(4194363U);
    t2 = (t0 + 2456LL);
    *((char **)((t3 + 88U))) = ((*((char **)((t1 + 104LL)))) + (*((unsigned int *)((t1 + 112LL)))));
    t4 = (t3 + 96U);
    *((int *)((((t4 + 0LL)) + 0LL))) = 7;
    *((int *)((((t4 + 0LL)) + 4LL))) = 0;
    *((int *)((((t4 + 0LL)) + 12LL))) = (-1);
    *((unsigned int *)((((t4 + 0LL)) + 8LL))) = 8;
    *((char **)((t3 + 64U))) = ((*((char **)((t1 + 200LL)))) + (*((unsigned int *)((t1 + 208LL)))));
    t5 = (t3 + 72U);
    *((int *)((((t5 + 0LL)) + 0LL))) = 7;
    *((int *)((((t5 + 0LL)) + 4LL))) = 0;
    *((int *)((((t5 + 0LL)) + 12LL))) = (-1);
    *((unsigned int *)((((t5 + 0LL)) + 8LL))) = 8;
    t6 = _iki_std_logic_arith_unsigned_unsigned_is_less(t0, t2, t3);
    if (t6 != 0)
        goto LAB2;

LAB4:    _iki_stmt_online(4194366U);
    *((unsigned char *)((t1 + 600LL))) = (unsigned char)2;
    _iki_vhdl_schedule_transaction_signal_fast_setback0_size1((t1 + 232LL), (t1 + 576LL));

LAB3:
LAB1:    return;

LAB2:    _iki_stmt_online(4194364U);
    *((unsigned char *)((t1 + 600LL))) = (unsigned char)3;
    _iki_vhdl_schedule_transaction_signal_fast_setback0_size1((t1 + 232LL), (t1 + 576LL));
    goto LAB3;

}


//SHA1: 3206351777_2963844277_2165488193_3843290801_1414426554
extern void _execute_30(char *, char *);
extern void execute_30(char *, char *) _asm("_execute_30");
extern void execute_30(char *t0, char *t1)
{
    char* dummy_clang_label = &&LAB0;


LAB0:    _iki_stmt_online(4194370U);

LAB3:    *((unsigned char *)((t1 + 760LL))) = *((unsigned char *)(((*((char **)((t1 + 240LL)))) + (*((unsigned int *)((t1 + 248LL)))))));
    _iki_vhdl_schedule_transaction_signal_fast_setback0_size1((t1 + 136LL), (t1 + 736LL));

LAB2:
LAB1:    return;

LAB4:    goto LAB2;

}


//SHA1: 3924251401_2194694392_327048900_1322544359_1464056118
extern void _execute_31(char *, char *);
extern void execute_31(char *, char *) _asm("_execute_31");
extern void execute_31(char *t0, char *t1)
{
    char *t2;
    int64 t3;
    char* dummy_clang_label = &&LAB0;


LAB0:    t2 = *((char **)((((t1 + 200LL)) + 40LL)));
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    _iki_stmt_online(1048640U);
    *((unsigned char *)((t1 + 352LL))) = (unsigned char)2;
    _iki_vhdl_schedule_transaction_signal_fast_setback0_size1((t1 + 40LL), (t1 + 328LL));
    _iki_stmt_online(1048641U);
    t3 = (200000000000LL / 2);
    _iki_vhdl_wait((t1 + 200LL), t3);

LAB6:    *((char **)((((t1 + 200LL)) + 40LL))) = &&LAB7;

LAB1:    return;

LAB4:    _iki_stmt_online(1048642U);
    *((unsigned char *)((t1 + 352LL))) = (unsigned char)3;
    _iki_vhdl_schedule_transaction_signal_fast_setback0_size1((t1 + 40LL), (t1 + 328LL));
    _iki_stmt_online(1048643U);
    t3 = (200000000000LL / 2);
    _iki_vhdl_wait((t1 + 200LL), t3);

LAB10:    *((char **)((((t1 + 200LL)) + 40LL))) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}


//SHA1: 3863703430_551472551_624610433_2236939636_1666226682
extern void _execute_32(char *, char *);
extern void execute_32(char *, char *) _asm("_execute_32");
extern void execute_32(char *t0, char *t1)
{
    char *t2;
    char *t3;
    char* dummy_clang_label = &&LAB0;


LAB0:    t2 = *((char **)((((t1 + 360LL)) + 40LL)));
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    _iki_stmt_online(1048650U);
    t3 = (t0 + 5003LL);
    _iki_std_memcpy((t1 + 512LL), t3, 8U);
    _iki_vhdl_schedule_transaction_signal_fast_setback0((t1 + 96LL), (t1 + 488LL), 8U);
    _iki_stmt_online(1048651U);
    _iki_vhdl_wait((t1 + 360LL), 400000000000LL);

LAB6:    *((char **)((((t1 + 360LL)) + 40LL))) = &&LAB7;

LAB1:    return;

LAB4:    _iki_stmt_online(1048652U);
    t2 = (t0 + 5011LL);
    _iki_std_memcpy((t1 + 512LL), t2, 8U);
    _iki_vhdl_schedule_transaction_signal_fast_setback0((t1 + 96LL), (t1 + 488LL), 8U);
    _iki_stmt_online(1048653U);
    _iki_vhdl_wait((t1 + 360LL), 400000000000LL);

LAB10:    *((char **)((((t1 + 360LL)) + 40LL))) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    _iki_stmt_online(1048654U);
    t2 = (t0 + 5019LL);
    _iki_std_memcpy((t1 + 512LL), t2, 8U);
    _iki_vhdl_schedule_transaction_signal_fast_setback0((t1 + 96LL), (t1 + 488LL), 8U);
    _iki_stmt_online(1048655U);

LAB14:    *((char **)((((t1 + 360LL)) + 40LL))) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    goto LAB2;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

}

