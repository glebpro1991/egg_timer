# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.cache/wt} [current_project]
set_property parent.project_path {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {s:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/led_control.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/display_control.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/counter.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/clk_div.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/bin_to_7seg.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/bin2bcd_9bit.vhd}
  {S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/sources_1/new/egg_timer.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/constrs_1/imports/EE270_GroupProject/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{S:/My Classes/Year 2 semester 2/EE270/EE270_GroupProject/EE270_GroupProject.srcs/constrs_1/imports/EE270_GroupProject/Basys3_Master.xdc}}]


synth_design -top egg_timer -part xc7a35tcpg236-1


write_checkpoint -force -noxdef egg_timer.dcp

catch { report_utilization -file egg_timer_utilization_synth.rpt -pb egg_timer_utilization_synth.pb }