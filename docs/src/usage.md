📝 # Usage

## Initializing the Gridworld

To initialize a new Gridworld, use the `initialize_gridworld` function:

gridworld = initialize_gridworld((rows, cols); start_pos=nothing, goal_pos=nothing, hole_positions=nothing)

- `(rows, cols)`: A tuple specifying the number of rows and columns in the Gridworld.
- `start_pos`: (Optional) The starting position of the agent as a tuple `(row, col)`. If not provided, the default starting position is `(1, 1)`.
- `goal_pos`: (Optional) The goal position as a tuple `(row, col)`. If not provided, the default goal position is `(rows, cols)`.
- `hole_positions`: (Optional) An array of tuples representing the positions of holes in the Gridworld.

Example:

gridworld = initialize_gridworld((4, 4), start_pos=(2, 2), goal_pos=(4, 4), hole_positions=[(3, 3)])

## Moving the Agent

To move the agent in the Gridworld, use the `move_agent!` function:

new_gridworld = move_agent!(gridworld, direction; is_slippery=false)

- `gridworld`: The current Gridworld state.
- `direction`: The direction to move the agent. Possible values are `:up`, `:down`, `:left`, and `:right`.
- `is_slippery`: (Optional) A boolean indicating whether the movement is slippery. If `true`, there is a 20% chance of slipping to an adjacent cell. Default is `false`.

The function returns the new Gridworld state after moving the agent.

Example:

new_gridworld = move_agent!(gridworld, :right, is_slippery=true)

## Getting Available Actions

To get the available actions for the agent in the current Gridworld state, use the `get_available_actions` function:

actions = get_available_actions(gridworld)

- `gridworld`: The current Gridworld state.

The function returns an array of symbols representing the available actions (`:up`, `:down`, `:left`, `:right`).

Example:

actions = get_available_actions(gridworld)

## Rendering the Gridworld

To visualize the Gridworld, use the `render` function:

render(gridworld)

- `gridworld`: The current Gridworld state.

The function renders the Gridworld in the terminal using Unicode characters.

Example:

render(gridworld)

## Manual Mode

To play the Gridworld manually, use the `manual_mode` function:

manual_mode(gridworld; is_slippery=false)

- `gridworld`: (Optional) The initial Gridworld state. If not provided, a default 4x4 Gridworld will be created.
- `is_slippery`: (Optional) A boolean indicating whether the movement is slippery. Default is `false`.

In manual mode, you can control the agent using the keys `w` (up), `s` (down), `a` (left), and `d` (right). Press `q` to quit.

Example:

manual_mode(gridworld, is_slippery=true)
