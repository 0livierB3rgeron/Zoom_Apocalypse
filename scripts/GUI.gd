extends CanvasLayer

onready var kill = get_node("AspectRatioContainer/HBoxContainer/LabelKills")
onready var wave = get_node("AspectRatioContainer/HBoxContainer/LabelWave")
onready var hp = get_node("AspectRatioContainer/HBoxContainer/LabelHP")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	kill.set_text("Kill : " + str(get_parent().pts))
	wave.set_text("Vague : " + str(get_parent().wave))
	hp.set_text("HP : " + str(get_parent().get_parent().get_node("Player").hp))
