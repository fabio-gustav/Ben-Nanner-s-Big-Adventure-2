extends Area2D

var attack:Attack = Attack.new()
 #TODO Add some sort of pooling for attack objects so you can use multiple
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack.attack_damage = 1
	attack.attack_position = position
	attack.knockback_force = 0

func _on_area_entered(area: Area2D) -> void:
	area.damage(attack)


func _on_attacking_melee_attack() -> void:
	monitoring = true
 
