#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <iomanip>
#include<sys/time.h>
#include <assert.h>
#include <string>
#include <dlfcn.h>
#include <mutex>
#include "VLadder.h"
#include "verilated_vcd_c.h"
#include "verilated_dpi.h"
#include "log.h"
#include "memory.h"
#include "devices.h"
//#include <verilated.h>
//#include <svdpi.h>
#include "VLadder__Dpi.h"

//#define GTK_EN_CYC  47900000//47800000//27100000 //2400000
uint64_t GTK_EN_CYC = 1;
#define DIFFTEST_EN 1
#define ITRACE_EN 0
//#define GTK_EN 1
int GTK_EN = 0;
#define LOG_EN 0
#define MAX_TIME 1000000000//10000000
//#define MAX_TIME 300000
#define RESET_VECTOR 0x80000000
#define COMMIT_TIME_OUT 1500
#define MAX_WAVE_CYC 100000
#define SCRN_H 300
#define SCRN_W 400

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
extern char *vmem;
       
extern uint8_t *vga_sync;

uint64_t *cpu_gpr = NULL;
uint64_t last_ref_gpr[32] = {0}; 
uint64_t ref_gpr[33];
uint64_t *pc_cmt1 = new uint64_t;
uint64_t *pc_cmt2 = new uint64_t;
uint64_t *pc = new uint64_t;
uint64_t *last_ref_pc = new uint64_t;
int stop=0;

int cyc_time=0;
int last_skip_for_mem = 0;
int cyc_do_not_have_commit =0;
int wave_cycle = 0;

struct timeval timeus;

bool mem_done=0;
bool diff_pass=1;

#define RTC_PORT_BASE 		0xa0000048
#define SERIAL_PORT_BASE 	0xa00003f8
#define KBD_PORT_BASE 		0xa0000060
#define VGA_CTL_BASE 		0xa0000100

mutex mem_lock;

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
  //char ref_so_file[]="/home/mint/ysyx-workbench/nemu/build/riscv64-nemu-interpreter-so";
  //char ref_so_file[]="~/ysyx-workbench/nemu/build/riscv64-nemu-interpreter-so";
  char ref_so_file[]="/home/qin/ysyx-workbench/nemu/build/riscv64-nemu-interpreter-so";
  assert(ref_so_file != NULL);

  dlerror();
  volatile char *error;

  void *handle;
  handle = dlopen(ref_so_file, RTLD_LAZY);
 // assert(handle);
   if ((error = dlerror()) != NULL)  {
        fprintf(stderr, "%s\n", error);
        exit(EXIT_FAILURE);
    }
        if (!handle) {  
            printf ("%s", dlerror());  
	    assert(handle);
        } 

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
	  if(*last_ref_pc!=*pc){
	      cout<<hex<<RED<<"pc error! pc="<<GREEN<<*pc<<RESET<<"	and ref ="<<BOLDGREEN<<*last_ref_pc<<dec<<RESET<<endl;
	      diff_pass=0;
	      return;
	  }
	
	for(int i=0;i<32;i++){
	  if(ref_gpr[i]!=cpu_gpr[i]){
	      cout<<hex<<"\nError:Difftest failed at pc=0x"<< *pc<<"	"<<dec<<"in reg["<<i<<"]\n";
	      cout<<hex<<"cpu_gpr=0x"<<GREEN<<cpu_gpr[i]<<RESET<<"	and ref =0x"<<BOLDGREEN<<ref_gpr[i]<<dec<<RESET<<endl;
	      diff_pass=0;
	      return;
	  }
	}
}

