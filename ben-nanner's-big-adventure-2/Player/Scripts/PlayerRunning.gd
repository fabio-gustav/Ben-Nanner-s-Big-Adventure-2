extends State

@export var jump_state: State
@export var idle_state: State
@export var attack_state: State

func enter():
	super()

func exit():
	pass

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") :
		#parent.jump_buffer = false
		parent.ground_level = parent.position.y
		return jump_state
	if Input.is_action_just_pressed("light_punch"):
		return attack_state
	return null

func process_physics(_delta: float) -> State:
	parent.velocity = parent.velocity.lerp(get_movement_input()*parent.speed,parent.acceleration)
	if get_movement_input() == Vector2.ZERO:
		parent.velocity.x  = lerp(parent.velocity.x, 0.0, parent.friction)
	if parent.velocity.length() < 0.01:
		return idle_state 
	return null
