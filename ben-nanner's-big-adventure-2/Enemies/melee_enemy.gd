extends CharacterBody2D

@export var player : Player
@export var playerAttack : State

@export var damage : int = 3
@export var speed : float = 50
@export var friction : float = 0.05
@export var acceleration : float = 0.15
@export var attackSpeed : float = 0.5
@export var recoveryTime : float = 0.5

@onready var state_machine = $MovementStateMachine
@onready var enemy_move_component: Node = $EnemyMoveComponent
@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var enemy_collider: CollisionShape2D = $EnemyCollider
@onready var health_component: HealthComponent = $HealthComponent
@onready var attack_component: Area2D = $AttackComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var detection_radius : Area2D = $DetectionRadius
@onready var stopping_radius : Area2D = $StoppingRadius
@onready var attack_speed : Timer = $AttackSpeed
@onready var hurtbox_component : Area2D = $HurtboxComponent
@onready var recovery_timer : Timer = $RecoveryTimer
@onready var state_hit : State = $MovementStateMachine/EnemyHit

var past_health = 0
var current_health = 0

func _ready() -> void:
	past_health = health_component.health
	current_health = health_component.health
	state_machine.init(self,enemy_move_component)
	attack_speed.wait_time = attackSpeed
	recovery_timer.wait_time = recoveryTime

func _physics_process(_delta: float) -> void:
	state_machine.process_physics(_delta)
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	state_machine.process_input(_event)

func _process(_delta: float) -> void:
	state_machine.process_frame(_delta)
	flip_sprites()
	current_health = health_component.health
	if(current_health - past_health < 0 ):
		hit()

func flip_sprites() -> void:
	if velocity.x > 0.0 and character_sprite.flip_h == true:
		character_sprite.flip_h = false
		attack_component.scale.x = attack_component.scale.x * -1
		stopping_radius.scale.x = stopping_radius.scale.x * -1
	elif  velocity.x < 0.0 and character_sprite.flip_h == false:
		character_sprite.flip_h = true
		attack_component.scale.x = attack_component.scale.x * -1
		stopping_radius.scale.x = stopping_radius.scale.x * -1
		
func hit() -> void:
	state_machine.change_state(state_hit)
	past_health = current_health
		
