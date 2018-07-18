extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):

func shootLaser():
	var laserInstance = load("res://Laser.tscn").instance()
	laserInstance.position = get_parent().global_position
	get_parent().get_parent().add_child(laserInstance)
	