extends State

@export var jump_state: State
@export var run_state: State


func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if parent.jump_buffer or Input.is_action_just_pressed("jump") :
		parent.jump_buffer = false
		#legs.stop()
		#arm.stop()
		return jump_state
	if get_movement_input() != Vector2.ZERO:
		return run_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity  = parent.velocity.lerp(Vector2.ZERO,parent.friction)
	return null
