extends Node2D

var wave  = 1
var pts = 0
var ennemiKilled = 0
var ennemiPerWave = 1
onready var spawnerEnnemiWave = $SpawnPositions
onready var timer = $WaveStartTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

func _process(delta):
	if ennemiKilled >= ennemiPerWave:
		_wave_manager()
		

	
func _slimeDead():
	pts += 1
	ennemiKilled +=1

func _wave_manager():
	wave = wave+1
	ennemiKilled=0
	spawnerEnnemiWave._spawnWave(wave)
	ennemiPerWave+=12


func _on_WaveStartTimer_timeout():
	spawnerEnnemiWave._spawnWave(wave)
