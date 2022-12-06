extends Node2D

onready var environement = $Environement
onready var player = $Player
onready var music = $AudioStreamPlayer

func _level_end():
	self.queue_free()
	get_tree().change_scene("res://scenes/Menu Fin.tscn")
