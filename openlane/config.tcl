set ::env(DESIGN_NAME) "ripple_carry_adder_4bit"
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/src/ripple_carry_adder_4bit.v"

# Design combinatoire (pas d'horloge), mais OpenLane veut des contraintes
set ::env(CLOCK_PORT) ""
set ::env(CLOCK_PERIOD) "10"   ;# valeur fictive

# Un peu d'espace pour un petit design
set ::env(FP_CORE_UTIL) 20
set ::env(PL_TARGET_DENSITY) 0.50
