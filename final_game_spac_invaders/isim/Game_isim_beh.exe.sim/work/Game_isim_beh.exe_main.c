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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002411779389_3772395131_init();
    work_m_00000000003020705012_2837641632_init();
    work_m_00000000000995811138_3905206820_init();
    work_m_00000000001045217851_3558186419_init();
    work_m_00000000000018739325_3020747016_init();
    xilinxcorelib_ver_m_00000000001358910285_4001792319_init();
    xilinxcorelib_ver_m_00000000001358910285_3715724300_init();
    xilinxcorelib_ver_m_00000000001687936702_1767000102_init();
    xilinxcorelib_ver_m_00000000000277421008_2501414246_init();
    xilinxcorelib_ver_m_00000000001603977570_2883758918_init();
    work_m_00000000003869038185_1187360743_init();
    xilinxcorelib_ver_m_00000000001358910285_2062508410_init();
    xilinxcorelib_ver_m_00000000001358910285_2248652567_init();
    xilinxcorelib_ver_m_00000000001687936702_3869861341_init();
    xilinxcorelib_ver_m_00000000000277421008_0721143378_init();
    xilinxcorelib_ver_m_00000000001603977570_2552098593_init();
    work_m_00000000003869038185_3256419302_init();
    xilinxcorelib_ver_m_00000000001358910285_3028478444_init();
    xilinxcorelib_ver_m_00000000001358910285_2273123551_init();
    xilinxcorelib_ver_m_00000000001687936702_2690486219_init();
    xilinxcorelib_ver_m_00000000000277421008_2729343514_init();
    xilinxcorelib_ver_m_00000000001603977570_1097739245_init();
    work_m_00000000003869038185_2628149865_init();
    xilinxcorelib_ver_m_00000000000277421008_2233982657_init();
    xilinxcorelib_ver_m_00000000001603977570_1751079829_init();
    work_m_00000000003869038185_1923613509_init();
    xilinxcorelib_ver_m_00000000000277421008_2586078019_init();
    xilinxcorelib_ver_m_00000000001603977570_2884904024_init();
    work_m_00000000003869038185_0095368147_init();
    xilinxcorelib_ver_m_00000000000277421008_3168660824_init();
    xilinxcorelib_ver_m_00000000001603977570_2373650822_init();
    work_m_00000000003869038185_0223256786_init();
    xilinxcorelib_ver_m_00000000001358910285_1851106481_init();
    xilinxcorelib_ver_m_00000000001358910285_1571443074_init();
    xilinxcorelib_ver_m_00000000001687936702_2559047490_init();
    xilinxcorelib_ver_m_00000000000277421008_0999584666_init();
    xilinxcorelib_ver_m_00000000001603977570_0119840399_init();
    work_m_00000000003869038185_1971329757_init();
    work_m_00000000003440436662_0759158521_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003440436662_0759158521");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
