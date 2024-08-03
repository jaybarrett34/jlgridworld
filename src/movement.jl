# src/movement.jl

function move_agent_regular!(gridworld::GridworldState, direction::Symbol)
    row, col = gridworld.agent_pos.row, gridworld.agent_pos.col

    moves = Dict(
        :up => (-1, 0),
        :down => (1, 0),
        :left => (0, -1),
        :right => (0, 1)
    )

    if haskey(moves, direction)
        dr, dc = moves[direction]
        new_row, new_col = row + dr, col + dc

        if 1 <= new_row <= gridworld.size[1] && 1 <= new_col <= gridworld.size[2]
            new_cell = gridworld.cells[new_row, new_col]
            gridworld.agent_pos = new_cell
            gridworld.done = new_cell.is_terminal
            return new_cell.cell_type, new_cell.reward, gridworld.done
        end
    end

    return :invalid_move, 0.0, false
end

function move_agent_slippery!(gridworld::GridworldState, direction::Symbol)
    row, col = gridworld.agent_pos.row, gridworld.agent_pos.col

    moves = Dict(
        :up => [(-1, 0), (-1, -1), (-1, 1)],
        :down => [(1, 0), (1, -1), (1, 1)],
        :left => [(0, -1), (-1, -1), (1, -1)],
        :right => [(0, 1), (-1, 1), (1, 1)]
    )

    if haskey(moves, direction)
        move = rand(moves[direction])
        dr, dc = move
        new_row, new_col = row + dr, col + dc

        if 1 <= new_row <= gridworld.size[1] && 1 <= new_col <= gridworld.size[2]
            new_cell = gridworld.cells[new_row, new_col]
            gridworld.agent_pos = new_cell
            gridworld.done = new_cell.is_terminal
            return new_cell.cell_type, new_cell.reward, gridworld.done
        end
    end

    return :invalid_move, 0.0, false
end

function step(gridworld::GridworldState, direction::Symbol; is_slippery=false)
    new_gridworld = copy_state(gridworld)
    if is_slippery && rand() < 0.2
        cell_type, reward, done = move_agent_slippery!(new_gridworld, direction)
    else
        cell_type, reward, done = move_agent_regular!(new_gridworld, direction)
    end
    return new_gridworld, cell_type, reward, done
end

function get_available_actions(gridworld::GridworldState)
    row, col = gridworld.agent_pos.row, gridworld.agent_pos.col
    actions = Symbol[]

    if row > 1
        push!(actions, :up)
    end
    if row < gridworld.size[1]
        push!(actions, :down)
    end
    if col > 1
        push!(actions, :left)
    end
    if col < gridworld.size[2]
        push!(actions, :right)
    end

    return actions
end

function move_agent!(gridworld::GridworldState, direction::Symbol; is_slippery=false)
    if gridworld.done
        return gridworld
    end
    new_gridworld, _, _, _ = step(gridworld, direction; is_slippery=is_slippery)
    return new_gridworld
end