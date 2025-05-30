extends CharacterBody2D


@export var health : int = 15
@export var damage : int = 3
@export var speed : float = 50
@export var friction : float = 0.05
@export var acceleration : float = 0.15

@onready var state_machine = $MovementStateMachine
@onready var player_move_component: Node = $PlayerMoveComponent

@onready var jump_buffer : bool

func _ready() -> void:
	jump_buffer = false
	state_machine.init(self,player_move_component)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func on_jump_buffer_timeout()->void:
	jump_buffer = false
