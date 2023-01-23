package Ladder 

class divider extends Module{
    val io = new Bundle{
        val i_dividend      = Input(UInt(64.W)),
        val i_divisor       = Input(UInt(64.W)),
        val i_div_valid     = Input(Bool()),
        val i_divw          = Input(Bool()),
        val i_div_signed    = Input(Bool()),
        val i_flush         = Input(Bool()),
                           
        val o_out_ready     = Output(Bool()),
        val o_out_valid     = Output(Bool()),
        val o_quotient      = Output(UInt(64.W)),
        val o_remainder     = Output(UInt(64.W))
    }
    val state = Reg(UInt(7.W))
    val next_state = Wire(UInt(7.W))

    next_state := MuxCase(state + 1.U,Seq(
        state>65.U ||state===65.U -> 0.U,
        state===0.U -> Mux(io.i_div_valid, 1.U , 0.U)
    ))
    state := Mux(io.i_flush, 0.U, next_state)

    io.o_out_ready := state === 0.U
    io.o_out_valid := state === 65.U

    val quotient_sign = Wire(UInt(1.W))
    val remainder_sign = Wire(UInt(1.W))

    when(!io.i_div_signed){
        quotient_sign := 1.U
    }.otherwise{
        when(io.i_divw){
            quotient_sign := (dividend(31) & i_divisor(31)) || (!dividend(31) & !i_divisor(31))
        }.otherwise{
            quotient_sign := (dividend(63) & i_divisor(63)) || (!dividend(63) & !i_divisor(63))
        }
    }
     when(!io.i_div_signed){
        remainder_sign := 1.U
    }.otherwise{
        when(io.i_divw){
            remainder_sign := (dividend(31) & !i_divisor(31)) || (!dividend(31) & !i_divisor(31))
        }.otherwise{
            remainder_sign := (dividend(63) & !i_divisor(63)) || (!dividend(63) & !i_divisor(63))
        }
    }   
    val dividend_unsigned = Wire(UInt(64.W))
    val divisor_unsigned = Wire(UInt(64.W))

    when(!io.i_div_signed){
        dividend_unsigned := io.i_dividend
        divisor_unsigned := io.i_divisor
    }.otherwise{
        when(io.i_divw){
            dividend_unsigned := Mux(io.i_dividend(31), ~io.i_dividend + 1.U, io.i_dividend)
            divisor_unsigned := Mux(io.i_divisor(31), ~io.i_divisor + 1.U, io.i_divisor)
        }.otherwise{
            dividend_unsigned := Mux(io.i_dividend(63), ~io.i_dividend + 1.U, io.i_dividend)
            divisor_unsigned := Mux(io.i_divisor(63), ~io.i_divisor + 1.U, io.i_divisor)
        }
    }

    val signs = Reg(UInt(2.W))
    when(state === 1.U){
        signs := Cat(remainder_sign, quotient_sign)
    }

    val div_temp = Wire(UInt(128.W))
    val temp_op1 = Reg(UInt(128.W))
    val temp_op2 = Reg(UInt(128.W))

    div_temp := temp_op1 - temp_op2

    temp_op1 := Mux(next_state === 1.U, Cat(0.U(64.W), dividend_unsigned), div_temp)
    temp_op2 := Mux(next_state === 1.U, Cat(Cat(0.U(1.W), divisor_unsigned),0.U(63.U), Cat(0.U(1.W),temp_op2(127,1))))

    val ans = Reg(UInt(64.W))
    ans := MuxCase(0.U,Seq.tabulate(65)(i=>i).map(
        i => (state === i.U) -> Cat(Cat(ans(63,65-i),!div_temp(127)),0.U((64-i).W)) 
    ))
    when(state === 0.U){
        ans := 0.U(64.W)
    }
    when(state === 1.U){
        ans := Cat(!div_temp(127),0.U((64-i).W))
    }

    val quotient_signed = Wire(UInt(64.W))
    val remainder_signed = Wire(UInt(64.W))

    when(io.i_divw){
        quotient_signed := Mux(signs(0),ans,Cat(Fill(32,1.U(1.W),~ans(31,0)))+1.U)
    }.otherwise{
        quotient_signed := Mux(signs(0),ans,~ans+1.U)
    }
    when(io.i_divw){
        remainder_signed := Mux(signs(1),temp_op1,Cat(Fill(32,1.U(1.W)),~temp_op2(31,0))+1.U)
    }.otherwise{
        remainder_signed := Mux(signs(1),temp_op1,~temp_op1+1.U)
    }

    io.o_quotient := quotient_signed
    io.o_remainder := remainder_signed

}