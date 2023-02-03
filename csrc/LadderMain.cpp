#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <iomanip>
#include<sys/time.h>
#include <assert.h>
#include <string>
#include <dlfcn.h>
#include "VTOP.h"
#include "verilated_vcd_c.h"
#include "verilated_dpi.h"
#include "log.h"
#include "memory.h"
//#include <verilated.h>
//#include <svdpi.h>
#include "VTOP__Dpi.h"

#define DIFFTEST_EN 0
#define ITRACE_EN 0
#define MAX_TIME 10000000
#define RESET_VECTOR 0x80000000

#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */
#define GREEN   "\033[32m"      /* Green */
#define YELLOW  "\033[33m"      /* Yellow */
#define BLUE    "\033[34m"      /* Blue */
#define MAGENTA "\033[35m"      /* Magenta */
#define CYAN    "\033[36m"      /* Cyan */
#define WHITE   "\033[37m"      /* White */
#define BOLDBLACK   "\033[1m\033[30m"      /* Bold Black */
#define BOLDRED     "\033[1m\033[31m"      /* Bold Red */
#define BOLDGREEN   "\033[1m\033[32m"      /* Bold Green */
#define BOLDYELLOW  "\033[1m\033[33m"      /* Bold Yellow */
#define BOLDBLUE    "\033[1m\033[34m"      /* Bold Blue */
#define BOLDMAGENTA "\033[1m\033[35m"      /* Bold Magenta */
#define BOLDCYAN    "\033[1m\033[36m"      /* Bold Cyan */
#define BOLDWHITE   "\033[1m\033[37m"      /* Bold White */

using namespace std;

//---------------Some Global Variables--------------
extern uint8_t *mem;
uint64_t img_size=0;

uint64_t *cpu_gpr = NULL;
uint64_t ref_gpr[33];
uint32_t *pc_cmt1 = NULL;
uint32_t *pc_cmt2 = NULL;

struct timeval timeus;

bool mem_done=0;
bool diff_pass=0;

#define RTC_PORT_BASE 0x48
#define SERIAL_PORT_BASE 0x3f8

//----------------Memory Management------------------
extern uint64_t pmem_read(int addr);
extern int pmem_write(uint64_t content,uint64_t addr,uint32_t len);
extern int free_memory();
long load_img(char **argv);
//----------------Disasm Module--------------------
extern int init_disasm(const char *triple);
extern void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
//----------------Difftest Module------------------
enum { DIFFTEST_TO_DUT, DIFFTEST_TO_REF };
void (*ref_difftest_memcpy)(uint32_t addr, void *buf, size_t n, bool direction) = NULL;
void (*ref_difftest_regcpy)(void *dut, bool direction) = NULL;
void (*ref_difftest_exec)(uint64_t n) = NULL;
void (*ref_difftest_raise_intr)(uint64_t NO) = NULL;

void init_difftest() {
  char ref_so_file[]="/home/mint/ysyx-workbench/nemu/build/riscv64-nemu-interpreter-so";
  assert(ref_so_file != NULL);

  void *handle;
  handle = dlopen(ref_so_file, RTLD_LAZY);
  assert(handle);

  ref_difftest_memcpy = (void (*)(uint32_t addr, void *buf, size_t n, bool direction))dlsym(handle, "difftest_memcpy");
  assert(ref_difftest_memcpy);

  ref_difftest_regcpy = (void (*)(void *dut, bool direction))(dlsym(handle, "difftest_regcpy"));
  //ref_difftest_regcpy = dlsym(handle, "difftest_regcpy");
  assert(ref_difftest_regcpy);

  ref_difftest_exec = (void (*)(uint64_t n))(dlsym(handle, "difftest_exec"));
  //ref_difftest_exec = dlsym(handle, "difftest_exec");
  assert(ref_difftest_exec);

  ref_difftest_raise_intr = (void (*)(uint64_t NO))(dlsym(handle, "difftest_raise_intr"));
  //ref_difftest_raise_intr = dlsym(handle, "difftest_raise_intr");
  assert(ref_difftest_raise_intr);

  void (*ref_difftest_init)(int) = (void (*)(int))dlsym(handle, "difftest_init");
  assert(ref_difftest_init);

  ref_difftest_init(0);
  ref_difftest_memcpy(RESET_VECTOR,mem, img_size, DIFFTEST_TO_REF);
  ref_difftest_regcpy(cpu_gpr, DIFFTEST_TO_REF);
}

