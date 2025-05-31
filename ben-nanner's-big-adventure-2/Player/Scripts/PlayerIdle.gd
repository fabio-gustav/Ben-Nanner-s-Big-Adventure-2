extends State

@export var jump_state: State
@export var run_state: State
@export var attack_state: State


func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	parent.animation_player.play("idle")

func exit() -> void:
	print("exiting")
	parent.animation_player.stop(false)

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		#parent.jump_buffer = false
		parent.ground_level = parent.position.y
		return jump_state
	if Input.is_action_just_pressed("light_punch"):
		return attack_state
	if get_movement_input() != Vector2.ZERO:
		return run_state
	if Input.is_action_just_pressed("talk"):
		if Dialogic.current_timeline != null:
			return
		Dialogic.start('test_timeline')
	return null

func process_physics(_delta: float) -> State:
	return null
