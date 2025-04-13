# Assembly-Sudoku
Assembly Language Sudoku Game – A classic Sudoku puzzle game implemented entirely in x86 assembly language. This project showcases low-level programming techniques, including handling user input, drawing the Sudoku grids 9x9 and 4x4 , and implementing game logic without relying on high-level libraries .

The game is designed to run on x86 architecture, showcasing the capabilities of assembly language in game development.

## Features

- **Phase I**: Displays a static Sudoku grid.
- **Phase II**: Full game functionality including:
  - User input for placing numbers.
  - Grid updating based on user interaction.
  - Basic validation of Sudoku rules (e.g., no duplicate numbers in rows, columns, or regions).
- **Assembly Code**: The game is written in x86 assembly language using NASM assembler.

## Prerequisites

- **NASM**: The assembler used for compiling the code.
  - You can download it from [NASM official website](https://www.nasm.us/).
- **x86 Emulator/Environment**: This project is built for x86 architecture and requires an emulator or a compatible environment to run.

## Installation

To compile and run the game, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/maziahhasan/Assembly-Sudoku.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Assembly-Sudoku
   ```

3. Compile the assembly code using NASM:
   ```bash
   nasm -f elf64 -o FINSUDOKU.o FINSUDOKU.asm
   ```

4. Link the object file to create the executable:
   ```bash
   ld -o FINSUDOKU FINSUDOKU.o
   ```

5. Run the game:
   ```bash
   ./FINSUDOKU
   ```

## Usage

Once the game is running, you will see the Sudoku grid displayed. You can enter numbers into the grid as per the rules of Sudoku. Phase II allows you to interact with the game, while Phase I is purely for displaying the grid.

## Contributing

If you'd like to contribute to the project, feel free to open issues or submit pull requests. Contributions are welcome to improve the gameplay experience or enhance the code.

