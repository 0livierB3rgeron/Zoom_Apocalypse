extends KinematicBody2D

export var speed = 80
export var friction = 0.18
export var acceleration = 0.1
var bullet_speed= 2000

var velocity = Vector2()
var current_animation = "idle_down"

onready var attack_cooldown = $Timer
onready var BULLET = preload("res://scenes/Projectile.tscn")
onready var animated_body = $AnimatedSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	var direction = get_input()
	deplacer_personnage(direction)
	#Change aussi l'animation dependament de ce que le joueurs utilise comme mouvement
func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right'):
		input.x += 1
		animated_body.play("walk_right")
	if Input.is_action_pressed('move_left'):
		input.x += -1
		animated_body.play("walk_left")
	if Input.is_action_pressed('move_down'):
		input.y += 1
		animated_body.play("walk_down")
	if Input.is_action_pressed('move_up'):
		input.y -= 1
		animated_body.play("walk_up")
	if Input.is_action_pressed("fire") && attack_cooldown.is_stopped():
		_fire()
		attack_cooldown.start()
		
	return input
	

func deplacer_personnage(direction):
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		animated_body.play("idle_down")
	velocity = move_and_slide(velocity)	

func _fire():
	var bullet = BULLET.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = position
	var direction = get_local_mouse_position().normalized()
	bullet.set_direction(direction)

