package Ladder


class Full_Adder extends Module{
    val io = IO(new Bundle{
        val i_a = Input(UInt(1.W))
        val i_b = Input(UInt(1.W))
        val i_cin = Input(UInt(1.W))

        val o_s = Output(UInt(1.W))
        val o_cout = Output(UInt(1.W))
    })
    io.o_s := io.i_a ^ io.i_b ^ io.i_cin
    io.o_cout := (io.i_a & io.i_b) | (io.i_a & io.i_cin) | (io.i_b & io.i_cin)
}
//wallace tree layout: 1 2 3 3 4 7
class Wallace_Tree_Cell extends Module{
    val io = IO(new Bundle{
        val i_inter_c = Input(UInt(19.W))
        val i_s = Input(Vec(22,UInt(1.W)))

        val o_inter_c = Output(UInt(19.W))
        val o_c = Output(UInt(1.W))
        val o_s = Output(UInt(1.W))
    })
    val adder_level0 = Seq.fill(7)(Module(new Full_Adder()))
    val adder_level1 = Seq.fill(4)(Module(new Full_Adder()))
    val adder_level2 = Seq.fill(3)(Module(new Full_Adder()))
    val adder_level3 = Seq.fill(3)(Module(new Full_Adder()))
    val adder_level4 = Seq.fill(2)(Module(new Full_Adder()))
    val adder_level5 = Seq.fill(1)(Module(new Full_Adder()))

    //assign cout
    for(i<- 0 until 7){
        io.o_inter_c(i) := adder_level0(i).io.o_cout
    }    
    for(i<- 0 until 4){
        io.o_inter_c(i+7) := adder_level1(i).io.o_cout
    }
    for(i<- 0 until 3){
        io.o_inter_c(i+11) := adder_level2(i).io.o_cout
    }    
    for(i<- 0 until 3){
        io.o_inter_c(i+14) := adder_level3(i).io.o_cout
    }
    for(i<- 0 until 2){
        io.o_inter_c(i+17) := adder_level3(i).io.o_cout
    }
    io.o_c := adder_level5(0).io.o_cout

    //assign s
    io.o_s := adder_level5(0).io.o_s

    //assign s for each adder
    //level0
    for(i <- 0 until 7){
        adder_level0(i).io.i_a := io.i_s(3*i)
        adder_level0(i).io.i_b := io.i_s(3*i+1)
        adder_level0(i).io.i_cin := io.i_s(3*i+2)
    }
    //level1
    adder_level1(0).io.i_a      := adder_level0(0).io.o_s
    adder_level1(0).io.i_b      := adder_level0(1).io.o_s
    adder_level1(0).io.i_cin    := adder_level0(2).io.o_s

    adder_level1(1).io.i_a      := adder_level0(3).io.o_s
    adder_level1(1).io.i_b      := adder_level0(4).io.o_s
    adder_level1(1).io.i_cin    := adder_level0(5).io.o_s

    adder_level1(2).io.i_a      := adder_level0(6).io.o_s
    adder_level1(2).io.i_b      := io.i_s(21) 
    adder_level1(2).io.i_cin    := io.i_inter_c(0)

    adder_level1(3).io.i_a      := io.i_inter_c(1)
    adder_level1(3).io.i_b      := io.i_inter_c(2)
    adder_level1(3).io.i_cin    := io.i_inter_c(3)

    //level 2
    adder_level2(0).io.i_a      := adder_level1(0).io.o_s
    adder_level2(0).io.i_b      := adder_level1(1).io.o_s
    adder_level2(0).io.i_cin    := adder_level1(2).io.o_s    
   
    adder_level2(1).io.i_a      := adder_level1(3).io.o_s
    adder_level2(1).io.i_b      := io.i_inter_c(4)
    adder_level2(1).io.i_cin    := io.i_inter_c(5)

    adder_level2(2).io.i_a      := io.i_inter_c(6)
    adder_level2(2).io.i_b      := io.i_inter_c(7)
    adder_level2(2).io.i_cin    := io.i_inter_c(8)

    //level3
    adder_level3(0).io.i_a      := adder_level2(0).io.o_s
    adder_level3(0).io.i_b      := adder_level2(1).io.o_s
    adder_level3(0).io.i_cin    := adder_level2(2).io.o_s   

    adder_level3(1).io.i_a      := io.i_inter_c(9)
    adder_level3(1).io.i_b      := io.i_inter_c(10)
    adder_level3(1).io.i_cin    := io.i_inter_c(11)

    adder_level3(2).io.i_a      := io.i_inter_c(12)
    adder_level3(2).io.i_b      := io.i_inter_c(13)
    adder_level3(2).io.i_cin    := io.i_inter_c(14)

    //level4
    adder_level4(0).io.i_a      := adder_level3(0).io.o_s
    adder_level4(0).io.i_b      := adder_level3(1).io.o_s
    adder_level4(0).io.i_cin    := adder_level3(2).io.o_s

    adder_level4(1).io.i_a      := io.i_inter_c(15)
    adder_level4(1).io.i_b      := io.i_inter_c(16)
    adder_level4(1).io.i_cin    := io.i_inter_c(17)

    //level5
    adder_level5(0).io.i_a      := adder_level4(0).io.o_s
    adder_level5(0).io.i_b      := adder_level4(1).io.o_s
    adder_level5(0).io.i_cin    := io.i_inter_c(18)
}
class Wallace_Tree extends Module{
    val io = IO(new Bundle{
        val i_partial_products = Input(Vec(22,UInt(131.W)))

        val o_s = Output(UInt(131.W))
        val o_c = Output(UInt(131.W))
    })
    val wallace_tree_cells = Seq.fill(131)(Module(new Wallace_Tree_Cell()))
    val inversed_pp = Vec(131,UInt(22))

    for(i <- 0 until 22){
        for(j <- 0 until 131){
            inversed_pp(j)(i) := io.i_partial_products(i)(j)
        }
    }

    for(i <- 0 until 131){
        wallace_tree_cells(i).io.i_s := inversed_pp(i)
    }
    //inter_c
    wallace_tree_cells(0).io.i_inter_c := 0.U
    for(i <- 1 until 131){
        wallace_tree_cells(i).io.i_inter_c := wallace_tree_cells(i-1).io.o_inter_c
    }
    for(i<- 0 until 131){
        io.o_s(i) := wallace_tree_cells(i).io.o_s
        io.o_c(i) := wallace_tree_cells(i).io.o_c
    }
}