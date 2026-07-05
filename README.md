# FPGA Morse Code Encoder using Verilog

## Overview

This project implements a **Morse Code Encoder** on the **Digilent Nexys 4 DDR FPGA Board** using **Verilog HDL**. The encoder converts decimal digits into Morse code and generates the corresponding sequence of dots (`.`) and dashes (`-`) on the FPGA LEDs with precise timing.

The design supports two operating modes:

- **Single Digit Mode** – Encodes one decimal digit (0–9)
- **Number Mode** – Encodes up to six decimal digits stored in a FIFO buffer

The project demonstrates the practical implementation of **Finite State Machines (FSMs)**, **FIFO-based data storage**, **digital timing control**, and **real-time FPGA implementation**.

---

## Objectives

- Design a Morse Code Encoder using Verilog HDL.
- Implement a Finite State Machine (FSM) for control logic.
- Generate accurate Morse timing using FPGA clocks.
- Support both single-digit and multi-digit encoding.
- Verify the design through simulation and FPGA implementation.

---

## Features

- Single Digit Encoding
- Multi-Digit Encoding (up to 6 digits)
- FIFO Buffer Storage
- FSM-Based Control Logic
- Push Button Interface
- Switch-Based User Input
- LED Morse Code Output
- Hardware Tested on Digilent Nexys 4 DDR FPGA
- Vivado Simulation and Timing Verification

---

## Hardware Platform

- Digilent Nexys 4 DDR FPGA Board
- Xilinx Vivado Design Suite

---

## Technologies Used

- Verilog HDL
- FPGA Design
- Finite State Machines (FSM)
- FIFO Memory
- Digital System Design
- Embedded Systems
- Xilinx Vivado

---

## User Inputs

| Input | Function |
|-------|----------|
| SW0–SW3 | Binary digit input (0–9) |
| SW4 | Mode Selection |
| BTN0 | Reset |
| BTN1 | Store / Start |
| BTN2 | Encode Number |

---

## System Architecture

The design consists of the following modules:

- Top Module
- Morse Encoder
- FIFO Buffer
- Finite State Machine
- Clock Divider
- Button Debouncer
- LED Output Controller

---

## Working Principle

1. User enters a decimal digit using switches.
2. The selected mode determines the encoding process.
3. The FSM processes the input.
4. Digits are converted into Morse code.
5. LEDs generate dots and dashes with accurate timing.
6. In Number Mode, multiple digits are stored in a FIFO before being encoded sequentially.

---

## Repository Structure

```text
FPGA-Morse-Code-Encoder
│
├── README.md
├── LICENSE
├── src/
├── testbench/
├── constraints/
├── docs/
└── waveforms/
```

---

## Simulation and Verification

The design was verified using **Xilinx Vivado Simulator** and successfully implemented on the **Digilent Nexys 4 DDR FPGA Board**.

The repository includes:

- Verilog source code
- Testbench files
- Constraint file (.xdc)
- Simulation waveforms
- Complete project documentation

---

## Learning Outcomes

This project strengthened my understanding of:

- FPGA Design Flow
- Verilog HDL
- Finite State Machine (FSM) Design
- FIFO Buffer Implementation
- Clock and Timing Control
- Digital Logic Design
- Hardware Verification
- Embedded System Development

---

## Future Improvements

- Support alphabetic characters (A–Z)
- UART Communication
- LCD Display Integration
- Seven-Segment Display Output
- Adjustable Morse Transmission Speed
- Audio Buzzer Output
- Morse Code Decoder

---

## How to Run

1. Open the project in **Xilinx Vivado**.
2. Run Synthesis.
3. Run Implementation.
4. Generate the Bitstream.
5. Program the Digilent Nexys 4 DDR FPGA board.
6. Use the switches and push buttons to test the encoder.

---

## Documentation

The complete project report is available in the **docs** folder.

---

## Author

**Hammad Ali**

Electrical Engineer

### Areas of Interest

- Digital IC Design & Verification
- FPGA Design
- Verilog & SystemVerilog
- RISC-V Architecture
- Digital System Design
- Embedded Systems
- Computer Architecture
- Automation
- Artificial Intelligence
