set projDir "G:/Github/Mojo/GameNew/work/planAhead"
set projName "GameNew"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "G:/Github/Mojo/GameNew/work/verilog/mojo_top_0.v" "G:/Github/Mojo/GameNew/work/verilog/alu16_1.v" "G:/Github/Mojo/GameNew/work/verilog/problems_2.v" "G:/Github/Mojo/GameNew/work/verilog/reset_conditioner_3.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/button_4.v" "G:/Github/Mojo/GameNew/work/verilog/gameSelf_12.v" "G:/Github/Mojo/GameNew/work/verilog/multi_seven_segment_13.v" "G:/Github/Mojo/GameNew/work/verilog/multi_seven_segment_14.v" "G:/Github/Mojo/GameNew/work/verilog/multi_led_15.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/edge_detector_16.v" "G:/Github/Mojo/GameNew/work/verilog/randomGenerator_32.v" "G:/Github/Mojo/GameNew/work/verilog/counter_33.v" "G:/Github/Mojo/GameNew/work/verilog/seven_segment_decoder_34.v" "G:/Github/Mojo/GameNew/work/verilog/decoder_35.v" "G:/Github/Mojo/GameNew/work/verilog/counter_36.v" "G:/Github/Mojo/GameNew/work/verilog/seven_segment_decoder_34.v" "G:/Github/Mojo/GameNew/work/verilog/decoder_38.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led_39.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led_39.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led2_41.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led_39.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led_39.v" "G:/Github/Mojo/GameNew/work/verilog/pwm_led_39.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "G:/Github/Mojo/GameNew/constraint/fake_mojo.ucf" "G:/Github/Mojo/GameNew/constraint/led_control.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
