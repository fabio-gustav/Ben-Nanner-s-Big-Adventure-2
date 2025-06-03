extends Node2D

@export var player : Player

var enemies = []
var markers = []
var currentStage = 0
var stageTracker : StageMarker

func _ready() -> void:
	pass

func addMarker(stage : StageMarker ):
	markers.append(stage)

func addEnemy(n : Node):
	enemies.append(n)
	
func _process(delta: float) -> void:
	checkMarkers()
	checkCurrentStagePassed()
			
func checkMarkers():
	for s in markers:
		if(s.activated == true):
			currentStage = s.stageNumber
			stageTracker = s
			activateEnemyGroup()
			s.activated = false # to save on processing power
			SignalBus.camera_transition.emit(false)
			
func activateEnemyGroup():
	for e in enemies:
		if(e.groupNumber == currentStage):
			e.visible = true
			e.process_mode = PROCESS_MODE_INHERIT

func checkCurrentStagePassed():
	for e in enemies:
		if (e.dead):
			enemies.erase(e)#modifing an array here is bad, but should be fine since we call this function so much
	var passed = true
	for e in enemies:
		if(e.groupNumber == currentStage):
			passed = false
	if(passed && stageTracker != null):
		markers.erase(stageTracker)
		stageTracker = null
		SignalBus.camera_transition.emit(true)
