using Documenter
push!(LOAD_PATH,"../src/")
using Gridworld

makedocs(
    sitename = "Gridworld",
    format = Documenter.HTML(),
    modules = [Gridworld],
    pages = [
        "Home" => "index.md",
        "Installation" => "installation.md",
        "Usage" => "usage.md",
    ]
)

deploydocs(
    repo = "https://github.com/jaybarrett34/jlgridworld.git",
)