extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var WINDOW_SIZE = get_viewport().size
var rightCenter = Vector2(0,0)
var canSpawn = true
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	spawnAsteroid(3)
	pass

func _process(delta):
	rightCenter.x = get_parent().get_node("Camera2D").position.x + WINDOW_SIZE.x + 100
	rightCenter.y = WINDOW_SIZE.y/2
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
	
func _on_SpawnTimer_timeout():
	if canSpawn:
		for x in range(3):
			var random = randi()%7
			if random <= 3:
				spawnAsteroid(3)
			elif random <= 5:
				spawnAsteroid(2)
			else:
				spawnAsteroid(1)
		pass # replace with function body

func spawnAsteroid(strength, randPos = true, pos = Vector2(0,0)):
	randomize()
	var asteroidInstance = load("res://Asteroid.tscn").instance()
	asteroidInstance.init(strength)
	add_child(asteroidInstance)
	asteroidInstance.add_to_group("asteroids")
	if randPos == true:
		var kind = randi()%5
		if kind == 0: #comes from back
			var randomPos = Vector2(rightCenter.x-WINDOW_SIZE.x-200, rightCenter.y+rand_range(-WINDOW_SIZE.y/2, WINDOW_SIZE.y/2))
			asteroidInstance.position = randomPos
			asteroidInstance.speed = rand_range(450, 650)
			asteroidInstance.angle = deg2rad(rand_range(-45,45))
		else: #comes from front
			var randomPos = Vector2(rightCenter.x, rightCenter.y+rand_range(-WINDOW_SIZE.y/2, WINDOW_SIZE.y/2))
			asteroidInstance.position = randomPos
			asteroidInstance.speed = rand_range(200, 350)
			asteroidInstance.angle = deg2rad(rand_range(100,260))
	else:
		asteroidInstance.position = pos
		asteroidInstance.speed = rand_range(150, 650)
		asteroidInstance.angle = deg2rad(rand_range(-45,45))
		
		

func _on_SpawnSpeedup_timeout():
	$SpawnTimer.wait_time = clamp($SpawnTimer.wait_time-0.01, 0.05, 1)
	print("wait_time is ",$SpawnTimer.wait_time)
