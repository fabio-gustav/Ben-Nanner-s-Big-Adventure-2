class_name Collectible
extends Area2D

const GRAVITY := 600.0

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var collectible_sprite : Area2D = $CollectibleSprite

@export var speed : float
@export var knockdown_intensity : float

enum State {FALL, GROUNDED, FLY}

var anim_map := {
	State.FALL: "fall",
	State.GROUNDED: "grounded",
	State.FLY: "fly",
}
var height := 0.0
var height_speed := 0.0
var state = State.FALL

func _ready() -> void:
	height = knockdown_intensity

func _process(delta: float) -> void:
	handle_fall(delta)
	handle_animations()
	collectible_sprite.postion = Vector2.UP * height
	
func handle_animations() -> void:
	animation_player.play(anim_map[state])

func handle_fall(delta: float) -> void:
	if state == State.FALL:
		height += height_speed * delta
		if height < 0:
			height = 0
			state = State.GROUNDED
		else:
			height_speed -= GRAVITY * delta
