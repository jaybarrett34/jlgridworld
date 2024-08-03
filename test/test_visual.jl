using Test
using Gridworld
using Gridworld: render

@testset "Gridworld Visualization" begin   
    # Test render function
    gridworld = initialize_gridworld((3, 3), hole_positions=[(2, 2)])
    
    # Capture the output of render function
    output = sprint(render, gridworld)
    
    # Define expected output
    expected_output = "🟦⬜⬜\n⬜⚪⬜\n⬜⬜🟩\n"
    
    @test output == expected_output
    
    # Move agent and test again
    gridworld = move_agent!(gridworld, :down)
    
    output = sprint(render, gridworld)
    
    expected_output = "🟨⬜⬜\n🟦⚪⬜\n⬜⬜🟩\n"
    
    @test output == expected_output
    
    # Move agent to goal and test
    gridworld.agent_pos = gridworld.cells[3, 3]
    
    output = sprint(render, gridworld)
    
    expected_output = "🟨⬜⬜\n⬜⚪⬜\n⬜⬜🟦\n"
    
    @test output == expected_output
end