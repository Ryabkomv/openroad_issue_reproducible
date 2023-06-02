circuit RegisterFile :
  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_ReadAddress : UInt<5>
    input io_WriteAddress : UInt<5>
    input io_WriteData : UInt<64>
    input io_WriteEnable : UInt<1>
    output io_ReadData : UInt<64>

    mem regFile : @[RegisterFile.scala 16:28]
      data-type => UInt<64>
      depth => 32
      read-latency => 1
      write-latency => 1
      reader => io_ReadData_MPORT
      writer => MPORT
      writer => MPORT_1
      read-under-write => undefined
    node _sel_T = eq(io_WriteAddress, io_ReadAddress) @[RegisterFile.scala 17:36]
    node _sel_T_1 = and(_sel_T, io_WriteEnable) @[RegisterFile.scala 17:54]
    reg sel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sel) @[RegisterFile.scala 17:20]
    node _GEN_0 = validif(io_WriteEnable, io_WriteAddress) @[RegisterFile.scala 19:25]
    node _GEN_1 = validif(io_WriteEnable, clock) @[RegisterFile.scala 19:25]
    node _GEN_2 = mux(io_WriteEnable, UInt<1>("h1"), UInt<1>("h0")) @[RegisterFile.scala 19:25 16:28]
    node _GEN_3 = validif(io_WriteEnable, UInt<1>("h1")) @[RegisterFile.scala 19:25]
    node _GEN_4 = validif(io_WriteEnable, io_WriteData) @[RegisterFile.scala 19:25]
    node _io_ReadData_T = orr(io_ReadAddress) @[RegisterFile.scala 22:37]
    reg io_ReadData_REG : UInt<64>, clock with :
      reset => (UInt<1>("h0"), io_ReadData_REG) @[RegisterFile.scala 22:58]
    node _GEN_5 = validif(UInt<1>("h1"), io_ReadAddress) @[RegisterFile.scala 22:{86,86}]
    node _io_ReadData_WIRE = _GEN_5 @[RegisterFile.scala 22:86]
    node _io_ReadData_T_1 = or(_io_ReadData_WIRE, UInt<5>("h0")) @[RegisterFile.scala 22:86]
    node _io_ReadData_T_2 = bits(_io_ReadData_T_1, 4, 0) @[RegisterFile.scala 22:86]
    node _GEN_6 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[RegisterFile.scala 16:28 22:{86,86}]
    node _GEN_7 = validif(UInt<1>("h1"), _io_ReadData_T_2) @[RegisterFile.scala 22:{86,86}]
    node _GEN_8 = validif(UInt<1>("h1"), clock) @[RegisterFile.scala 22:{86,86}]
    node _io_ReadData_T_3 = mux(sel, io_ReadData_REG, regFile.io_ReadData_MPORT.data) @[RegisterFile.scala 22:45]
    node _io_ReadData_T_4 = mux(_io_ReadData_T, _io_ReadData_T_3, UInt<1>("h0")) @[RegisterFile.scala 22:21]
    io_ReadData <= _io_ReadData_T_4 @[RegisterFile.scala 22:15]
    regFile.io_ReadData_MPORT.addr <= _GEN_7
    regFile.io_ReadData_MPORT.en <= _GEN_6
    regFile.io_ReadData_MPORT.clk <= _GEN_8
    regFile.MPORT.addr <= UInt<5>("h0")
    regFile.MPORT.en <= UInt<1>("h1")
    regFile.MPORT.clk <= clock
    regFile.MPORT.data <= UInt<64>("h0")
    regFile.MPORT.mask <= UInt<1>("h1")
    regFile.MPORT_1.addr <= _GEN_0
    regFile.MPORT_1.en <= _GEN_2
    regFile.MPORT_1.clk <= _GEN_1
    regFile.MPORT_1.data <= _GEN_4
    regFile.MPORT_1.mask <= _GEN_3
    sel <= _sel_T_1 @[RegisterFile.scala 17:20]
    io_ReadData_REG <= io_WriteData @[RegisterFile.scala 22:58]
