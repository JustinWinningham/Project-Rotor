extends Area2D

export(String) var scenePath = "res://Scenes/Level1.tscn"
export(int) var level = 0
var time = 0.0
func _ready():
	GLOBAL.current_level = level
	if GLOBAL.max_level < level:
		GLOBAL.max_level = level
	pass 


func _process(delta):
	time += delta
	var bods = get_overlapping_bodies()
	for bod in bods:
		if bod.name == "Player":
			print("level win!")
			GLOBAL.update_best_time(level, time)
			get_tree().change_scene(scenePath)
	pass
