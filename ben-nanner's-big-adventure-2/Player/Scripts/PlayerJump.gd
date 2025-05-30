extends State

@export var idle_state : State
@export var run_state : State


func enter():
	super()
	parent.player_collider.disabled = true
	parent.velocity.y = parent.jump_velocity
	parent.position.y -= 1
	
func exit():
	parent.position.y = parent.ground_level
	parent.player_collider.disabled = false

func process_input(_event: InputEvent) -> State:
	return null
#
func process_physics(_delta: float) -> State:
	parent.velocity.y += parent.gravity * _delta
	if parent.position.y >= parent.ground_level:
		parent.velocity.y = 0.0
		return run_state
	return null
