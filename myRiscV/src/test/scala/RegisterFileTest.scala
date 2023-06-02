import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class GeneralRegisterFileTester[T<:RegisterFile](dut:T){

  dut.io.WriteAddress.poke(4.U)
  dut.io.WriteData.poke(15.U)
  dut.io.WriteEnable.poke(1.B)
  dut.clock.step(1)
  dut.io.ReadAddress.poke(4.U)	
			
  dut.clock.step(1)
  dut.io.ReadData.expect(15.U)

  dut.io.WriteAddress.poke(3.U)
  dut.io.ReadAddress.poke(3.U)
  dut.io.WriteEnable.poke(1.B)
  dut.io.WriteData.poke(45.U)
  dut.clock.step(1)
  dut.io.ReadData.expect(45.U)

}

class ParametrizedForwardingMemoryTest extends AnyFlatSpec with ChiselScalatestTester {
	"RegisterFileTest test" should "pass" in {
		test(new RegisterFile(16,32,0)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
                  new GeneralRegisterFileTester(dut)
		}
        }
         "RegisterFileTest" should "pass" in {
           test(new RegisterFile(32,64,0)){ dut =>
                  new GeneralRegisterFileTester(dut)
                }
	}
}
