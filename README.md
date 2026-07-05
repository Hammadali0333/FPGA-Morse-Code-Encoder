# FPGA Morse Code Encoder using Verilog

## 📖 Overview

This project implements a **Morse Code Encoder** on the **Digilent Nexys 4 DDR FPGA Board** using **Verilog HDL**. The encoder converts decimal digits into Morse code and generates the corresponding sequence of dots (`.`) and dashes (`-`) on the FPGA LEDs with precise timing.

The design supports two operating modes:

- **Single Digit Mode** – Encodes one decimal digit (0–9).
- **Number Mode** – Encodes up to six decimal digits stored in a FIFO buffer.

The project demonstrates the practical implementation of **Finite State Machines (FSMs)**, **FIFO-based data storage**, **digital timing control**, and **real-time FPGA hardware implementation**.

---

# 🎯 Objectives

- Design a Morse Code Encoder using Verilog HDL.
- Implement a Finite State Machine (FSM) for control logic.
- Generate accurate Morse timing using FPGA clocks.
- Support both single-digit and multi-digit encoding.
- Validate the design through simulation and hardware implementation.

---

# ✨ Features

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

# 🛠 Hardware Platform

- Digilent Nexys 4 DDR FPGA Board
- Xilinx Vivado Design Suite

---

# 💻 Technologies Used

- Verilog HDL
- FPGA Design
- Finite State Machines (FSM)
- FIFO Memory
- Digital System Design
- Embedded Systems
- Xilinx Vivado

---

# 🎮 User Inputs

| Input | Function |
|-------|----------|
| SW0–SW3 | Binary digit input (0–9) |
| SW4 | Mode Selection |
| BTN0 | Reset |
| BTN1 | Store / Start |
| BTN2 | Encode Number |

---

# 🏗 System Architecture

The complete design consists of the following modules:

- Top Module
- Morse Encoder
- FIFO Buffer
- Finite State Machine
- Clock Divider
- Button Debouncer
- LED Output Controller

---

# ⚙️ Working Principle

1. User enters a decimal digit using switches.
2. The selected mode determines the encoding process.
3. The FSM reads and processes the input.
4. Digits are converted into Morse code.
5. The LED outputs display dots and dashes with accurate timing.
6. In Number Mode, multiple digits are stored inside the FIFO before encoding.

---

# 📂 Repository Structure

```text
FPGA-Morse-Code-Encoder
│
├── README.md
├── LICENSE
├── .gitignore
│
├── src/
│
├── testbench/
│
├── constraints/
│
├── docs/
│
├── waveforms/
│
└── images/
```

---

# 📊 System Block Diagram

> *(Upload your system block diagram inside the **images** folder.)*

![System Block Diagram](images/system_block_diagram.png)

---

# 📷 Hardware Implementation

The design was successfully implemented on the Digilent Nexys 4 DDR FPGA board.

![Hardware Demo](images/hardware_demo.jpg)

---

# 📈 Simulation Results

The design was verified using Xilinx Vivado Simulator.

### Phase 1 Simulation

![Phase 1](images/phase1_waveform.png)

---

### Phase 2 Simulation

![Phase 2](images/phase2_waveform.png)

---

### Number Mode Simulation

![Number Mode](images/phase2_6digit_waveform.png)

---

# 📋 Synthesis Results

The design was successfully synthesized and implemented using Xilinx Vivado.

The project meets timing requirements and demonstrates efficient FPGA resource utilization suitable for educational and embedded system applications.

*(Optional: Add screenshots of utilization reports or timing summary here.)*

---

# 📚 Learning Outcomes

This project enhanced my understanding of:

- FPGA Design Flow
- Verilog HDL
- Finite State Machine (FSM) Design
- FIFO Buffer Implementation
- Clock and Timing Control
- Hardware Debugging
- Digital Logic Design
- Embedded System Development

---

# 🚀 Future Improvements

- Support alphabetic characters (A–Z)
- UART Communication
- LCD Display Integration
- Seven Segment Display Output
- Adjustable Morse Transmission Speed
- Audio Buzzer Output
- Morse Decoder Implementation

---

# ▶️ How to Run

1. Open the project in **Xilinx Vivado**.
2. Synthesize the design.
3. Run Implementation.
4. Generate the Bitstream.
5. Program the Nexys 4 DDR FPGA board.
6. Use the switches and push buttons to enter digits and observe Morse code on the LEDs.

---

# 📄 Documentation

The complete project report is available in the **docs** folder.

---

# 👨‍💻 Author

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

---

⭐ **If you found this project useful, consider giving it a Star!**
