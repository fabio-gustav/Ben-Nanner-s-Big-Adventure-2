extends State

@export var jump_state: State
@export var idle_state: State

func enter():
	super()

func exit():
	pass

func process_input(event: InputEvent) -> State:
	if parent.jump_buffer or Input.is_action_just_pressed("jump") :
		parent.jump_buffer = false
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity = parent.velocity.lerp(get_movement_input()*parent.speed,parent.acceleration)
	
	if get_movement_input() == Vector2.ZERO:
		parent.velocity.x  = lerp(parent.velocity.x, 0.0, parent.friction)
		pass
	return null
