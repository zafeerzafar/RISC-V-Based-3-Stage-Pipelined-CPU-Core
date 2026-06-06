# RV32I 3-Stage Pipelined RISC-V Processor

A 32-bit RISC-V processor implemented in SystemVerilog featuring a custom 3-stage pipeline architecture, support for major RV32I instruction formats, simulation-based verification, and successful deployment on FPGA hardware.

The project was designed to explore processor microarchitecture concepts including pipelining, instruction decoding, control generation, memory access, and FPGA implementation. In addition to simulation-based verification, the processor was synthesized and tested on a physical FPGA board, where register values were displayed through on-board seven-segment displays.

---

## Overview

This processor implements a subset of the RV32I instruction set architecture using a three-stage pipeline:

1. **Instruction Fetch (IF)**
2. **Instruction Decode & Execute (ID/EX)**
3. **Memory Access & Writeback (MEM/WB)**

Programs are stored in instruction memory and executed by the processor while maintaining pipelined instruction flow across stages.

---

## Key Features

- 32-bit RISC-V processor
- Custom 3-stage pipelined architecture
- SystemVerilog RTL implementation
- RV32I instruction subset support
- Arithmetic, logical, branch, jump, and memory instructions
- Register file with 32 general-purpose registers
- Immediate generation unit
- ALU and branch execution unit
- Instruction and data memory interfaces
- FPGA-validated design
- Seven-segment display interface for hardware debugging
- SystemVerilog testbench for simulation and verification
- Synthesizable RTL

---

## Supported Instruction Set

The processor supports the following RV32I instruction formats:

| Instruction Format | Supported |
|-------------------|------------|
| R-Type | ✅ |
| I-Type | ✅ |
| S-Type | ✅ |
| B-Type | ✅ |
| JAL | ✅ |
| JALR | ✅ |
| LUI | ✅ |
| AUIPC | ✅ |

### Arithmetic Instructions

```assembly
ADD
SUB
ADDI
```

### Logical Instructions

```assembly
AND
OR
XOR
ANDI
ORI
XORI
```

### Shift Instructions

```assembly
SLL
SRL
SRA
SLLI
SRLI
SRAI
```

### Comparison Instructions

```assembly
SLT
SLTU
SLTI
SLTIU
```

### Memory Instructions

```assembly
LW
SW
```

### Branch Instructions

```assembly
BEQ
BNE
BLT
BGE
BLTU
BGEU
```

### Jump Instructions

```assembly
JAL
JALR
```

### Upper Immediate Instructions

```assembly
LUI
AUIPC
```

---

## Processor Architecture

### Pipeline Organization

The processor uses a three-stage pipeline to improve instruction throughput.

#### Stage 1 — Instruction Fetch (IF)

**Responsibilities:**

- Program Counter (PC) generation
- Instruction fetch
- Branch/jump target selection
- Pipeline register update

#### Stage 2 — Decode & Execute (ID/EX)

**Responsibilities:**

- Instruction decoding
- Register file access
- Immediate generation
- ALU execution
- Branch evaluation
- Address calculation for memory operations

#### Stage 3 — Memory Access & Writeback (MEM/WB)

**Responsibilities:**

- Load operations
- Store operations
- Register writeback
- Final result selection

### High-Level Datapath

```text
                 ┌────────────────┐
                 │ Instruction    │
                 │ Memory         │
                 └───────┬────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │  IF Stage           │
              │ Instruction Fetch   │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ ID / EX Stage       │
              │ Decode & Execute    │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ MEM / WB Stage      │
              │ Memory & Writeback  │
              └─────────┬───────────┘
                        │
                        ▼
                  Register File
```

> **Note:** Replace this diagram with an actual datapath image in `/docs/datapath.png` for better visualization.

---

## FPGA Implementation

The processor was synthesized and tested on physical FPGA hardware.

### Seven-Segment Display Interface

A dedicated display module was integrated into the design to provide real-time visibility of processor state.

The display subsystem:

- Reads selected register values from the register file
- Converts binary values into seven-segment display format
- Drives the FPGA board's multiplexed seven-segment displays
- Enables hardware-level verification without requiring external debugging tools

