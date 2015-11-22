# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.cache/wt [current_project]
set_property parent.project_path C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/Config_fsm.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/ADXL362_com_fsm.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/Divider.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/Read_accel_fsm.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/SPI_TX.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/SPI_RX.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/SPI_state_clk.vhd
  C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/sources_1/new/Final_top.vhd
}
read_xdc C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/constrs_1/new/Master.xdc
set_property used_in_implementation false [get_files C:/Users/Austin/Documents/CEC330_2/Final_Project_accel/Final_Project_accel.srcs/constrs_1/new/Master.xdc]

synth_design -top Final_top -part xc7a100tcsg324-1
write_checkpoint -noxdef Final_top.dcp
catch { report_utilization -file Final_top_utilization_synth.rpt -pb Final_top_utilization_synth.pb }
