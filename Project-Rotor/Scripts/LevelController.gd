extends Node2D

var targetrot = rotation
var oldrot = rotation
var rotspeed = 0.0
var is_Rotating = false
var numrots = 0
var timeTaken = 0.0

func _ready():
	if get_tree().paused:
		get_tree().paused = false
	pass

func _process(delta):
	timeTaken += delta
	# Update our target rotation to trigger the next loop
	# By looping over all of our buttons and checking if they have been tripped
	if not is_Rotating:
		var btns = $Buttons.get_children()
		for btn in btns:
			var ctrl = btn.call("_check_for_rotate")
			if ctrl:
				oldrot = rotation_degrees
				var deltadir = btn.delta_rotation
				targetrot += deltadir
				rotspeed = btn.rot_speed
			pass
		pass
	var future_rotation_degrees = stepify(rotation_degrees, 1)
	# If our target rotation is not equal to our current rotation
	if future_rotation_degrees != targetrot:
		# If we need to add rotation
		if targetrot > rotation_degrees:
			is_Rotating = true
			var truedeltarot = abs(lerp(0, targetrot - oldrot, rotspeed))
			rotation_degrees += truedeltarot
		# If we need to subtract rotation
		if targetrot < rotation_degrees:
			is_Rotating = true
			var truedeltarot = abs(lerp(0, targetrot - oldrot, rotspeed))
			rotation_degrees -= truedeltarot
	else:
		is_Rotating = false
		rotation_degrees = targetrot
	pass