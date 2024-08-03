using REPL.TerminalMenus

function manual_mode(gridworld::GridworldState=initialize_gridworld(4, 4); is_slippery=false)
    total_reward = 0

    while !gridworld.done
        render(gridworld)
        println("Use w(up), s(down), a(left), d(right) to move. Press 'q' to quit.")
        println("Current position reward: $(gridworld.agent_pos.reward)")
        println("Total reward: $total_reward")

        key = lowercase(first(readline()))
        if key == 'q'
            break
        end

        direction = get_direction(key)
        if direction !== nothing
            new_gridworld, _, reward, _ = step(gridworld, direction; is_slippery=is_slippery)
            gridworld = new_gridworld
            total_reward += reward
            println("Moved to $(gridworld.agent_pos.cell_type) cell. Reward: $reward. Done: $(gridworld.done)")
        else
            println("Invalid input. Please use w, s, a, or d for movement.")
        end

        clear_screen()
    end

    println("Episode finished!")
    println("Total reward: $total_reward")
end

function get_direction(key::Char)
    if key == 'w'
        return :up
    elseif key == 's'
        return :down
    elseif key == 'a'
        return :left
    elseif key == 'd'
        return :right
    end
    return nothing
end

function clear_screen()
    print("\x1b[2J") 
    print("\x1b[H") 
end