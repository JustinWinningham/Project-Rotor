extends Node2D

var fins = [
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

var finisher = [false, false, false, false, false, false, false, false, false, false]

export(int) var time_winning = 3
export(int) var time_dying = 3

var finished_transition = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	if GLOBAL.STATE != GLOBAL.GAMESTATE.IDLE:
		if GLOBAL.STATE == GLOBAL.GAMESTATE.LEVELWIN:
			var spritez = $Bars.get_children()
			if not finished_transition:
				var counter = 0
				var exit = true
				for spr in spritez:
					if not finisher[counter]:
						spr.position.x = lerp(spr.position.x, spr.position.x + 2000, speeds[counter]) # fins[counter].x second param
					if stepify(spr.position.x, 1) <= fins[counter]:
						exit = false
					else:
						finisher[counter] = true
					counter += 1
				if exit:
					print("LEVEL WIN!")
					finished_transition = true
			else:
				time_winning -= delta
				if time_winning <= 0:
					get_tree().change_scene(GLOBAL.level2load)
					GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.LEVELDEATH:
			print("PLAYER DIED!")
			GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
			get_tree().reload_current_scene()
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.LEAVESCENE:
			print("PLAYER QUIT!")
			GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
			get_tree().change_scene(GLOBAL.level2load)
		elif GLOBAL.STATE == GLOBAL.GAMESTATE.ENTERSCENE:
			print("ENTERED A MENU / NON LEVEL SCENE")
			GLOBAL.STATE = GLOBAL.GAMESTATE.IDLE
	else:
		for i in speeds.size():
			speeds[i] = rand_range(0.01, 0.025)
	pass

