extends CharacterBody2D
class_name Player

@export var health : int = 15
@export var damage : int = 3
@export var speed : float = 50
@export var friction : float = 0.05
@export var acceleration : float = 0.15
@export var jump_height : float = 20
@export var jump_time : float = 1.0

@onready var state_machine = $MovementStateMachine
@onready var player_move_component: Node = $PlayerMoveComponent
@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var player_collider: CollisionShape2D = $PlayerCollider
@onready var health_component: HealthComponent = $HealthComponent
@onready var attack_component: Area2D = $AttackComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@onready var jump_buffer : bool
@onready var ground_level : float
@onready var jump_velocity = ((2.0 * jump_height) / jump_time) * -1.0
@onready var gravity = ((-2.0 * jump_height) / (jump_time * jump_time)) * -1.0


func _ready() -> void:
	PlayerVariables.health = health_component.MAX_HEALTH
	PlayerVariables.max_health = health_component.MAX_HEALTH
	SignalBus.health_changed.emit(health)
	jump_buffer = false
	ground_level = position.y
	state_machine.init(self,player_move_component)
	attack_component.monitorable = false

func _physics_process(_delta: float) -> void:
	state_machine.process_physics(_delta)
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	state_machine.process_input(_event)

func _process(_delta: float) -> void:
	state_machine.process_frame(_delta)
	flip_sprites()

func on_jump_buffer_timeout()->void:
	jump_buffer = false


func flip_sprites() -> void:
	if velocity.x > 0.0 and character_sprite.flip_h == true:
		character_sprite.flip_h = false
		attack_component.scale.x = 1
	elif  velocity.x < 0.0 and character_sprite.flip_h == false:
		character_sprite.flip_h = true
		attack_component.scale.x = -1
		
