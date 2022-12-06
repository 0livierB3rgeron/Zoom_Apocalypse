extends KinematicBody2D


onready var death_timer = $Death_timer
onready var animated_sprite = $AnimatedSprite
onready var collider = $CollisionShape2D
export var speed = 40
onready var player = get_parent().get_parent().get_node("Player")
onready var enviro = get_parent()

func _physics_process(delta):
	var dir = (player.global_position - self.global_position).normalized()
	move_and_collide(dir * speed * delta)

#La methode est appeler de Projectile.gd si Contact avec 
func _Death():
	animated_sprite.frames.set_animation_loop("death",false)
	collider.set_deferred("disabled",true)
	speed=0
	death_timer.start()
	animated_sprite.play("death")
	enviro._slimeDead()
	

#Sert a 
func _on_Timer_timeout():
	queue_free()


