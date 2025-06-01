extends State

@export var grounded_state: State


func enter() -> void:
	super()

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
