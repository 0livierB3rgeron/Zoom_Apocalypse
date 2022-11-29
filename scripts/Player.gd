extends KinematicBody2D
#Valeurs pour les mouvement du joueur
export var speed = 80
export var friction = 0.18
export var acceleration = 0.1
export var atk_speed = 0.1


var alive = true
var velocity = Vector2()
var current_animation = "idle_down"

onready var attack_cooldown = $Atk_speed
onready var death_timer = $Death_timer
onready var BULLET = preload("res://scenes/Projectile.tscn")
onready var animated_body = $AnimatedSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
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
		attack_cooldown.start(atk_speed)
		
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
	
	
func _Death():
	animated_body.frames.set_animation_loop("dead",false)
	speed=0
	death_timer.start()
	animated_body.play("dead")
