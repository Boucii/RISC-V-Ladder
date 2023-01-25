# RISC-V Ladder

好风凭借力,送我上青云

An out-of-order, dual issueed RISC-V core and SOC, a working project.

**$\color{red}{NOT\ \ A\ \ FINISHED\ \ PROJECT!}$**

Implemented using chisel.

Planned features:

- issuing considering aging
- rat roll back using an extra  (commit)rat when mispredicting (in n/2 cycles), roll back instantly when flushing 

Optional features:

- rat roll back instantly when mispredicting using backup rats per br/jumps (in the mean time limiting number of brs in flight) 
- VIPT cache
- load/store queue with load to load bypass , load to store bypass and store to load forwarding.
- virtual memory system support
