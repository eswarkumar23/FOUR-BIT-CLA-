# Compiler and output settings
VLOG = iverilog
VVP = vvp

# Source files
SRC = d_flip_flop.v four_bit_register.v four_bit_adder_cla.v tb_four_bit_adder_cla.v

# Simulation output
OUTPUT = simulation_output.vvp
VCD_FILE = waveform.vcd

# Default target to compile, simulate, and view
all: compile simulate view

# Compile target
compile:
	$(VLOG) -o $(OUTPUT) $(SRC)

# Run the simulation and generate a VCD file
simulate:
	$(VVP) $(OUTPUT)

# Open GTKWave to view the VCD file
view:
	gtkwave $(VCD_FILE)

# Clean up generated files
clean:
	rm -f $(OUTPUT) $(VCD_FILE)

# Phony targets
.PHONY: all compile simulate view clean
