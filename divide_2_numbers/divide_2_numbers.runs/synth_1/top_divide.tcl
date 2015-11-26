# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Austin/Documents/CEC330_2/divide_2_numbers/divide_2_numbers.cache/wt [current_project]
set_property parent.project_path C:/Users/Austin/Documents/CEC330_2/divide_2_numbers/divide_2_numbers.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib C:/Users/Austin/Documents/CEC330_2/divide_2_numbers/divide_2_numbers.srcs/sources_1/new/top_divide.vhd
read_xdc C:/Users/Austin/Documents/CEC330_2/divide_2_numbers/divide_2_numbers.srcs/constrs_1/new/aebhre.xdc
set_property used_in_implementation false [get_files C:/Users/Austin/Documents/CEC330_2/divide_2_numbers/divide_2_numbers.srcs/constrs_1/new/aebhre.xdc]

synth_design -top top_divide -part xc7a100tcsg324-1
write_checkpoint -noxdef top_divide.dcp
catch { report_utilization -file top_divide_utilization_synth.rpt -pb top_divide_utilization_synth.pb }