This functionality allows processor outputs to be observed directly on the FPGA board.

---

## Verification Methodology

### Simulation

A custom SystemVerilog testbench was developed to verify processor functionality.

#### Testbench Features

- Clock generation
- Reset generation
- Instruction memory initialization
- Program execution
- Fixed simulation runtime of 500 clock cycles
- Waveform generation for debugging

Simulation flow:

```text
Reset
  │
  ▼
Program Loaded
  │
  ▼
Processor Execution
  │
  ▼
500 Clock Cycles
  │
  ▼
Simulation Ends
```

### FPGA Validation

After simulation verification:

1. RTL synthesized for FPGA
2. Bitstream generated
3. Processor deployed to FPGA hardware
4. Program execution observed through seven-segment displays
5. Results validated against simulation expectations

---

## Project Structure

```text
.
├── rtl/
│   ├── processor_top.sv
│   ├── program_counter.sv
│   ├── instruction_memory.sv
│   ├── data_memory.sv
│   ├── register_file.sv
│   ├── control_unit.sv
│   ├── alu.sv
│   ├── immediate_generator.sv
│   ├── pipeline_registers.sv
│   ├── seven_segment_driver.sv
│   └── ...
│
├── tb/
│   └── processor_tb.sv
│
├── programs/
│   └── test_program.mem
│
├── constraints/
│   └── fpga_constraints.xdc
│
├── docs/
│   ├── datapath.png
│   ├── pipeline_diagram.png
│   ├── simulation_waveform.png
│   ├── fpga_demo.jpg
│   └── ...
│
└── README.md
```

---

## Running Simulation

### ModelSim / QuestaSim

Compile RTL:

```bash
vlog rtl/*.sv
```

Compile testbench:

```bash
vlog tb/*.sv
```

Run simulation:

```bash
vsim processor_tb
run -all
```

---

## Example Program

```assembly
addi x1, x0, 5
addi x2, x0, 10

add  x3, x1, x2

sw   x3, 0(x0)

jal  x0, done

done:
```

### Expected Result

```text
x3 = 15
MEM[0] = 15
```

---

## Design Challenges

### Pipeline Design

Designing a three-stage pipeline required careful management of:

- Instruction flow between stages
- Pipeline register synchronization
- Branch redirection
- Control signal propagation

### Instruction Decoding

Supporting multiple RV32I instruction formats required:

- Opcode decoding
- Immediate extraction
- Control signal generation

### FPGA Debugging

Observing processor state on hardware can be challenging. The seven-segment display interface was developed to provide a simple and effective method for monitoring register values during execution.

---

## Results

- ✅ Functional simulation completed
- ✅ Successful execution of RV32I programs
- ✅ RTL synthesis completed
- ✅ Processor deployed to FPGA hardware
- ✅ Register values displayed through seven-segment displays
- ✅ Hardware results matched simulation results

---

## Future Improvements

Potential future enhancements include:

- Full RV32I instruction support
- Data forwarding network
- Hazard detection unit
- Pipeline stalling logic
- Branch prediction
- RV32M multiplication/division extension
- CSR support
- Interrupt and exception handling
- AXI-based memory interfaces
- UART debugging interface
- Performance counters

---

## Skills Demonstrated

This project demonstrates practical experience in:

- Computer Architecture
- RISC-V ISA
- Processor Microarchitecture
- Pipeline Design
- RTL Development
- SystemVerilog
- FPGA Design
- Digital Logic Design
- Hardware Verification
- FPGA Bring-Up and Debugging

---

## Author

**Zafeer Zafar**

Embedded Systems & FPGA Engineer

- SystemVerilog
- FPGA Design
- Digital Design
- RISC-V Processor Design
- Embedded Systems

---

## License

This project is licensed under the MIT License.# RISC-V-Based-3-Stage-Pipelined-CPU-Core
A 32-bit RISC-V processor implemented in SystemVerilog featuring a custom 3-stage pipeline architecture, support for major RV32I instruction formats, simulation-based verification, and successful deployment on FPGA hardware.
