extends Area2D

export(int) var delta_rotation = 90
export(float) var rot_speed = 0.005
var pressed = false
var taken = false
var levelHandler

func _ready():
	levelHandler = get_parent().get_parent()
	pass # Replace with function body.

func _process(delta):
	var is_rotating = levelHandler.is_Rotating
	var bods = get_overlapping_bodies()
	for bod in bods:
		if bod.name == "Player" and not taken and not is_rotating:
			$AnimatedSprite.play("on")
			print("Button Pressed!")
			pressed = true
	pass

func _check_for_rotate():
	if taken:
		return
	else:
		if pressed:
			taken = true
			return true
	return false
	
func _get_delta_dir():
	return delta_rotation * -1