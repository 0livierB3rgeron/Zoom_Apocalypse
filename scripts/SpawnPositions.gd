extends Node2D

var Ennemi = preload("res://scenes/Slime.tscn")
onready var spawns = [$spawn1, $spawn2, $spawn3, $spawn4, $spawn5, $spawn6, $spawn7, $spawn8, $spawn9, $spawn10, $spawn11, $spawn12] 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _spawnTheSlime():
	for spawn in spawns:
		var slime = Ennemi.instance()
		slime.set("position", spawn.position)
		get_parent().add_child(slime)
		
		
		



