extends Node2D

# X position where each bar will stop when entering camera view
var on_fins = [
400,
400,
400,
400,
400,
400,
400,
400,
400,
-300
]

# X position where each bar will stop when exiting the camera view
var off_fins = -2000

# Holds array of nodes - our bars
var spritez

# Speed at which each bar will move, randomized each frame when the game is in idle state
var speeds = [
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0
]

export(int) var time_winning = 3
export(int) var time_dying = 2

func _ready():
	GLOBAL.STATE = GLOBAL.GAMESTATE.ENTERSCENE
	spritez = $Bars.get_children()
	visible = true
	# Seed our initial random speeds at the start for the fade in
	for i in speeds.size():
			speeds[i] = rand_range(2500, 3000)
	pass # Replace with function body.

func _process(delta):
	# optimization check
	if GLOBAL.STATE != GLOBAL.GAMESTATE.IDLE:
		
		##########################
		# LEVEL TRANSITION - WIN #
		##########################
		if GLOBAL.STATE == GLOBAL.GAMESTATE.LEVELWIN:
			print("PLAYER WON")
			if fade_on(delta):
				print("FADE ON COMPLETE")
				time_winning -= delta
				$CanvasLayer/Win_Elements.visible = true
				$CanvasLayer/Win_Elements/Label.text = str(GLOBAL.STATE)
				if time_winning <= 0:
					GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
					get_tree().change_scene(GLOBAL.level2load)
				# At this point, our fade_on has completed, now do whatever we want for the winscreen
				pass
			pass
		
		############################
		# LEVEL TRANSITION - DEATH #
		############################
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.LEVELDEATH:
			print("PLAYER DIED!")
			if fade_on(delta):
				print("FADE ON COMPLETE")
				$CanvasLayer/Death_Elements.visible = true
				$CanvasLayer/Death_Elements/Label.text = str(GLOBAL.STATE)
				time_dying -= delta
				if time_dying <= 0:
					GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
					get_tree().reload_current_scene()
		
		###########################
		# LEVEL TRANSITION - QUIT #
		###########################
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.LEAVESCENE:
			print("PLAYER QUIT LEVEL!")
			if fade_on(delta):
				GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
				get_tree().change_scene(GLOBAL.level2load)
		
		############################
		# LEVEL TRANSITION - ENTER #
		############################
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.ENTERSCENE:
			print("ENTERED A MENU / NON LEVEL SCENE")
			if fade_off(delta):
				GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
				# No change_scene here, as this case occurs right after we load a new scene
	else:
		# Only update our fader randoms when idling
		for i in speeds.size():
			speeds[i] = rand_range(2500, 3000)
	pass

# Processes a single frame of fading into camera view, returns true when fade is complete, false otherwise
func fade_on(delta):
	var counter = 0
	var exit = true
	for spr in spritez:
		if stepify(spr.position.x, 1) <= on_fins[counter]:
			exit = false
			spr.position.x += speeds[counter] * delta
		counter += 1
	if exit:
		return true
	return false

# Processes a single frame of fading out of camera view, returns true when fade is complete, false otherwise
func fade_off(delta):
	var counter = 0
	var exit = true
	for spr in spritez:
		if stepify(spr.position.x, 1) >= off_fins:
			exit = false
			spr.position.x -= speeds[counter] * delta
		counter += 1
	if exit:
		return true
	return false