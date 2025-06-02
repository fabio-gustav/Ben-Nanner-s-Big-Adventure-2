extends Area2D


func _on_area_entered(area: Area2D) -> void:
	SignalBus.emit_signal("camera_transition",false)
	print("sending")
	queue_free()
