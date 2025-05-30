extends State

@export var idle_state : State
@export var run_state : State

#@onready var jumpVelocity:float
#@onready var jumpGravity:float

#func init() -> void:
	#jumpVelocity = ((2.0 * parent.jumpHeight) / parent.risingJumpTime) * -1.0
	#jumpGravity = ((-2.0 * parent.jumpHeight) / (parent.jump_time * parent.jump_time)) * -1.0
#
#func enter():
	#super()
	#parent.parry_available = true
	#parent.velocity.y += jumpVelocity
	#parent.jump_available = false
	#
#func exit():
	#parent.velocity.y = 0.0
	#jumpGravity = ((-2.0 * parent.jumpHeight) / (parent.risingJumpTime * parent.risingJumpTime)) * -1.0
#
#func process_input(event: InputEvent) -> State:
	#return null
#
#func process_physics(delta: float) -> State:
	#parent.velocity.y += jumpGravity * delta
	#
	##if !Input.is_action_pressed("jump"):
		##jumpGravity = ((-6.0 * parent.jumpHeight) / (parent.risingJumpTime * parent.risingJumpTime)) * -1.0
	#return null
