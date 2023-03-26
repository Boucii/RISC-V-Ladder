BUILD_DIR = ./build

VSRCS = $(shell find $(abspath ./genrtl) -name "*.v") $(shell find $(abspath ./vsrc) -name "*.v")
CSRCS = $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

CXXFLAGS += $(shell llvm-config-14 --cxxflags) 
CXXFLAGS += -g
CXXFLAGS += -O3
CXXFLAGS += -fsanitize=address
CXXFLAGS += -DVL_THREADED

CXXFLAGS += -L$(NEMU_HOME)/build/
CXXFLAGS += -lriscv64-nemu-interpreter-so

LDFLAGS += -ldl
LDFLAGS += $(shell llvm-config-14 --ldflags) 
LDFLAGS += $(shell llvm-config-14 --libs all)
LDFLAGS +=-fsanitize=address
LDFLAGS +=-L$(NEMU_HOME)/build/
LDFLAGS += -lSDL2 

VERILATORFLAGS += -O3 --x-assign fast --x-initial fast --noassert --inline-mult 50000
VERILATORFLAGS += --threads 2 -Wno-UNOPTTHREADS 
#--threads-dpi none
#--trace-depth 3 --instr-count-dpi 300
#VERILATORFLAGS += -Wwarn-WIDTH

verilog:
	$(call git_commit, "generate verilog")
	sbt "test:runMain Ladder.GenVerilog "
	#--Wall --Werror" #-Werror=silent-truncation
	#sbt "Test/runMain Ladder.Genverilog"
	make sim

genwave:
	verilator --cc --exe --trace --build -CFLAGS -g -Isim/ $(CSRCS) $(VSRCS)

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	verilator $(VERILATORFLAGS) --cc --exe -j 14  --build --top-module Ladder  -CFLAGS "$(CXXFLAGS)" -LDFLAGS "$(LDFLAGS)" -I./genrtl/ $(VSRCS) $(CSRCS)  --Mdir $(BUILD_DIR)
	#verilator $(VERILATORFLAGS) --cc --exe -j 14  --build --trace --top-module Ladder  -CFLAGS "$(CXXFLAGS)" -LDFLAGS "$(LDFLAGS)" -I./genrtl/ $(VSRCS) $(CSRCS)  --Mdir $(BUILD_DIR)

wave:
	@echo $(IMAGE)
	./build/VLadder $(IMAGE)
	#gtkwave wave.vcd

debug:
	#@echo "Hello from npc"
	@echo $(IMAGE)
	gdb  -tui --args ./build/VLadder $(IMAGE)

gtk:
	gtkwave wave.vcd

clean:
	rm -r build/
	rm -r genrtl/

include ../Makefile
.PHONY: verilog genwave sim wave debug gtk clean
