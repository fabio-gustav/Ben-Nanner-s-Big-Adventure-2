extends State

@export var run_state: State
@export var attack_state: State
@export var hit_state: State

var detected = false

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	detected = false
	parent.detection_radius.monitoring = false
	parent.detection_radius.monitoring = true
	parent.animation_player.play("idle")

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	if detected:
		return run_state
	return null

func _on_detection_radius_area_entered(area : Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		detected = true


func _on_stopping_radius_area_exited(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		detected = true
