# src/types.jl

mutable struct GridCell
    row::Int
    col::Int
    cell_type::Symbol
    reward::Float64
    is_terminal::Bool
end

mutable struct GridworldState
    size::Tuple{Int,Int}
    cells::Matrix{GridCell}
    agent_pos::GridCell
    done::Bool
end

function copy_state(gridworld::GridworldState)
    new_cells = deepcopy(gridworld.cells)
    new_agent_pos = new_cells[gridworld.agent_pos.row, gridworld.agent_pos.col]
    return GridworldState(gridworld.size, new_cells, new_agent_pos, gridworld.done)
end

function is_terminal(gridworld::GridworldState)
    return gridworld.done
end