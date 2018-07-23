extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$Score.text = "Score: "+str(globals.score)
	$HighScore.text = "High Score:"+str(globals.highScore)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Quit_pressed():
	get_tree().quit()

func _on_Try_Again_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")