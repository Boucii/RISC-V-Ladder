#include "log.h"
ofstream fout("./build/npc_log.txt",ios::out|ios::trunc);

void LogInit(){
    assert(fout.is_open()&&fout);
}
void Log(string content){
    fout<<content;
    fout.flush();

}
