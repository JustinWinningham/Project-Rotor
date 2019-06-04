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
	$DEBUG_A.text = str(targetrot)
	$DEBUG_C.text = str(numrots)
	
	timeTaken += delta
	if not is_Rotating:
		var btns = $Buttons.get_children()
		for btn in btns:
			var ctrl = btn.call("_check_for_rotate")
			if ctrl:
				oldrot = rotation_degrees
				var deltadir = btn.call("_get_delta_dir")
				$DEBUG_B.text = str(deltadir)
				if deltadir > 0:
					numrots += 1
					targetrot += deltadir
				else:
					numrots -= 1
					targetrot -= deltadir
				rotspeed = btn.rot_speed
			pass
		pass
	if stepify(rotation_degrees, 1) != targetrot:
		# Current issue: when we try to rotate with numrots == 0, divide by zero error
		var truerots = abs(numrots) # EXPERIMENTAL
		if truerots == 0: # EXPERIMENTAL
			truerots = 1 # EXPERIMENTAL
		if targetrot > rotation_degrees:
			is_Rotating = true
			rotation += lerp(0, deg2rad(targetrot), rotspeed / truerots)
		if targetrot < rotation_degrees:
			is_Rotating = true
			rotation -= lerp(0, deg2rad(targetrot), rotspeed / truerots)
	else:
		is_Rotating = false
		pass
