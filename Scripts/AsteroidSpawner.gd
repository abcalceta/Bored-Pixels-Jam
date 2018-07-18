extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var WINDOW_SIZE = get_viewport().size
var rightCenter = Vector2(0,0)
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	spawnAsteroid()
	pass

func _process(delta):
	rightCenter.x = get_parent().get_node("Camera2D").position.x + WINDOW_SIZE.x + 100
	rightCenter.y = WINDOW_SIZE.y/2
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
	
func _on_SpawnTimer_timeout():
	for x in range(3):
		spawnAsteroid()
	pass # replace with function body

func spawnAsteroid():
	randomize()
	var asteroidInstance = load("res://Asteroid.tscn").instance()
	add_child(asteroidInstance)
	asteroidInstance.add_to_group("asteroids")
	var kind = randi()%2
	if kind == 0: #comes from front
		var randomPos = Vector2(rightCenter.x, rightCenter.y+rand_range(-WINDOW_SIZE.y/2, WINDOW_SIZE.y/2))
		asteroidInstance.position = randomPos
		asteroidInstance.speed = rand_range(200, 350)
		asteroidInstance.angle = deg2rad(rand_range(100,260))
	if kind == 1: #comes from back
		var randomPos = Vector2(rightCenter.x-WINDOW_SIZE.x-200, rightCenter.y+rand_range(-WINDOW_SIZE.y/2, WINDOW_SIZE.y/2))
		asteroidInstance.position = randomPos
		asteroidInstance.speed = rand_range(450, 650)
		asteroidInstance.angle = deg2rad(rand_range(-45,45))
		
		
		