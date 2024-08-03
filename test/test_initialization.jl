using Test
using Gridworld

@testset "Gridworld Initialization" begin
    gridworld = initialize_gridworld((4, 4))
    @test gridworld.size == (4, 4)
    @test gridworld.cells[1, 1].cell_type == :start
    @test gridworld.cells[4, 4].cell_type == :goal
    @test gridworld.agent_pos.row == 1
    @test gridworld.agent_pos.col == 1
    
    # Additional initialization tests
    gridworld_with_hole = initialize_gridworld((5, 5), hole_positions=[(3, 3)])
    @test gridworld_with_hole.cells[3, 3].cell_type == :hole
    
    custom_start_goal = initialize_gridworld((6, 6), start_pos=(2, 2), goal_pos=(5, 5))
    @test custom_start_goal.cells[2, 2].cell_type == :start
    @test custom_start_goal.cells[5, 5].cell_type == :goal
end