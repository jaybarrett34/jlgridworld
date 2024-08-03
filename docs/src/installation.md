# Installation

## Using Gridworld as a Package

To use Gridworld in your Julia project, you can install it directly from GitHub using Julia's package manager. Open Julia's REPL and type:

using Pkg
Pkg.add(url="https://github.com/jaybarrett34/jlgridworld.git")

Then, in your Julia script or REPL, you can use the package by typing:

- using Gridworld

## Dependencies

Gridworld.jl has the following dependencies:

- REPL
- Random
- Term
- Test
- Documenter

These will be automatically installed when you add the package.

## Modifying the Repository Directly

If you want to modify the Gridworld package or contribute to its development, follow these steps:

1. Clone the repository:

- git clone https://github.com/jaybarrett34/jlgridworld.git

2. Navigate to the dir:

- cd jlgridworld

3. Activate the project environment:

- using Pkg
- Pkg.activate(".")

4. Install the dependencies

- Pkg.instantiate()

5. (Optional) To run test suite:

- Pkg.test()
