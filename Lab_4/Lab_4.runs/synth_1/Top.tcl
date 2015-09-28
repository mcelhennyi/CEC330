# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.cache/wt [current_project]
set_property parent.project_path C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/random.vhd
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/sequencer.vhd
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/Logic.vhd
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/Seven_seg_driver.vhd
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/Divider.vhd
  C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/sources_1/new/Top.vhd
}
read_xdc C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/constrs_1/new/master.xdc
set_property used_in_implementation false [get_files C:/Users/Austin/Documents/CEC330/Lab_4/Lab_4.srcs/constrs_1/new/master.xdc]

synth_design -top Top -part xc7a100tcsg324-1
write_checkpoint -noxdef Top.dcp
catch { report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb }
