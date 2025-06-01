class_name LabelPicker
extends ActivatableControl

signal press

func _process(_delta: float) -> void:
	if is_active and Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("light_jump"):
		press.emit()
