extends Area2D

export(String) var scenePath = "res://Scenes/Levels/Level1.tscn"
export(int) var level
var time = 0.0

# This looks wrong, but it's not. Don't forget that this is triggered when the platform LOADS, not when area is triggered
func _ready():
	if GLOBAL.max_level < level:
		GLOBAL.max_level = level
	if GLOBAL.current_level != level:
		GLOBAL.current_level = level
	pass 

func _process(delta):
	if GLOBAL.STATE != GLOBAL.GAMESTATE.IDLE:
		return
	
	time += delta
	var bods = get_overlapping_bodies()
	for bod in bods:
		if bod.name == "Player":
			GLOBAL.STATE = GLOBAL.GAMESTATE.LEVELWIN
			if GLOBAL.get_best_time() > time:
				GLOBAL.update_best_time(level, time)
				GLOBAL.current_level = level + 1
				GLOBAL.level2load = scenePath
	pass
