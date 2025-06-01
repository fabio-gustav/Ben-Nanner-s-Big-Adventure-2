extends State

@export var grounded_state: State


func enter() -> void:
	super()
	parent.animation_player.play("falling")

func exit() -> void:
	parent.animation_player.stop(false)

func process_physics(_delta: float) -> State:
	parent.height += parent.fall_speed * _delta
	if parent.height < 0:
		parent.height = 0
		return grounded_state
	else:
		parent.fall_speed -= parent.GRAVITY * _delta
	return null
