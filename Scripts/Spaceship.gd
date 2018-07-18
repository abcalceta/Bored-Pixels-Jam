extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var SPEED = 80
var acceleration = Vector2(0,0)
onready var WINDOW_SIZE = get_viewport().size
onready var SPRITE_SIZE = Vector2(64,64)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var motion = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		acceleration.y -= 1
	if Input.is_action_pressed("ui_down"):
		acceleration.y += 1
	if Input.is_action_pressed("ui_left"):
		acceleration.x -= 1
	if Input.is_action_pressed("ui_right"):
		acceleration.x += 1
	if Input.is_action_pressed("ui_select"):
		$LaserSpawner.shootLaser(0)
	if Input.is_action_just_pressed("ui_page_up"):
		for x in range(0, 360, 10):
			$LaserSpawner.shootLaser(x)
		
		
	#print(WINDOW_SIZE, " ", $KinematicBody2D.position)
	
	if position.y < SPRITE_SIZE.y/2:
		motion.y = 0
		acceleration.y += 1
		position.y = SPRITE_SIZE.y/2

	if position.y > WINDOW_SIZE.y-SPRITE_SIZE.y/2:
		motion.y = 0
		acceleration.y -= 1
		position.y = WINDOW_SIZE.y-SPRITE_SIZE.y/2

	if position.x < get_parent().get_node('Camera2D').position.x+SPRITE_SIZE.y/2:
		motion.x = 0
		#acceleration.x += 1
		position.x = get_parent().get_node('Camera2D').position.x+SPRITE_SIZE.y/2
		
	if position.x > get_parent().get_node('Camera2D').position.x+WINDOW_SIZE.x-SPRITE_SIZE.x/2:
		motion.x = 0
		acceleration.x -= 1
		position.x = get_parent().get_node('Camera2D').position.x+WINDOW_SIZE.x-SPRITE_SIZE.x/2

	acceleration -= acceleration * 0.1
	motion += acceleration
	move_and_slide(motion*SPEED)
	
	
	
	
	
	
