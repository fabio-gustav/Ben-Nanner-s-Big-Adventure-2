class_name OptionsScreen
extends Control

@onready var music_control : ActivatableControl = $Background/MarginContainer/VBoxContainer/MusicVolumeControl
@onready var sfx_control : ActivatableControl = $Background/MarginContainer/VBoxContainer/SoundVolumeControl
@onready var shake_control : ActivatableControl = $Background/MarginContainer/VBoxContainer/ShakeToggle
@onready var return_control : ActivatableControl = $Background/MarginContainer/VBoxContainer/ReturnButton
@onready var activables : Array[ActivatableControl] = [music_control, sfx_control, shake_control, return_control]


var current_selection_index := 0

func _ready() -> void:
	refresh()

func refresh() -> void:
	for i in range(0,  activables.size()):
		activables[i].set_active(current_selection_index == i)


func _process(_delta: float) -> void:
	handle_input()
	
func handle_input() -> void:
	if Input.is_action_just_pressed("ui_down"):
		current_selection_index = clampi(current_selection_index + 1, 0, activables.size() - 1)
	refresh()
	if Input.is_action_just_pressed("ui_up"):
		current_selection_index = clampi(current_selection_index - 1, 0, activables.size() - 1)
	refresh()
