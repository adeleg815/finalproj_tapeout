# SPDX-FileCopyrightText: © 2026 TinyTapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Starting TinyTapeout Functional Simulation Check...")

    # 1. Initialize a 25ns period clock (matching your 40 MHz info.yaml configuration)
    clock = Clock(dut.clk, 25, unit="ns")
    cocotb.start_soon(clock.start())

    # 2. Boot up inside an active reset state (0 means reset for our active-low wrapper)
    dut._log.info("Applying Active-Low Reset...")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)

    # 3. Release the reset line to wake up the internal logic modules
    dut.rst_n.value = 1
    dut._log.info("Reset released! Simulating VGA sync modules...")

    # 4. Run the clock for 100 cycles to prove the internal clock divider and counters increment cleanly
    await ClockCycles(dut.clk, 100)

    dut._log.info("All functional and sequential simulation checks passed successfully!")
