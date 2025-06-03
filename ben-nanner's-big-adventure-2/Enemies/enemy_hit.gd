extends State

@export var run_state: State
@export var attack_state: State
@export var idle_state: State

var recovered = false

func enter() -> void:
	super()
	recovered = false
	parent.velocity = (parent.player.position - parent.position).normalized() * parent.speed * -1
	parent.animation_player.play("hit")
	parent.recovery_timer.start()

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	if (recovered == true):
		return idle_state
	return null

func _on_recovery_timer_timeout() -> void:
	recovered = true
