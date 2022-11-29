extends Area2D
class_name Projectile

export (int) var speed = 10

var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()

func _on_Projectile_body_entered(body):
	var areaName = body.name
	if areaName != "Player":
		if areaName=='Slime':
			body._Death()
		queue_free()
	
