extends Button


func _on_DEBUGSAVEBTN_pressed():
	GLOBAL.max_level = 40
	GLOBAL.update_best_time(0,15.4)
	GLOBAL.update_best_time(1,33.23)
	GLOBAL.num_deaths = 3
	GLOBAL.num_jumps = 50012
	GLOBAL.num_walljumps = 151
	GLOBAL.time_floored = 155.22
	pass # Replace with function body.
