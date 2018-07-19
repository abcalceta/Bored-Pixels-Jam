extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var angle = deg2rad(rand_range(-45,45))
var speed = 200
var impulseDone = false
var strength = 3

export(Texture) var largeTex
export(Texture) var mediumTex
export(Texture) var smallTex



func _ready(strength = 3):
	$Sprite.texture = largeTex
	if strength == 1:
		$Sprite.texture = smallTex
	if strength == 2:
		$Sprite.texture = mediumTex
	
	#position = Vector2(300,300)
	rotate(angle)
	pass

func _process(delta):
	
	var direction = Vector2(cos(angle), sin(angle))
	if not impulseDone:
		apply_impulse(Vector2(0,1), direction*speed)
		impulseDone = true
	pass
	
func hitLaser():
	strength -= 1
	if strength == 0:
		queue_free()
	#if strength == 1:
		#$Sprite.texture = smallTex
	#if strength == 2:
		#$Sprite.texture = mediumTex
	queue_free()
	get_parent().get_parent().get_node("AsteroidSpawner").spawnAsteroid(strength, false, position)
	get_parent().get_parent().get_node("AsteroidSpawner").spawnAsteroid(strength, false, position)