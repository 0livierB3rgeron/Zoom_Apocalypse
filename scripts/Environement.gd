extends Node2D

var wave  = 1
var pts = 0
onready var spawnerEnnemiWave = $SpawnPositions

onready var timer = $WaveTimer
onready var ennemis = get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()# Replace with function


func _process(delta):
	print(pts)
		
func _on_WaveTimer_timeout():
	spawnerEnnemiWave._spawnTheSlime()
	
func _slimeDead():
	pts += 1
