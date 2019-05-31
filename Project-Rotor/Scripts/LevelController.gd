extends Node2D

var targetrot = rotation
var oldrot = rotation
var rotspeed = 0.0
var is_Rotating = false
var numrots = 0
var timeTaken = 0.0

func _ready():
	pass


func _process(delta):
	timeTaken += delta
	if not is_Rotating:
		var btns = $Buttons.get_children()
		for btn in btns:
			var ctrl = btn.call("_check_for_rotate")
			if ctrl:
				oldrot = rotation_degrees
				var deltadir = btn.call("_get_delta_dir")
				if deltadir > 0:
					numrots += 1
				else:
					numrots -= 1
				targetrot += deltadir
				rotspeed = btn.rot_speed
			pass
		pass
	
	if stepify(rotation_degrees, 1) != targetrot:
		if targetrot > rotation_degrees:
			is_Rotating = true
			rotation += lerp(0, deg2rad(targetrot), rotspeed / numrots)
		if targetrot < rotation_degrees:
			is_Rotating = true
			rotation -= lerp(0, deg2rad(targetrot), rotspeed / numrots)
	else:
		is_Rotating = false
		pass
