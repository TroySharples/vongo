import cocotb
from cocotb.triggers import Timer
from cocotb.clock    import Clock

@cocotb.test()
async def my_first_test(dut):
    cocotb.start_soon(Clock(dut.aclk, 2, units="ns").start())

    dut.aresetn.value = 0
    await Timer(50, units="ns")
    dut.aresetn.value = 1
    
    await Timer(100, units="ns")
    dut.s_axis_tvalid.value = 1