void diff_check_regs(){
	diff_pass=1;
	for(int i=0;i<32;i++){
	  if(ref_gpr[i]!=cpu_gpr[i]){
	      cout<<hex<<"\nError:Difftest failed at pc=0x"<<*pc<<"	"<<dec<<"in reg["<<i<<"]\n";
	      cout<<hex<<"cpu_gpr="<<GREEN<<cpu_gpr[i]<<RESET<<"	and ref ="<<BOLDGREEN<<ref_gpr[i]<<dec<<RESET<<endl;
	      diff_pass=0;
	      return;
	  }
	  if(ref_gpr[32]!=*pc){
	      cout<<hex<<RED<<"pc error! pc="<<GREEN<<*pc<<RESET<<"	and ref ="<<BOLDGREEN<<ref_gpr[32]<<dec<<RESET<<endl;
	      diff_pass=0;
	      return;
	  }
	  
	}
}

void difftest_exec_once(){
	ref_difftest_exec(1);
	ref_difftest_regcpy(ref_gpr,DIFFTEST_TO_DUT);
	diff_check_regs();
}
//----------------DPI-C functions------------------ 
extern svBit Check();
const svOpenArrayHandle r=NULL;
extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
  cpu_gpr = (uint64_t *)(((VerilatedDpiOpenVar*)r)->datap());
}

void dump_gpr() {
  int i;
  for (i = 0; i < 32; i++) {
    printf("gpr[%d] = 0x%lx\n", i, cpu_gpr[i]);
  }
}
extern "C" void pmem_read_dpi(long long raddr, long long *rdata) {
 // cout<<BOLDCYAN<<hex<<endl<<"raddr is "<<raddr<<endl<<"rdata is "<<*rdata<<RESET<<endl;
  if(mem_done==0){
	if(raddr==RTC_PORT_BASE){
  		gettimeofday(&timeus,NULL);
  		*rdata=(uint32_t)(timeus.tv_sec*1000000+timeus.tv_usec);
		mem_done=1;
		return;
	}
	if(raddr==RTC_PORT_BASE+4){
  		gettimeofday(&timeus,NULL);
  		*rdata=(uint32_t)((timeus.tv_sec*1000000+timeus.tv_usec)>>32);
		mem_done=1;
		return;
	}
  	*rdata=pmem_read((int)raddr);//it should be uint i think , but lets keep it this way and change when fail
  	mem_done=1;
  }
}
extern "C" void pmem_write_dpi(long long waddr, long long wdata, char wmask) {
  if(mem_done==0){
	  if(waddr==SERIAL_PORT_BASE){
		char a=(char)wdata;
	  	cout<<BOLDGREEN<<a<<RESET;
	        mem_done=1;
		return;
	  }
	uint8_t mask=(uint8_t)wmask;
	if(mask==0){

	}else if(mask==1){
	  pmem_write(wdata,waddr,1);
	}else if(mask==3){
	  pmem_write(wdata,waddr,2);
	}else if(mask==7){
	  pmem_write(wdata,waddr,3);
        }else if(mask==15){
          pmem_write(wdata,waddr,4);
	}else if(mask==255){
	  pmem_write(wdata,waddr,8);
	}
	else{
	  cout<<"invalid pmem write, and here goes assert0"<<endl;
	  assert(0);
	}
	mem_done=1;
  }
}
//-----------------Log Module------------------------
char logbuf[50]="\0";

