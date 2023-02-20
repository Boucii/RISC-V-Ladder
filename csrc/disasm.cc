#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
#endif

#include<iostream>
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCDisassembler/MCDisassembler.h"
#include "llvm/MC/MCInstPrinter.h"
#if LLVM_VERSION_MAJOR >= 14
#include "llvm/MC/TargetRegistry.h"
#else
#include "llvm/Support/TargetRegistry.h"
#endif
#include "llvm/Support/TargetSelect.h"

#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic pop
#endif

#if LLVM_VERSION_MAJOR < 11
#error Please use LLVM with major version >= 11
#endif

using namespace llvm;

static llvm::MCDisassembler *gDisassembler = nullptr;
static llvm::MCSubtargetInfo *gSTI = nullptr;
static llvm::MCInstPrinter *gIP = nullptr;

void init_disasm(const char *triple) {
  llvm::InitializeAllTargetInfos();
  llvm::InitializeAllTargetMCs();
  llvm::InitializeAllAsmParsers();
  llvm::InitializeAllDisassemblers();

  std::string errstr;
  std::string gTriple(triple);

  llvm::MCInstrInfo *gMII = nullptr;
  llvm::MCRegisterInfo *gMRI = nullptr;
  auto target = llvm::TargetRegistry::lookupTarget(gTriple, errstr);
  if (!target) {
    llvm::errs() << "Can't find target for " << gTriple << ": " << errstr << "\n";
    assert(0);
  }

  MCTargetOptions MCOptions;
  gSTI = target->createMCSubtargetInfo(gTriple, "", "");
  std::string isa = target->getName();
  if (isa == "riscv32" || isa == "riscv64") {
    gSTI->ApplyFeatureFlag("+m");
    gSTI->ApplyFeatureFlag("+a");
    gSTI->ApplyFeatureFlag("+c");
    gSTI->ApplyFeatureFlag("+f");
    gSTI->ApplyFeatureFlag("+d");
  }
  gMII = target->createMCInstrInfo();
  gMRI = target->createMCRegInfo(gTriple);
  auto AsmInfo = target->createMCAsmInfo(*gMRI, gTriple, MCOptions);
#if LLVM_VERSION_MAJOR >= 13
   auto llvmTripleTwine = Twine(triple);
   auto llvmtriple = llvm::Triple(llvmTripleTwine);
   auto Ctx = new llvm::MCContext(llvmtriple,AsmInfo, gMRI, nullptr);
#else
   auto Ctx = new llvm::MCContext(AsmInfo, gMRI, nullptr);
#endif
  gDisassembler = target->createMCDisassembler(*gSTI, *Ctx);
  gIP = target->createMCInstPrinter(llvm::Triple(gTriple),
      AsmInfo->getAssemblerDialect(), *AsmInfo, *gMII, *gMRI);
  gIP->setPrintImmHex(true);
#if LLVM_VERSION_MAJOR >= 11
  gIP->setPrintBranchImmAsAddress(true);
#endif
}

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte) {
	/*
  MCInst inst;
  llvm::ArrayRef<uint8_t> arr(code, nbyte);
  uint64_t dummy_size=0 ;
  std::string s1;
  raw_string_ostream os1(s1);
  gDisassembler->getInstruction(inst, dummy_size, arr, pc,s1); //llvm::nulls());
  std::string s;
  raw_string_ostream os(s);
  gIP->printInst(&inst, pc, "", *gSTI, os);

  int skip = s.find_first_not_of('\t');
  const char *p = s.c_str() + skip;
  assert((int)s.length() - skip < size);
  strcpy(str, p);*/
  MCInst inst;
  llvm::ArrayRef<uint8_t> arr(code, nbyte);
  uint64_t dummy_size ;
  std::string s1;
  raw_string_ostream os1(s1);
  gDisassembler->getInstruction(inst, dummy_size, arr, pc, os1);// llvm::nulls());

  std::string s;
  raw_string_ostream os(s);
  gIP->printInst(&inst, pc, "", *gSTI, os);

  int skip = s.find_first_not_of('\t');
  const char *p = s.c_str() + skip;
  assert((int)s.length() - skip < size);
  //std::cout<<"aaa"<<p<<s1.c_str()<<"bbb"<<std::endl;
  //std::cout<<"aaa"<<p<<s.c_str()<<"bbb"<<std::endl;
  strcpy(str, p);
}
  
/*
    llvm::MCInst inst;
    uint64_t inst_size;

  llvm::ArrayRef<uint8_t> arr(code, nbyte);
    llvm::MCDisassembler::DecodeStatus decode_result =
        gDisassembler->getInstruction(inst, inst_size, arr, pc,
                                      llvm::nulls());

    switch (decode_result) {
      case llvm::MCDisassembler::Fail: {
        printf("Invalid instruction encoding encountered at");
        break;
      }
      case llvm::MCDisassembler::SoftFail: {
        printf("Potentially undefined instruction encoding encountered at");
        // fall-through
      }
      case llvm::MCDisassembler::Success : {
  std::string s;
  raw_string_ostream os(s);
        gIP->printInst(&inst, pc, "", *gSTI, os);
	printf("%s",s.c_str());
*/					
