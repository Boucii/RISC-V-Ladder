# RISC-V-Ladder
A out-of-order, dual issueed RISC-V core and SOC, a working project.
Implemented using chisel.

Planned features:

- issuing considering aging
- rat roll back using an extra  (commit)rat when mispredicting (in n/2 cycles), roll back instantly when flushing 

Optional features:

- rat roll back instantly when mispredicting using backup rats per br/jumps (in the mean time limiting number of brs in flight) 
- VIPT cache
