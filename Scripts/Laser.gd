 extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var direction = Vector2(1,0)
var angle = 0
var speed = 1000

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	direction = Vector2(cos(angle), sin(angle))
	position += direction * speed * delta


func _on_Laser_body_entered(body):
	if body.is_in_group("asteroids"):
		body.hitLaser()
		queue_free()