void difftest_exec_once(){
	*last_ref_pc = ref_gpr[32];
	ref_difftest_exec(1);
	ref_difftest_regcpy(ref_gpr,DIFFTEST_TO_DUT);

	  for(int i=0;i<32;i++){
	  	last_ref_gpr[i] = ref_gpr[i];
	  }

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
	bool uncache = (raddr==(RTC_PORT_BASE+8))||(raddr==(RTC_PORT_BASE+12))||(raddr==(KBD_PORT_BASE+8))||
	  (raddr==(VGA_CTL_BASE+8))||(raddr==(VGA_CTL_BASE+10))||(raddr==(VGA_CTL_BASE+12));//||(raddr=(0xa1000004+SCRN_W*SCRN_H*4));
	    if(uncache){
	//printf("uncache1!!!!!addris=%llx \n",raddr);
	*rdata=0;
	return;
  }
  mem_lock.lock();
  //cout<<"memread "<<hex<<raddr<<endl;
  //if(mem_done==0){
  if(1){
  //cout<<"memread "<<hex<<raddr<<endl;
	if(raddr==RTC_PORT_BASE){
		//printf("reading the rtc\n");
		last_skip_for_mem = 1;
  		gettimeofday(&timeus,NULL);
  		*rdata=(uint32_t)(timeus.tv_sec*1000000+timeus.tv_usec);
		mem_done=1;
	mem_lock.unlock();
		return;
	}
	if(raddr==RTC_PORT_BASE+4){
		//printf("reading the rtc+4\n");
		last_skip_for_mem = 1;
  		gettimeofday(&timeus,NULL);
  		*rdata=(uint32_t)((timeus.tv_sec*1000000+timeus.tv_usec)>>32);
		mem_done=1;
	mem_lock.unlock();
		return;
	}
    if(raddr == KBD_PORT_BASE){
		last_skip_for_mem = 1;
      	kbd_update();
      	//printf("reading kbd\n");
		*rdata = key_dequeue();
		mem_done=1;
	mem_lock.unlock();
      	return;
    }
	if(raddr == VGA_CTL_BASE){
			last_skip_for_mem = 1;
			*rdata = (SCRN_H+(SCRN_W<<16));
	mem_lock.unlock();
			return; 
	}
	if(raddr == (VGA_CTL_BASE+2)){
			last_skip_for_mem = 1;
			*rdata = (SCRN_H+(SCRN_W<<16))>>16+(*vga_sync<<16);
	mem_lock.unlock();
			return; 
	}

	if(raddr == (VGA_CTL_BASE+4)){
			last_skip_for_mem = 1;
			*rdata = *vga_sync;
	mem_lock.unlock();
			return;
	}
	if((raddr>=0xa1000000)&&(raddr<=(0xa1000000+SCRN_W*SCRN_H*4))){
		//cout<<"memread "<<hex<<raddr<<endl;
      		last_skip_for_mem =1;
			*rdata = vmem[raddr-0xa1000000];
	mem_lock.unlock();
			return;
    }
	//instruction fetch
	//this is for possible inst fetch on a mispredicted path that will
	//later be flushed, so it's fine.
	if(raddr<0x80000000){
		*rdata = 0;
		cout<<"inst fetch out of bound, be mindful! addr="<<hex<<raddr<<endl;
  		mem_done=1;
	mem_lock.unlock();
		return;
	}
  *rdata=pmem_read((int)raddr);//it should be uint i think , but lets keep it this way and change when fail
  if(ITRACE_EN){
  	cout<<BOLDCYAN<<hex<<endl<<"memr, raddr is "<<raddr<<endl<<"rdata is "<<*rdata<<RESET<<endl;
  }
  	mem_done=1;
	mem_lock.unlock();
  }
}
extern "C" void pmem_write_dpi(long long waddr, long long wdata, char wmask) {
  mem_lock.lock();
  if(waddr<0x80000000){
 	cout<<RED<<"memwrite illegally on "<<hex<<waddr<<RESET<<endl;
 	cout<<RED<<"memwrite illegally on "<<hex<<waddr<<RESET<<endl;
 	cout<<RED<<"memwrite illegally on "<<hex<<waddr<<RESET<<endl;
 	cout<<RED<<"memwrite illegally on "<<hex<<waddr<<RESET<<endl;
 	cout<<RED<<"memwrite illegally on "<<hex<<waddr<<RESET<<endl;
	mem_lock.unlock();
	return;
  }
  volatile char mask=wmask;
  if(ITRACE_EN){
  	cout<<BOLDCYAN<<hex<<endl<<"mem write, waddr is "<<waddr<<endl<<"wdata is "<<wdata<<" mask is"<<(uint8_t)wmask<<RESET<<endl;
  }
  if(1){
	  if(waddr==SERIAL_PORT_BASE){
		char a=(char)wdata;
	  	cout<<BOLDGREEN<<a<<RESET;
	    mem_done=1;
		mem_lock.unlock();
		return;
	  }
  	  if((waddr>=0xa1000000)&&(waddr<=(0xa1000000+SCRN_H*SCRN_W*4))){
			  static int ss=0;
			  ss++;
			  printf("mem,ss=%d\n",ss);
		int len=0;
		if((uint8_t)wmask==0){
				len =0;
		}else if((uint8_t)wmask==1){
				len =1;
		}else if((uint8_t)wmask==3){
				len=2;
		}else if((uint8_t)wmask==7){
				len=3;
    	}else if((uint8_t)wmask==15){
				len =4;
		}else if((uint8_t)wmask==255){
				len =8;
		}
  	    for (int i = 0;i<len;i++){
  	        vmem[waddr+i-0xa1000000] = wdata;
  	        wdata = wdata>>8;
  	    }
	        mem_done=1;
		mem_lock.unlock();
  	    return;
  	  }  
  	  if((waddr==(VGA_CTL_BASE+4))){
  	      *vga_sync = wdata;
  	      if(wdata==1){
				cout<<"!!!!\n";
				cout<<"!!!!\n";
				cout<<"!!!!\n";
				cout<<"!!!!\n";
  	        update_screen();
  	      }
	      mem_done=1;
		  mem_lock.unlock();
		  return;
  	  }
	uint8_t mask=(uint8_t)wmask;
	if(mask==0){
	  //cout<<"mask=0"<<endl;
	}else if(mask==1){
	  pmem_write(wdata,waddr,1);
	  //cout<<"mask=1"<<endl;
	}else if(mask==3){
	  pmem_write(wdata,waddr,2);
	  //cout<<"mask=2"<<endl;
	}else if(mask==7){
	  //cout<<"mask=7"<<endl;
	  pmem_write(wdata,waddr,3);
    }else if(mask==15){
	  //cout<<"mask=15"<<endl;
      pmem_write(wdata,waddr,4);
	}else if(mask==255){
	//cout<<"mask=255"<<endl;
	  pmem_write(wdata,waddr,8);
	}
	else{
	  cout<<"invalid pmem write, and here goes assert0"<<endl;
	  assert(0);
	}
	mem_done=1;
	mem_lock.unlock();
  }
}
//----------------Verilator component----------------
static VLadder* top;
VerilatedVcdC* tfp=NULL;
VerilatedContext* contextp=NULL;
void dumpwave(){
		if(GTK_EN && cyc_time>GTK_EN_CYC &&GTK_EN_CYC>=0){
    		tfp->dump(contextp->time()); //dump wav
    		contextp->timeInc(1); //推动仿真时间
		}
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
	    while (n -- > 0){
			single_cycle();
			cyc_time++;
		} 
	      top->reset = 0;
}
//-----------------Log Module------------------------
char logbuf[50]="\0";
void log_inst_commit(int commit_pack_idx){
  if(commit_pack_idx == 0){
    char hex_string[50];
      *pc_cmt1 = top-> io_o_dbg_commit_packs_0_uop_pc;
      *pc = *pc_cmt1;
      sprintf(hex_string, "%lX", *pc_cmt1); 
      string temp1(hex_string);
	  if(LOG_EN){
      	Log("0x");
      	Log(temp1);
      	Log(":	");
	  }
    uint32_t cur_inst = top->io_o_dbg_commit_packs_0_uop_inst;
    uint8_t *instaddr=(uint8_t *)&cur_inst;
    //uint64_t addrin=(uint64_t)((uint64_t)*pc_cmt1)-(uint64_t)0xffffffff00000000;
    uint64_t addrin=(uint64_t)((uint64_t)*pc_cmt1);
    if(ITRACE_EN){
        disassemble(logbuf, 50, addrin, instaddr, 4);//50?
    }
    string temp=logbuf;
    if(LOG_EN){
    	Log(temp);
    	Log("\n");
	}
    if(ITRACE_EN){
        cout<<YELLOW<<"PC=0x"<<hex<<*pc_cmt1<<RESET<<dec<<endl;                                                   
        cout<<"0x"<<fixed << setw(8) << setfill('0')<<hex<<cur_inst<<dec<<"	"<<BOLDYELLOW<<RESET<<endl;//temp<<RESET<<endl; 
    }
  }else if(commit_pack_idx == 1){
      char hex_string[50];
      *pc_cmt2 = top->io_o_dbg_commit_packs_1_uop_pc;
      *pc = *pc_cmt2;
      sprintf(hex_string, "%lX", *pc_cmt2); 
      string temp1(hex_string);
    if(LOG_EN){
      	Log("0x");
      	Log(temp1);
      	Log(":	");
	}
    uint32_t cur_inst = top->io_o_dbg_commit_packs_1_uop_inst;
    uint8_t *instaddr=(uint8_t *)&cur_inst;
    uint64_t addrin=(uint64_t)((uint64_t)*pc_cmt2)-(uint64_t)0xffffffff00000000;
    if(ITRACE_EN){
        disassemble(logbuf, 50, addrin, instaddr, 4);//50?
    }
    string temp=logbuf;
	if(LOG_EN){
    	Log(temp);
    	Log("\n");
	}
    if(ITRACE_EN){
        cout<<YELLOW<<"PC=0x"<<hex<<*pc_cmt2<<RESET<<dec<<endl;                                                   
        cout<<"0x"<<fixed << setw(8) << setfill('0')<<hex<<cur_inst<<dec<<"	"<<BOLDYELLOW<<temp<<RESET<<endl; 
    }
  }
}
//----------main------------------

