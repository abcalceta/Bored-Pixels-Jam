extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal died 
var emitted = false
var score = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	$Control/Score.text = "SCORE: "+str(score)
	if $Spaceship.health <= 0:
		$AsteroidSpawner.canSpawn = false
		if not emitted:
			emitted = true
			emit_signal("died")
			globals.score = score
			if score > globals.highScore:
				globals.highScore = score


func _on_Area2D_body_entered(body):
	if body.is_in_group("asteroids") or body.is_in_group("laser"):
		body.queue_free()
	

func _on_ScoreTimer_timeout():
	score += 1