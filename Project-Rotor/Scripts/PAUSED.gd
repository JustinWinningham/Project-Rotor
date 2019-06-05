extends Control

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("PAUSE"):
		if paused:
			get_tree().paused = false
			paused = false
			visible = false
		else:
			get_tree().paused = true
			paused = true
			visible = true
