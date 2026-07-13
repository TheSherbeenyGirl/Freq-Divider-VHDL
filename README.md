# Freq-Divider-VHDL
# Clock Frequency Divider using VHDL

A parameterized clock frequency divider written in VHDL. The design accepts an input clock and generates a slower output clock by dividing the input frequency by any even number.

## Features

- Parameterized using a Generic (`DIVIDE_BY`)
- Supports division by any even number (2, 4, 6, 8, ...)
- Synchronous design
- Reset support
- Clean square-wave output
- Simulated using ModelSim

---

## Project Structure

```
.
├── freq_divider.vhd
├── README.md
└── Report VHDL Freq_Div.pdf
```

---

## Entity

```vhdl
entity freq_divider is
    generic (
        DIVIDE_BY : integer := 2
    );
    Port (
        clk     : in STD_LOGIC;
        reset   : in STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end freq_divider;
```

### Inputs

| Signal | Description |
|---------|-------------|
| `clk` | Input clock signal |
| `reset` | Active-high reset |

### Output

| Signal | Description |
|---------|-------------|
| `clk_out` | Divided clock output |

---

## How It Works

A counter increments on every rising edge of the input clock.

When the counter reaches:

```
DIVIDE_BY / 2 - 1
```

the output clock toggles and the counter resets.

This creates a square-wave output whose frequency is:

```
Output Frequency = Input Frequency / DIVIDE_BY
```

---

## Example

If

```
Input Clock = 100 MHz
DIVIDE_BY = 4
```

then

```
Output Clock = 25 MHz
```

---

## Simulation

Simulation was performed using **ModelSim**.

The waveform confirms that:

- `clk` toggles at the original frequency.
- `clk_out` toggles at exactly the divided frequency.
- Reset initializes the circuit correctly.

---

## Applications

- FPGA designs
- Digital timers
- UART baud rate generation
- Display controllers
- Embedded systems
- Clock management

---

## Tools Used

- VHDL
- ModelSim

---

## Authors

- Noura Hesham
- Mazen Sherif
- Yahia Abdelhalem
