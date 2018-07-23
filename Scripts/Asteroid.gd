extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var angle = deg2rad(rand_range(-45,45))
var speed = 200
var impulseDone = false
var strength = 3
var damage = 10
onready var WINDOW_SIZE = get_viewport().size

export(Texture) var largeTex
export(Texture) var mediumTex
export(Texture) var smallTex



func _ready():
	#position = Vector2(300,300)
	$Particles2D.emitting = false
		
	$Large.disabled=true
	
	$Medium.disabled=true
	
	$Small.disabled=true
	
	init(strength)

	rotate(angle)
	pass

func init(stren):
	strength= stren
	if strength == 3:
		damage = 20
		$Sprite.texture = largeTex
		$Large.disabled=false
	if strength == 1:
		damage = 10
		$Sprite.texture = smallTex
		$Medium.disabled=false
	if strength == 2:
		damage = 5
		$Sprite.texture = mediumTex
		$Small.disabled=false
		

func _process(delta):
	if strength == 3:
		#$Large.disabled=false
		#$Medium.disabled=true
		#$Small.disabled=true
		pass
	elif strength == 2:
		#$Large.disabled=true
		#$Medium.disabled=false
		#$Small.disabled=true
		pass
	elif strength == 1:
		#$Large.disabled=true
		#$Medium.disabled=true
		#$Small.disabled=false
		pass
	else:
		die()
		#pass
		#queue_free()

		
	var direction = Vector2(cos(angle), sin(angle))
	if not impulseDone:
		apply_impulse(Vector2(0,1), direction*speed)
		impulseDone = true

	pass
	
	
	
func hitLaser():
	get_parent().get_parent().score += 50
	$AudioStreamPlayer2D.play()
	strength -= 1
	$Sprite.hide()
	$Large.disabled=true
	$Medium.disabled=true
	$Small.disabled=true
	$Particles2D.emitting = true
	if strength != 0:
		get_parent().get_parent().get_node("AsteroidSpawner").spawnAsteroid(strength, false, position)
		get_parent().get_parent().get_node("AsteroidSpawner").spawnAsteroid(strength, false, Vector2(position.x+30, position.y+30))


func _on_AudioStreamPlayer2D_finished():
	if strength == 0:
		pass#queue_free()
	else:
		pass#queue_free()

func die():
	$Particles2D.emitting = true
	$Large.disabled=true
	$Medium.disabled=true
	$Small.disabled=true
	$Sprite.hide()
	$dieTimer.start()

func _on_dieTimer_timeout():
	queue_free()
