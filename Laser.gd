extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var direction = Vector2(1,0)
var speed = 1000
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	position += direction * speed * delta
