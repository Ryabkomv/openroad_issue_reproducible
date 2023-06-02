circuit RegisterFile :
  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ReadAddress : UInt<5>, flip WriteAddress : UInt<5>, flip WriteData : UInt<32>, flip WriteEnable : UInt<1>, ReadData : UInt<32>}

    smem regFile : UInt<32> [32] @[RegisterFile.scala 15:28]
    node _sel_T = eq(io.WriteAddress, io.ReadAddress) @[RegisterFile.scala 16:36]
    node _sel_T_1 = and(_sel_T, io.WriteEnable) @[RegisterFile.scala 16:54]
    reg sel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sel) @[RegisterFile.scala 16:20]
    sel <= _sel_T_1 @[RegisterFile.scala 16:20]
    write mport MPORT = regFile[UInt<1>("h0")], clock
    MPORT <= UInt<1>("h0")
    when io.WriteEnable : @[RegisterFile.scala 18:25]
      write mport MPORT_1 = regFile[io.WriteAddress], clock
      MPORT_1 <= io.WriteData
    node _io_ReadData_T = orr(io.ReadAddress) @[RegisterFile.scala 21:37]
    reg io_ReadData_REG : UInt, clock with :
      reset => (UInt<1>("h0"), io_ReadData_REG) @[RegisterFile.scala 21:58]
    io_ReadData_REG <= io.WriteData @[RegisterFile.scala 21:58]
    wire _io_ReadData_WIRE : UInt @[RegisterFile.scala 21:86]
    _io_ReadData_WIRE is invalid @[RegisterFile.scala 21:86]
    when UInt<1>("h1") : @[RegisterFile.scala 21:86]
      _io_ReadData_WIRE <= io.ReadAddress @[RegisterFile.scala 21:86]
      node _io_ReadData_T_1 = or(_io_ReadData_WIRE, UInt<5>("h0")) @[RegisterFile.scala 21:86]
      node _io_ReadData_T_2 = bits(_io_ReadData_T_1, 4, 0) @[RegisterFile.scala 21:86]
      read mport io_ReadData_MPORT = regFile[_io_ReadData_T_2], clock @[RegisterFile.scala 21:86]
    node _io_ReadData_T_3 = mux(sel, io_ReadData_REG, io_ReadData_MPORT) @[RegisterFile.scala 21:45]
    node _io_ReadData_T_4 = mux(_io_ReadData_T, _io_ReadData_T_3, UInt<1>("h0")) @[RegisterFile.scala 21:21]
    io.ReadData <= _io_ReadData_T_4 @[RegisterFile.scala 21:15]

