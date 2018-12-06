set projDir "G:/Github/Mojo/game/work/planAhead"
set projName "game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "G:/Github/Mojo/game/work/verilog/mojo_top_0.v" "G:/Github/Mojo/game/work/verilog/reset_conditioner_1.v" "G:/Github/Mojo/game/work/verilog/beeper_2.v" "G:/Github/Mojo/game/work/verilog/multi_seven_segment_3.v" "G:/Github/Mojo/game/work/verilog/multi_led_4.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/button_5.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/gameSelf_15.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/counter_17.v" "G:/Github/Mojo/game/work/verilog/seven_segment_decoder_18.v" "G:/Github/Mojo/game/work/verilog/decoder_19.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/pwm_led_20.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/edge_detector_14.v" "G:/Github/Mojo/game/work/verilog/randomGenerator_44.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "G:/Github/Mojo/game/constraint/fake_mojo.ucf" "G:/Github/Mojo/game/constraint/led_control.ucf"]
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