//----------------Verilator component----------------
static VTOP* top;
VerilatedVcdC* tfp=NULL;
VerilatedContext* contextp=NULL;
void dumpwave(){
    tfp->dump(contextp->time()); //dump wav
    contextp->timeInc(1); //推动仿真时间
}
void single_cycle() {
    top->clock = 1; top->eval(); 
    dumpwave();
    top->clock = 0; top->eval();
    dumpwave();
}
void single_cycleup() {
    mem_done=0;
    top->clock = 0; top->eval(); 
    dumpwave();
}
void single_cycledown() {
    top->clock = 1; 
    top->eval();
    dumpwave();
}

void reset(int n) {
	  top->reset = 1;
	    while (n -- > 0) single_cycle();
	      top->reset = 0;
}

//----------main------------------

int main(int argc, char** argv, char** env){
  //cout<<"argvs:"<<argv[0]<<argv[1]<<endl;
  contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  top= new VTOP{contextp};
  
  //set scope for dpi-c function  
  Verilated::scopesDump();
  const svScope scope = svGetScopeFromName("TOP.npc_ctl");
  assert(scope);  // Check for nullptr if scope not found
  svSetScope(scope);

  contextp->traceEverOn(true); //打开追踪功能
  tfp = new VerilatedVcdC; //初始化VCD对象指针
  top->trace(tfp, 0); //
  tfp->open("wave.vcd"); //设置输出的文件wave.vcd


  int time=0;
  LogInit();
  mem_init();
  load_img(argv);

  reset(10);

  if(ITRACE_EN){
      init_disasm("riscv64-pc-linux-gnu");
  }

  if(DIFFTEST_EN){
      init_difftest();
  }
  if(ITRACE_EN){
      cout<<"\nstart simulating\n";
  }
  dumpwave();


  uint32_t addr_if1=0;
  uint32_t addr_if2=0;
  uint32_t addr_if3=0;

  pc=&addr_if1;

  //while (time<MAX_TIME) {
  while (true) {
    if(ITRACE_EN){
        cout<<"\ncycle "<<time<<" passed\n";
    }
    //instruction fetch
    addr_if3 = addr_if2;
    addr_if2 = addr_if1;
    addr_if1=(int)(top->io_InstAddr);
    uint32_t cur_inst = (uint32_t)pmem_read(addr_if1);
    uint32_t cur_inst2 = (uint32_t)pmem_read(addr_if1+4);
    top->io_InstIn =(uint64_t)cur_inst+((uint64_t)cur_inst2<<32);

    //memory read/write
    single_cycleup();
    single_cycledown();
    
    //check for trap
    if(Check()){
      cout<<"HIT GOOD TRAP"<<endl;
      break;  
    }
    //写reg在下一个周期才发生
    if(DIFFTEST_EN){
        if(top->dbg_commit_packs0_valid){
          difftest_exec_once();
          pc_cmt1 = top->dbg_commit_packs0->pc;
          log(****);
        }
        if(top->dbg_commit_packs1_valid && diff_pass){
          difftest_exec_once();
          pc_cmt2 = top->dbg_commit_packs1->pc;
          log(****);
        }
	if(diff_pass==0){
		cout<<"\n\n";
		cout<<BOLDRED<<"------------DIFF FAILED------------"<<RESET<<endl;
                cout<<"0x"<<fixed << setw(8) << setfill('0')<<hex<<cur_inst<<dec<<"	"<<BOLDYELLOW<<temp<<RESET<<endl;
	        assert(0);
	}
    }
    time++;
  }
  if(time==MAX_TIME){
      cout<<"HIT BAD TRAP"<<endl;
  }
  //dump_gpr();
  cout<<"simulation over\n";
  delete top;
  delete contextp;
  tfp->close();
  return 0;
}