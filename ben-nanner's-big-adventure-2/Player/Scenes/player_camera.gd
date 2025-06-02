extends Camera2D

@export var target : CharacterBody2D
@export var target_offset := 150

var following := true

func _ready() -> void:
	SignalBus.connect("camera_transition",follow)

func _process(delta: float) -> void:
	if following:
		if target.position.x + target_offset > position.x:
			position.x = target.position.x + target_offset

func follow(new_state:bool):
	following = new_state
