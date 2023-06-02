module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_ReadAddress,
  input  [4:0]  io_WriteAddress,
  input  [31:0] io_WriteData,
  input         io_WriteEnable,
  output [31:0] io_ReadData
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regFile [0:31]; // @[RegisterFile.scala 15:28]
  wire  regFile_io_ReadData_MPORT_en; // @[RegisterFile.scala 15:28]
  wire [4:0] regFile_io_ReadData_MPORT_addr; // @[RegisterFile.scala 15:28]
  wire [31:0] regFile_io_ReadData_MPORT_data; // @[RegisterFile.scala 15:28]
  wire [31:0] regFile_MPORT_data; // @[RegisterFile.scala 15:28]
  wire [4:0] regFile_MPORT_addr; // @[RegisterFile.scala 15:28]
  wire  regFile_MPORT_mask; // @[RegisterFile.scala 15:28]
  wire  regFile_MPORT_en; // @[RegisterFile.scala 15:28]
  wire [31:0] regFile_MPORT_1_data; // @[RegisterFile.scala 15:28]
  wire [4:0] regFile_MPORT_1_addr; // @[RegisterFile.scala 15:28]
  wire  regFile_MPORT_1_mask; // @[RegisterFile.scala 15:28]
  wire  regFile_MPORT_1_en; // @[RegisterFile.scala 15:28]
  reg  regFile_io_ReadData_MPORT_en_pipe_0;
  reg [4:0] regFile_io_ReadData_MPORT_addr_pipe_0;
  reg  sel; // @[RegisterFile.scala 16:20]
  reg [31:0] io_ReadData_REG; // @[RegisterFile.scala 21:58]
  wire [31:0] _io_ReadData_T_3 = sel ? io_ReadData_REG : regFile_io_ReadData_MPORT_data; // @[RegisterFile.scala 21:45]
  assign regFile_io_ReadData_MPORT_en = regFile_io_ReadData_MPORT_en_pipe_0;
  assign regFile_io_ReadData_MPORT_addr = regFile_io_ReadData_MPORT_addr_pipe_0;
  assign regFile_io_ReadData_MPORT_data = regFile[regFile_io_ReadData_MPORT_addr]; // @[RegisterFile.scala 15:28]
  assign regFile_MPORT_data = 32'h0;
  assign regFile_MPORT_addr = 5'h0;
  assign regFile_MPORT_mask = 1'h1;
  assign regFile_MPORT_en = 1'h1;
  assign regFile_MPORT_1_data = io_WriteData;
  assign regFile_MPORT_1_addr = io_WriteAddress;
  assign regFile_MPORT_1_mask = 1'h1;
  assign regFile_MPORT_1_en = io_WriteEnable;
  assign io_ReadData = |io_ReadAddress ? _io_ReadData_T_3 : 32'h0; // @[RegisterFile.scala 21:21]
  always @(posedge clock) begin
    if (regFile_MPORT_en & regFile_MPORT_mask) begin
      regFile[regFile_MPORT_addr] <= regFile_MPORT_data; // @[RegisterFile.scala 15:28]
    end
    if (regFile_MPORT_1_en & regFile_MPORT_1_mask) begin
      regFile[regFile_MPORT_1_addr] <= regFile_MPORT_1_data; // @[RegisterFile.scala 15:28]
    end
    regFile_io_ReadData_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      regFile_io_ReadData_MPORT_addr_pipe_0 <= io_ReadAddress;
    end
    sel <= io_WriteAddress == io_ReadAddress & io_WriteEnable; // @[RegisterFile.scala 16:54]
    io_ReadData_REG <= io_WriteData; // @[RegisterFile.scala 21:58]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regFile[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regFile_io_ReadData_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regFile_io_ReadData_MPORT_addr_pipe_0 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  sel = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_ReadData_REG = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
