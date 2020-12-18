
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name final_game_spac_invaders -dir "E:/digit_program/project_final/final_game_spac_invaders/planAhead_run_1" -part xc6slx9tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Game.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/img.ngc}]
set hdlfile [add_files [list {vga_testing.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/img.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Game.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Game $srcset
add_files [list {Game.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-3
