# User config
set ::env(DESIGN_NAME) ExampleRocketSystem
set ::env(FP_CORE_UTIL) 30

set ::env(CELL_PAD) 2

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.35

set ::env(GLB_RT_ADJUSTMENT) 0.2

set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(SYNTH_STRATEGY) "AREA 0"
# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Fill this
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clock"
set ::env(CLOCK_NET) "clock"
set ::env(DIODE_INSERTION_STRATEGY) 4
set ::env(GLB_RT_MAXLAYER)          5
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.2

set ::env(GLB_RT_ADJUSTMENT) 0.25
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.2

set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) 1
set ::env(SYNTH_MAX_FANOUT) 4

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

