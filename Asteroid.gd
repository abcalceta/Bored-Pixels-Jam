extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var angle = deg2rad(rand_range(-45,45))
var speed = 200
var impulseDone = false
var strength = 3

func _ready():
	position = Vector2(300,300)
	# Called every time the node is added to the scene.
	# Initialization here
	rotate(angle)
	pass

func _process(delta):
	var direction = Vector2(cos(angle), sin(angle))
	if not impulseDone:
		apply_impulse(Vector2(0,1), direction*speed)
		impulseDone = true
		
	
		
	pass
	
	#move_and_slide(direction * speed)
	
func hitLaser():
	strength -= 1
	if strength == 0:
		queue_free()
		
		
		
		
		
		