extends Node2D

var Ennemi = preload("res://scenes/Slime.tscn")
onready var spawns = [$spawn1, $spawn2, $spawn3, $spawn4, $spawn5, $spawn6, $spawn7, $spawn8, $spawn9, $spawn10, $spawn11, $spawn12] 
onready var timer = $RespawnTimer
var respawnPossible = true
var current_wave
var round_send = 0
# Called when the node enters the scene tree for the first time.
	
func _spawnWave(wave):
	current_wave=wave
	timer.start()


func _on_RespawnTimer_timeout():
	_wave()
	current_wave -= 1
	if(current_wave>0):
		timer.start()
		print("sending: ",current_wave)
		
func _wave():
	for spawn in spawns:
		var slime = Ennemi.instance()
		slime.set("position", spawn.position)
		get_parent().add_child(slime)
