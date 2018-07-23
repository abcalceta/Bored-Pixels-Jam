extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hearts = []
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

		

func _process(delta):
	$TextureProgress.value = get_parent().get_parent().get_node("Spaceship").health
	pass
