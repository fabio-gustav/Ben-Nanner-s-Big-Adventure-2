class_name collectible
extends Area2D

@export var speed : float
@export var knockdown_intensity : float

@onready var collider: CollisionShape2D = $Collider
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_component: Area2D = $AttackComponent
@onready var state_machine: Node = $StateMachine

const GRAVITY := 600.0

var height := 0.0
var fall_speed := 10.0

func _ready() -> void:
	state_machine.init(self,null)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(_event: InputEvent) -> void:
	state_machine.process_input(_event)
