# Design and Simulation of a 4-bit Ripple-Carry Adder (RCA)  
**ECAM Brussels — Microelectronics Project (4eome4T)**  
**Student:** Diego de Radiguès  

📄 [Full Project Report (PDF)](docs/µelec_20342.pdf)  
🔗 [GitHub Repository](https://github.com/DiegoRadigues/rca4-openlane)

---

## Project Overview
This project presents the **design, simulation, and physical implementation** of a 4-bit Ripple-Carry Adder (RCA) using:
- **Verilog HDL** (RTL design + testbench)
- **NGSpice** (device-level transistor simulations)
- **OpenLane flow** with **SkyWater 130 nm PDK** (physical design and timing signoff)

The RCA is built hierarchically from 1-bit **full adder (FA)** cells, verifying functional correctness across all \(2^8 = 512\) input combinations.  
Beyond functional verification, we analyzed **timing, load capacitance effects, power consumption, and layout closure**.

---

## Repository Structure
- `hdl/` – RTL and testbench (`ripple_carry_adder_4bit.v`, `tb_ripple_carry_adder_4bit.v`)  
- `openlane/` – OpenLane configuration + final outputs (`.gds`, `.lef`, `.lib`, `.sdf`, `.spef`, `.spice`)  
- `reports/` – Signoff metrics (`metrics.csv`), STA reports, LVS/DRC logs  
- `figures/` – Layout screenshots (KLayout / Magic)  
- `docs/` – Project report (`µelec-7.pdf`)

---

## How to Simulate (RTL with Icarus Verilog)
```bash
# Compile
iverilog -g2012 -o tb tb_ripple_carry_adder_4bit.v ripple_carry_adder_4bit.v

# Run simulation + log output
vvp tb | tee sim_output.txt

# Open waveform (GTKWave)
gtkwave rca.vcd &
