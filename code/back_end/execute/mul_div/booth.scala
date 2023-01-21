package Ladder

//64 bits radix-8 booth multiplier
class Partial_Products_Gen extends Module{
    val io = IO(new Bundle{
        val i_x = Input(UInt(131.W))
        val i_y = Input(UInt(67.W))

        val o_partial_products = Output(Vec(22, UInt(131.W)))
    })
    val xtimes1 = Wire(UInt(131.W))
    val xtimes2 = Wire(UInt(131.W))
    val xtimes3 = Wire(UInt(131.W))
    val xtimes4 = Wire(UInt(131.W))
    val x_times2_com = Wire(UInt(131.W))
    val x_times3_com = Wire(UInt(131.W))
    val x_times4_com = Wire(UInt(131.W))

    xtimes1 := io.i_x
    xtimes2 := io.i_x << 1
    xtimes3 := io.i_x << 1 + io.i_x
    xtimes4 := io.i_x << 2 
    x_times1_com := ~xtimes1 + 1.U
    x_times2_com := ~xtimes2 + 1.U
    x_times3_com := ~xtimes3 + 1.U
    x_times4_com := ~xtimes4 + 1.U

    val pp_gen_bits = Vec(Wire(UInt(4.U)))
    for(i <- 0 until 22){
        pp_gen_bits(i) := io.i_y(3*i+3,3*i)
    }
    for(i<-0 until 22){
        io.o_partial_products(i) := MuxCase(0.U(),Seq(
            (pp_gen_bits(i) === 0.U)  -> 0.U,
            (pp_gen_bits(i) === 1.U)  -> x_times_1,
            (pp_gen_bits(i) === 2.U)  -> x_times_1,
            (pp_gen_bits(i) === 3.U)  -> x_times_2,
            (pp_gen_bits(i) === 4.U)  -> x_times_2,
            (pp_gen_bits(i) === 5.U)  -> x_times_3,
            (pp_gen_bits(i) === 6.U)  -> x_times_3,
            (pp_gen_bits(i) === 7.U)  -> x_times_4,
            (pp_gen_bits(i) === 8.U)  -> x_times_4_com, 
            (pp_gen_bits(i) === 9.U)  -> x_times_3_com, 
            (pp_gen_bits(i) === 10.U) -> x_times_3_com, 
            (pp_gen_bits(i) === 11.U) -> x_times_2_com, 
            (pp_gen_bits(i) === 12.U) -> x_times_2_com, 
            (pp_gen_bits(i) === 13.U) -> x_times_1_com, 
            (pp_gen_bits(i) === 14.U) -> x_times_1_com, 
            (pp_gen_bits(i) === 15.U) -> 0.U
    )) << i*3
}
}
