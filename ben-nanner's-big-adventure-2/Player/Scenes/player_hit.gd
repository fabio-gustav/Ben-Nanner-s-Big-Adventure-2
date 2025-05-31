extends State

@export var jump_state: State
@export var run_state: State

#PLay hit animation and lock up until animation ends, maybe some invul frames at the end? idk

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") :
		#parent.jump_buffer = false
		parent.ground_level = parent.position.y
		return jump_state
	if get_movement_input() != Vector2.ZERO:
		return run_state
	return null

func process_physics(_delta: float) -> State:
	return null
