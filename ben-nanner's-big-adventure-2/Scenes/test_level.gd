extends Node2D

@onready var player: CharacterBody2D = $"World Objects/Player"
@onready var camera_2d: Camera2D = $Camera2D


func _process(_delta: float) -> void:
	if player.position.x > camera_2d.position.x:
		camera_2d.position.x = player.position.x
