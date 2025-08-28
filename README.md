# 4-bit Ripple-Carry Adder – Sky130 / OpenLane

This repository contains the RTL, OpenLane configuration, signoff reports, and final layouts (GDS/MAG) for a 4-bit ripple-carry adder implemented using the SkyWater 130nm PDK.

## Repository Structure
- `hdl/` – RTL (`ripple_carry_adder_4bit.v`) and testbench (`tb_rca4.v`)  
- `openlane/` – `config.tcl`, final artifacts: `.gds`, `.mag`, `.lef`, `.lib`, `.sdf`, `.spef`, `.spice`, netlist  
- `reports/` – `metrics.csv`, STA (`31-rcx_sta.*.rpt`), LVS/DRC summaries, optional IR-drop  
- `figures/` – Layout screenshots from KLayout/Magic (**TODO: add PNGs here**)  
- `docs/` – Final report PDF (**TODO: add final report here**)  

## How to Simulate (Icarus Verilog)
```bash
iverilog -g2012 -o tb tb_rca4.v ripple_carry_adder_4bit.v
vvp tb


