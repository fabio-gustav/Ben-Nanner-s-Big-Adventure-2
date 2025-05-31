extends State

@export var jump_state: State
@export var run_state: State
@export var idle_state: State

var finished : bool

func enter() -> void:
	super()
	finished = false
	parent.animation_player.play("light_punch")

func exit() -> void:
	finished = false

func process_input(_event: InputEvent) -> State:
	#Some sort of gatling system that stores next attack button
	return null

func process_physics(_delta: float) -> State:
	if finished:
		return idle_state
	return null

func attack_finished() -> void:
	finished = true
