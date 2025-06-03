extends Node2D

@export var monkey_music: AudioStream
@export var no_monkey: AudioStream

var monkey_mode:bool = false

func _ready() -> void:
	if monkey_mode:
		MusicPlayer.play(monkey_music,true)
	else:
		MusicPlayer.play(no_monkey,true)
