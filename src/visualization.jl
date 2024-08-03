# src/visualization.jl

function render(io::IO, gridworld::GridworldState)
    for row in 1:gridworld.size[1]
        for col in 1:gridworld.size[2]
            cell = gridworld.cells[row, col]
            if row == gridworld.agent_pos.row && col == gridworld.agent_pos.col
                print(io, "🟦")
            elseif cell.cell_type == :start
                print(io, "🟨")
            elseif cell.cell_type == :goal
                print(io, "🟩")
            elseif cell.cell_type == :hole
                print(io, "⚪")
            else
                print(io, "⬜") 
            end
        end
        println(io)
    end
end

render(gridworld::GridworldState) = render(stdout, gridworld)