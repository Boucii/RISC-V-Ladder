BUILD_DIR = ./build

VSRCS = $(shell find $(abspath ./genrtl) -name "*.v") $(shell find $(abspath ./vsrc) -name "*.v")
CSRCS = $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

CXXFLAGS += $(shell llvm-config-14 --cxxflags) 
CXXFLAGS += -g
CXXFLAGS += -O3

CXXFLAGS += -L$(NEMU_HOME)/build/
CXXFLAGS += -lriscv64-nemu-interpreter-so

LDFLAGS += -ldl
LDFLAGS += $(shell llvm-config-14 --ldflags) 
LDFLAGS += $(shell llvm-config-14 --libs all)
LDFLAGS +=-fsanitize=address

VERILATORFLAGS += -O3 --x-assign fast --x-initial fast --noassert

verilog:
	$(call git_commit, "generate verilog")
	sbt test:runMain Ladder.GenVerilog

genwave:
	verilator --cc --exe --trace --build -CFLAGS -g -Isim/ $(CSRCS) $(VSRCS)

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	verilator $(VERILATORFLAGS) --cc --exe --build --trace -CFLAGS "$(CXXFLAGS)" -LDFLAGS "$(LDFLAGS)" -Isim/ $(VSRCS) $(CSRCS)  --Mdir $(BUILD_DIR)/SimGen

wave:
	@echo $(IMAGE)
	./build/SimGen/VTOP $(IMAGE)
	#gtkwave wave.vcd

debug:
	#@echo "Hello from npc"
	@echo $(IMAGE)
	gdb  -tui --args ./build/SimGen/VTOP $(IMAGE) 

include ../Makefile
.PHONY: verilog genwave sim wave debug