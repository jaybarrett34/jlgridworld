using Test
using Gridworld
using Random

@testset "Gridworld Movement" begin
    gridworld = initialize_gridworld((4, 4))

    # Test moving down
    gridworld = move_agent!(gridworld, :down)
    @test gridworld.agent_pos.row == 2
    @test gridworld.agent_pos.col == 1
    @test !gridworld.done

    # Test moving right
    gridworld = move_agent!(gridworld, :right)
    @test gridworld.agent_pos.row == 2
    @test gridworld.agent_pos.col == 2
    @test !gridworld.done

    # Test moving up
    gridworld = move_agent!(gridworld, :up)
    @test gridworld.agent_pos.row == 1
    @test gridworld.agent_pos.col == 2
    @test !gridworld.done

    # Test moving left
    gridworld = move_agent!(gridworld, :left)
    @test gridworld.agent_pos.row == 1
    @test gridworld.agent_pos.col == 1
    @test !gridworld.done

    # Test moving into a hole
    gridworld = initialize_gridworld((4, 4), hole_positions=[(2, 2)])
    new_gridworld = move_agent!(gridworld, :down)
    @test !new_gridworld.done
    new_gridworld = move_agent!(new_gridworld, :right)
    @test new_gridworld.agent_pos.row == 2
    @test new_gridworld.agent_pos.col == 2
    @test new_gridworld.done

    # Test moving out of bounds
    gridworld = initialize_gridworld((4, 4))
    new_gridworld = move_agent!(gridworld, :up)
    @test new_gridworld.agent_pos.row == 1
    @test new_gridworld.agent_pos.col == 1
    @test !new_gridworld.done

end

@testset "Available Actions" begin
    gridworld = initialize_gridworld((4, 4))

    # Test available actions at the start position
    actions = get_available_actions(gridworld)
    @test :down in actions
    @test :right in actions
    @test :up ∉ actions
    @test :left ∉ actions

    # Test available actions at the goal position
    gridworld.agent_pos = gridworld.cells[4, 4]
    actions = get_available_actions(gridworld)
    @test :up in actions
    @test :left in actions
    @test :down ∉ actions
    @test :right ∉ actions

    # Test available actions near a hole
    gridworld = initialize_gridworld((4, 4), hole_positions=[(3, 2)])
    gridworld.agent_pos = gridworld.cells[2, 2]
    actions = get_available_actions(gridworld)
    @test Set(actions) == Set([:up, :down, :left, :right])
end

@testset "Slippery Movement" begin
    gridworld = initialize_gridworld((5, 5))
    
    new_gridworld = move_agent!(gridworld, :down, is_slippery=false)
    @test !new_gridworld.done

    Random.seed!(123)
    gridworld = initialize_gridworld((5, 5))
    positions = Tuple{Int, Int}[]
    
    for _ in 1:100
        new_gridworld = move_agent!(gridworld, :down, is_slippery=true)
        push!(positions, (new_gridworld.agent_pos.row, new_gridworld.agent_pos.col))
        gridworld.agent_pos = gridworld.cells[1, 1]
    end

    @test length(unique(positions)) > 1

    @test (2, 1) in positions  

    @test (2, 2) in positions || (2, 1) in positions
    @test (2, 1) in positions || (2, 2) in positions
end