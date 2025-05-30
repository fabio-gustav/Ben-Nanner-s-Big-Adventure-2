extends Node


@export var intitialState : State

var current_state: State
var process_state: State

# state_machine.gd

func init(parent: CharacterBody2D, move_component: Node) -> void:
	for child in get_children():
		child.parent = parent
		child.move_component = move_component
		child.init()
	
	change_state(intitialState)

func change_state(new_state: State) -> void:
	print("C: " + str(current_state) + ", N: " + str(new_state))
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

func process_physics(delta: float) -> void:
	process_state = current_state.process_physics(delta)
	if process_state:
		change_state(process_state)

func process_input(event: InputEvent) -> void:
	process_state = current_state.process_input(event)
	if process_state:
		change_state(process_state)

func process_frame(delta: float) -> void:
	process_state = current_state.process_frame(delta)
	if process_state:
		change_state(process_state)
