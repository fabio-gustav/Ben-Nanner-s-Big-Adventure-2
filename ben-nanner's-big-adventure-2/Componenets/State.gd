class_name State
extends Node

@onready var parent: CharacterBody2D

var move_component

func init() -> void:
	pass

func enter() -> void:
	#parent.animations.play(animation_name)
	pass
	
func exit():
	pass
	
func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null

func get_movement_input() -> Vector2:
	return move_component.get_movement_direction()
