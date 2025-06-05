extends Area2D
class_name StageMarker

@export var stageNumber : int
var activated = false

func _ready() -> void:
	print(get_parent())
	print(get_parent().player)
	print(get_parent().player.hurtbox_component)
	pass
	
func _on_area_entered(area: Area2D) -> void:
	if(area == get_parent().player.hurtbox_component):
		activated = true
	
func _on_tree_entered() -> void:
	get_parent().markers.append(self)
