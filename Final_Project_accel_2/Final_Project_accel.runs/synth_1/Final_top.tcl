# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/CEC330/Final_Project_accel_2/Final_Project_accel.cache/wt [current_project]
set_property parent.project_path F:/CEC330/Final_Project_accel_2/Final_Project_accel.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib {
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/SPI_TX.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Seven_seg_driver.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/SPI_state_clk.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/SPI_RX.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Divider.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Config_fsm.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Read_accel_fsm.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/ADXL362_com_fsm.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Angle_accel.vhd
  F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/sources_1/new/Final_top.vhd
}
read_xdc F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/constrs_1/new/Master.xdc
set_property used_in_implementation false [get_files F:/CEC330/Final_Project_accel_2/Final_Project_accel.srcs/constrs_1/new/Master.xdc]

synth_design -top Final_top -part xc7a100tcsg324-1
write_checkpoint -noxdef Final_top.dcp
catch { report_utilization -file Final_top_utilization_synth.rpt -pb Final_top_utilization_synth.pb }
