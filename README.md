# CAAL Mini Calculator (x86 Assembly)

A menu-based mini calculator and digit-to-binary converter written in 8086 assembly. Built as a semester 2 project for **Computer Architecture and Assembly Language (CAAL)**.

## Features

1. Add two digits
2. Subtract two digits (shows a minus sign if the result is negative)
3. Multiply two digits
4. Divide two digits (shows quotient and remainder, handles divide by zero)
5. Convert a digit (0-9) to 8-bit binary
6. Exit

The menu repeats until you choose Exit. Inputs are single digits (0-9).

## Sample Run

```
--- MINI CALCULATOR ---
1. Add
2. Subtract
3. Multiply
4. Divide
5. Digit to Binary
6. Exit
Choice: 4
Enter digit 1: 9
Enter digit 2: 4
Result: 02
Remainder: 01
```

## How to Run

1. Install and open **emu8086**.
2. Choose **New** and paste the contents of `calculator.asm`.
3. Click **Emulate**, then **Run**.

## CAAL Topics Covered

| Topic | Where it appears |
|---|---|
| Registers and data formats | AX, BL, BH, CX, DX hold numbers and results |
| Arithmetic operations | `add`, `sub`, `mul`, `div` |
| Control flow | `cmp`, `je`, `jl`, `jg`, `jae`, `jmp`, `loop` |
| Procedures and the stack | `call`, `ret`, `push`, `pop` |
| Input and output | `int 21h` (read a character, print a string or character) |
| Bitwise operations | `shl` and the carry flag for binary conversion |

## Program Structure

- `main` shows the menu and routes the choice.
- `get_digit` prints a prompt and reads one digit.
- `calc` handles options 1 to 4.
- `print_num` prints a number of up to two digits.
- `to_binary` prints a digit as 8 bits.

## Limitations

- Only single-digit input (0-9).
- Results are printed as up to two decimal digits.

## Author

Aun Haider Niazi - BS Information Engineering Technology, Foundation University Islamabad
