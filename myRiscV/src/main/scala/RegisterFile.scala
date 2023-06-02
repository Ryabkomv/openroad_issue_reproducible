import chisel3._
import math._


class RegisterFile(Number:Int, Bits:Int, FloatNumber:Int) extends Module {
  val log2 = (x:Int) => (log10(x)/log10(2)).intValue
  val addressWidth = if (pow(2,log2(Number))==Number) log2(Number) else log2(Number)+1
  print(addressWidth)
  val io =IO(new Bundle{
    val ReadAddress  = Input(UInt(addressWidth.W))
    val WriteAddress = Input(UInt(addressWidth.W))
    val WriteData    = Input(UInt(Bits.W))
    val WriteEnable  = Input(Bool())
    val ReadData     = Output(UInt(Bits.W))
  })
  val regFile = SyncReadMem(Number,UInt(Bits.W))
  val sel = RegNext(io.WriteAddress===io.ReadAddress && io.WriteEnable)
  regFile.write(0.U,0.U)
  when (io.WriteEnable) {
    regFile.write(io.WriteAddress, io.WriteData)
  }
  io.ReadData := Mux(io.ReadAddress.orR, Mux(sel, RegNext(io.WriteData), regFile.read(io.ReadAddress)),0.U)

}

object RegisterFile extends App {
  emitVerilog(new RegisterFile(32,32,0),Array("--target-dir", "generated"))
}
