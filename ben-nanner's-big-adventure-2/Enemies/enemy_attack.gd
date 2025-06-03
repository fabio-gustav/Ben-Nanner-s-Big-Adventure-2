extends State

@export var idle_state: State
@export var run_state: State
@export var hit_state: State

var finished : bool
var inRange : bool

func enter() -> void:
	super()
	parent.animation_player.play("idle")
	parent.attack_speed.start()
	inRange = true

func exit() -> void:
	inRange = false
	parent.attack_speed.stop()

func process_input(_event: InputEvent) -> State:
	return null
	
func process_physics(_delta: float) -> State:
	if !inRange:
		return idle_state
	return null


func _on_attack_speed_timeout() -> void:
	parent.animation_player.play("attack")


func _on_stopping_radius_area_exited(area: Area2D) -> void:
	if(area == parent.player.hurtbox_component):
		inRange = false
		
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "attack"):
		parent.animation_player.play("idle")
