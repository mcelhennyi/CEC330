# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/CEC330/Lab_7/Lab_7.cache/wt [current_project]
set_property parent.project_path F:/CEC330/Lab_7/Lab_7.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  F:/CEC330/Lab_7/Lab_7.srcs/sources_1/new/SPI.vhd
  F:/CEC330/Lab_7/Lab_7.srcs/sources_1/new/Seven_seg_driver.vhd
  F:/CEC330/Lab_7/Lab_7.srcs/sources_1/new/Divider.vhd
  F:/CEC330/Lab_7/Lab_7.srcs/sources_1/new/Top_serial.vhd
}
read_xdc F:/CEC330/Lab_7/Lab_7.srcs/constrs_1/new/Master.xdc
set_property used_in_implementation false [get_files F:/CEC330/Lab_7/Lab_7.srcs/constrs_1/new/Master.xdc]

synth_design -top Top_serial -part xc7a100tcsg324-1
write_checkpoint -noxdef Top_serial.dcp
catch { report_utilization -file Top_serial_utilization_synth.rpt -pb Top_serial_utilization_synth.pb }
