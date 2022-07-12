# User config
set ::env(DESIGN_NAME) ExampleRocketSystem
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) {0.0 0.0 6937.49 6948.21}
set ::env(CORE_AREA) {5.52 10.88 6931.7 6935.04}
set ::env(FP_CORE_UTIL) 0.01

set ::env(CELL_PAD) 1

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.22

set ::env(GLB_RT_ADJUSTMENT) 0.15

#set ::env(PL_ROUTABILITY_DRIVEN) 1
#set ::env(SYNTH_STRATEGY) "AREA 0"
# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Fill this
set ::env(CLOCK_PERIOD) "30.0"
set ::env(CLOCK_PORT) "clock"
#set ::env(CLOCK_NET) "clock"
set ::env(DIODE_INSERTION_STRATEGY) {4}
#set ::env(GLB_RT_MAXLAYER)          5
#set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.2

#set ::env(GLB_RT_ADJUSTMENT) 0.25
#set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
#set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.2

#set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) 1
set ::env(SYNTH_MAX_FANOUT) 10

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

