extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var SPEED = 80
var acceleration = Vector2(0,0)
onready var WINDOW_SIZE = get_viewport().size
onready var SPRITE_SIZE = Vector2(64,64)

var health = 100

var canShoot = true

var canMove = true
var canBeKilled = false
var burstAnimated = false
func _ready():
	$Explosion.emitting = false
	$AnimationPlayer.play("Blink")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	
	if canMove:
		var motion = Vector2(0,0)
		if Input.is_action_pressed("ui_up"):
			acceleration.y -= 1
		if Input.is_action_pressed("ui_down"):
			acceleration.y += 1
		if Input.is_action_pressed("ui_left"):
			acceleration.x -= 1
		if Input.is_action_pressed("ui_right"):
			acceleration.x += 1
		if Input.is_action_pressed("ui_select") and canShoot:
			$shootSound.play()
			canShoot = false
			$canShootTimer.start()
			$LaserSpawner.shootLaser(0)
			$laser.emitting = true
		if Input.is_action_just_pressed("ui_page_up"):
			burstShot()
				
			
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
		
	else:
		if not burstAnimated:
			burstAnimated = true
			burstShot()
			$thruster.hide()
			$Sprite.hide()
			$Explosion.emitting = true
		
func _on_canShootTimer_timeout():
	canShoot = true
	
func burstShot():
	$LaserSpawner.position.x -= 50
	for x in range(0, 360, 10):
		$LaserSpawner.shootLaser(x)
	$LaserSpawner.position.x += 50

func _on_Area2D_body_entered(body):
	if body.is_in_group("asteroids"):
		$dieSound.play()
		for x in get_tree().get_nodes_in_group("asteroids"):
			x.die()
		burstShot()
		$AnimationPlayer.play("Blink")
		health -= body.damage

func _on_World_died():
	canMove = false


func _on_AnimationPlayer_animation_finished(anim_name):
	canBeKilled = true
