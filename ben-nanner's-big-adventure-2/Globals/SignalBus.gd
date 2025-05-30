extends Node

#called to move to a new scene with scene_transtion and a fade to black, level is the filepath of the scene you want to transition to
signal sceneTransition(level)

#to be called both before and after a scene starts and ends loading to know when to fade to black and back out
signal loading()

#called when diolog is finished playing
signal dialog_finished()

signal health_changed(health)
