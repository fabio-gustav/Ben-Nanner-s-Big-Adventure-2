extends State

@export var idle_state: State
@export var attack_state: State
@export var hit_state: State

var stopped = false
var inRange = false

func enter() -> void:
	super()
	stopped = false
	inRange = false
	parent.animation_player.play("run")

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	if inRange:
		parent.velocity = Vector2.ZERO
		return attack_state
	if !stopped:
		parent.velocity = (parent.player.position - parent.position).normalized() * parent.speed
	else:
		return idle_state 
	return null
	
func _on_detection_radius_area_entered(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		stopped = false
	
func _on_detection_radius_area_exited(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		stopped = true

func _on_stopping_radius_area_entered(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		stopped = true
		inRange = true


func _on_stopping_radius_area_exited(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		stopped = false
		inRange = false
