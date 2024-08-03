# src/initialization.jl

function initialize_gridworld(size::Tuple{Int,Int}; start_pos=nothing, goal_pos=nothing, hole_positions=nothing)
    cells = [GridCell(i, j, :empty, 0.0, false) for i in 1:size[1], j in 1:size[2]]

    if start_pos === nothing
        start_pos = (1, 1)
    end
    cells[start_pos...] = GridCell(start_pos..., :start, 0.0, false)

    if goal_pos === nothing
        goal_pos = (size[1], size[2])
    end
    cells[goal_pos...] = GridCell(goal_pos..., :goal, 1.0, true)

    if hole_positions !== nothing
        for pos in hole_positions
            cells[pos...] = GridCell(pos..., :hole, 0.0, true)
        end
    end

    GridworldState(size, cells, cells[start_pos...], false)
end