int main(int argc, char** argv, char** env){
  //cout<<"argvs:"<<argv[0]<<argv[1]<<endl;
  *pc = RESET_VECTOR;
  *last_ref_pc = *pc;
  contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  top= new VLadder{contextp};
  
  //set scope for dpi-c function  
  //the next line is necessary for dbgging!
  //Verilated::scopesDump();
  const svScope scope = svGetScopeFromName("TOP.Ladder.dpic");
  assert(scope);  // Check for nullptr if scope not found
  svSetScope(scope);

  contextp->traceEverOn(true); //打开追踪功能
  free(tfp);
  tfp = new VerilatedVcdC; //初始化VCD对象指针
  top->trace(tfp, 0); //
  tfp->open("wave.vcd"); //设置输出的文件wave.vcd


  //int time=0;
  if(LOG_EN){
  	LogInit();
  }
  mem_init();
  load_img(argv);
  init_keymap();
  init_screen();

  dumpwave();
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
  int first_cycle = 1;
  cyc_do_not_have_commit =0;
  float IPC=0;
  int commit_inst_count=0;
  while (cyc_time<MAX_TIME && !(cyc_do_not_have_commit>COMMIT_TIME_OUT)) {
	wave_cycle++;
	if(wave_cycle>=MAX_WAVE_CYC && GTK_EN && cyc_time>GTK_EN_CYC &&GTK_EN_CYC>=0){
		wave_cycle=0;
		if(!remove("/home/qin/ysyx-workbench/npc/wave.vcd")){
			cout<<RED<<"remove unsuccessful!\n"<<reset<<endl;
		}
  	tfp = new VerilatedVcdC; //初始化VCD对象指针
  	top->trace(tfp, 0); //
  	tfp->open("wave.vcd"); //设置输出的文件wave.vcd
	}
	if(cyc_time%100000==0){
		string cmd = "";
		cout<<"cmd="<<cmd;
		if(cmd=="on"){
			cout<<BOLDGREEN<<"\n\nturning on wavefrom now!\n\n"<<reset;
			GTK_EN = 1;
			GTK_EN_CYC = 1;
		}
		if(cmd=="off"){
			cout<<BOLDGREEN<<"\n\nturning off wavefrom now!\n\n"<<reset;
			GTK_EN = 0;
			GTK_EN_CYC=9999999999;
		}
        cout<<dec<<"\ncycle "<<cyc_time<<" passed\n";
		cout<<hex<<top->io_o_dbg_commit_packs_0_uop_pc<<dec<<endl;
	}
    if(ITRACE_EN){
        cout<<dec<<"\ncycle "<<cyc_time<<" passed\n";
    }

    single_cycleup();
    single_cycledown();
    
    //check for trap
    if(Check()){
      cout<<"HIT GOOD TRAP"<<endl;
      break;  
    }
    //写reg在下一个周期才发生
    if(DIFFTEST_EN){
	    if(!first_cycle){
      		diff_check_regs();
		}
	}
      char hex_string[20];
      //if commit two
        if(top->io_o_dbg_commit_packs_0_valid && top->io_o_dbg_commit_packs_1_valid){
				commit_inst_count+=2;
				cyc_do_not_have_commit =0;
          log_inst_commit(0);
	  	  log_inst_commit(1);

    	if(DIFFTEST_EN){
    	      difftest_exec_once();
			  if(last_skip_for_mem){
				  //for possible cases that 2 commits in a row. the regcpy must finish this cycle.
				  //aka we must know the write value of a pending regfile write.
				  cpu_gpr[top->io_o_dbg_commit_packs_0_uop_arch_dst] = top->io_o_dbg_commit_packs_0_uop_dst_value;
				  ref_gpr[top->io_o_dbg_commit_packs_0_uop_arch_dst] = top->io_o_dbg_commit_packs_0_uop_dst_value;
				  ref_difftest_regcpy(cpu_gpr,DIFFTEST_TO_REF);
				  last_skip_for_mem =0;
			  }
    	      difftest_exec_once();
		}
	    first_cycle =0;
        }
	//if commit one
        if(top->io_o_dbg_commit_packs_0_valid && !top->io_o_dbg_commit_packs_1_valid ){
				commit_inst_count +=1;
				cyc_do_not_have_commit =0;
          log_inst_commit(0);
    	  if(DIFFTEST_EN){
           difftest_exec_once();
		   if(last_skip_for_mem){
		       cpu_gpr[top->io_o_dbg_commit_packs_0_uop_arch_dst] = top->io_o_dbg_commit_packs_0_uop_dst_value;
		       ref_gpr[top->io_o_dbg_commit_packs_0_uop_arch_dst] = top->io_o_dbg_commit_packs_0_uop_dst_value;
		       ref_difftest_regcpy(cpu_gpr,DIFFTEST_TO_REF);
		       last_skip_for_mem =0;
		   }
		}
	    first_cycle =0;
        }
	if(diff_pass==0 || stop){
    single_cycleup();
    single_cycledown();
    single_cycleup();
    single_cycledown();
    single_cycleup();
    single_cycledown();
    dumpwave();
		uint32_t cur_inst=top->io_o_dbg_commit_packs_1_valid?top->io_o_dbg_commit_packs_1_uop_inst:top->io_o_dbg_commit_packs_0_uop_inst;
		cout<<"\n\n";
		cout<<BOLDRED<<"------------DIFF FAILED------------"<<RESET<<endl;
                cout<<"0x"<<fixed << setw(8) << setfill('0')<<hex<<cur_inst<<dec<<"	"<<BOLDYELLOW/*<<temp*/<<RESET<<endl;
		goto end;
	}
    
    cyc_time++;
	cyc_do_not_have_commit++;
  }
  if(cyc_time==MAX_TIME){
      cout<<"HIT BAD TRAP(Time OUT)\n"<<cyc_time<<endl;
  }
  if(cyc_do_not_have_commit >COMMIT_TIME_OUT){
		cout<<"HIT BAD TRAP(TOO LONG SINCE LAST COMMIT)\n"<<cyc_time<<endl;
  }
end:
  IPC = ((float)commit_inst_count/cyc_time);
  dumpwave();
  //dump_gpr();
  cout<<"simulation over\n";
  cout<<"total cycle is:"<<cyc_time<<endl<<"total commited inst count is: "<<commit_inst_count<<endl<<"IPC is:"<<IPC<<endl;
  delete top;

  delete contextp;
  tfp->close();
  delete pc_cmt1;
  delete pc_cmt2;
  delete pc ;
  delete last_ref_pc ;


  return 0;
}
