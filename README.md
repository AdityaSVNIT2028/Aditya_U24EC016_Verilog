# Verilog Assignments 

This folder contains the Verilog assignment files and supporting testbenches. Each assignment is structured to make simulations and basic verification straightforward. This README explains the layout, how to run simulations, coding/testing conventions, and how to add new assignments.

## Repository location
Assignment folder: Assignment/

(If you open the repository on GitHub, each assignment should appear as a file or subfolder under `Assignment/`.)

## Overview
Each assignment delivered in this folder typically includes:
- Problem statement or short description (either in the file header or a small text/markdown file).
- Verilog source file(s) (`.v`).
- Testbench file(s) (`*_tb.v` or `tb_*.v`).
- Simulation script(s) or Makefile targets (when included).
- Waveform dump file(s) or instructions to produce waveforms.

The goal of these files is to demonstrate a working RTL design accompanied by a testbench that verifies functionality.

## How to run simulations (common approaches)

Below are simple, commonly used commands. Adjust filenames to match the files in the assignment you want to run.

1. Using Icarus Verilog (open-source)
- Compile:
  iverilog -g2012 -o sim_out <top_module_tb>.v <other_sources>.v
- Run:
  vvp sim_out
- View waveform (if the testbench creates a VCD):
  gtkwave <dumpfile.vcd>

Typical testbench includes:
```verilog
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, <top_module_tb>);
  // stimulus...
end
```

2. Using ModelSim / Questa
- Compile:
  vlog <files>
- Simulate:
  vsim <tb_top>
- Run commands, and use `view wave` to inspect signals.

3. Vivado (for simulation or synthesis)
- Use Vivado’s simulator (isim/xsim) or run simulation through the IDE/CLI.

4. Makefile (if present)
- Common targets:
  make sim      # compile + run simulation
  make wave     # produce VCD and open waveform viewer
  make clean    # remove build artifacts

## File / Naming conventions
- Source modules: module_name.v
- Testbenches: module_name_tb.v or tb_module_name.v
- Waveform dumps: dump.vcd (or module_name.vcd)
- Synthesis/constraint files (if provided): module_name.xdc or module_name.sdc
- Keep one top-level module per assignment for clarity.

## Recommended coding & testbench style
- Use `timescale` directive at top of files (e.g., `\`timescale 1ns/1ps`).
- Parameterize widths using `parameter` to make reuse easier.
- Use synchronous resets and explicit clock generation in testbenches.
- Avoid inferred latches unless intended; prefer fully specified combinational logic or registered outputs.
- Comment modules with a brief description, inputs/outputs, and brief behavior summary.

Testbench tips:
- Provide deterministic stimulus (vectors) and include at least one randomized test if possible.
- Use `$display` and `$monitor` for debug prints, and assert statements or checks to auto-fail tests on unexpected behavior.
- Use `$dumpfile` / `$dumpvars` for waveform capture.

## Verification & grading checklist (suitable for assignment TAs or students)
- Does the testbench instantiate the DUT correctly?
- Are all primary functional cases covered by the test vectors?
- Is the waveform produced and verifiable (VCD/GTKWave)?
- Are corner cases and reset/start conditions tested?
- Does the design synthesize cleanly (if synthesis is required)?

## Synthesis & FPGA notes
- If an assignment targets an FPGA:
  - Provide a constraints file (pinout .xdc for Xilinx) if available.
  - Note clock frequency assumptions and reset polarity.
  - Avoid constructs that are unsupported by synthesis tools (e.g., system tasks).
- When moving to synthesis flows (Vivado/Quartus), test for timing and resource usage separately.

## How to add a new assignment (recommended template)
Create a folder or a grouped set of files:
- assignment_name/
  - README.md (problem statement and instructions)
  - assignment_name.v (RTL)
  - assignment_name_tb.v (testbench)
  - sim.do or Makefile (optional simulation helper)
  - example_waveform.vcd (optional expected waveform)
- Document run steps in the assignment README and show expected inputs/outputs.

## Troubleshooting
- If simulation fails to run, ensure:
  - Testbench top module name matches the simulation command.
  - All required source files are compiled in the invocation.
  - `timescale` macro is present if using delays in testbench.
- If no waveform is generated, add or check `$dumpfile` / `$dumpvars` calls in the testbench.

## Tools & references
- Xilinx Vivado
- EDA Playfround

## Contribution & contact
Author: Aditya (AdityaSVNIT2028)
If you want to add or improve an assignment, follow the “How to add a new assignment” template and open a PR against the repository. Include clear instructions and expected outputs.

## License
Check repository root for license details. If none exists, indicate licensing in your assignment folder when adding new content.
