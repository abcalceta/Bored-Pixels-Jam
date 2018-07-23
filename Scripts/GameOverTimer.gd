extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_World_died():
	print("I started")
	start()
	
func _on_GameOverTimer_timeout():
	print("I timed out")
	get_tree().change_scene("res://GameOver.tscn")
