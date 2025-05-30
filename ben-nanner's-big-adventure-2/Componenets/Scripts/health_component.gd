extends Node

class_name HealthComponent

@export var MAX_HEALTH := 10.0
@export var health : float


func _ready() -> void:
	health = MAX_HEALTH


#func damage(attack: Attack):
	#health -= attack.attack_damage
	##PlayerVariables.health = health
	#SignalBus.health_changed.emit(health)
	#if health <= 0:
		#get_parent().death()
