extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	position.x += 50
	pass

func _process(delta):
	#position.x = get_parent().get_node("Camera2D").position.x + 50
	position.x += (200*delta)
