class_name Collectible
extends Area2D

const GRAVITY := 600.0

@export var speed : float

enum State {FALL, GROUNDED, FLY}

var anim_map := {
	State.FALL: "fall",
	State.GROUNDED: "grounded",
	State.FLY: "fly",
}
var height := 0.0
var height_spread := 0.0
var state = State.FALL
