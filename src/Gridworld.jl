module Gridworld

using REPL.TerminalMenus

include("types.jl")
include("initialization.jl")
include("movement.jl")
include("visualization.jl")
include("manual_mode.jl")

export GridCell, GridworldState
export initialize_gridworld, move_agent!, get_available_actions
export render
export manual_mode

end