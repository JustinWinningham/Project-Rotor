extends Node

var current_level = 0
var max_level = 0
var did_find_save = false
var showload = false
var shownload = false

var timesArray = []

func _ready():
	var i = 0
	timesArray.resize(40)
	print("GLOBAL Loaded")
	if load_game():
		did_find_save = true
		showload = true
	else:
		did_find_save = false
		print("Unable to load save game")
	pass


#func _process(delta):
#	pass


func form_save():
	var save_dict = {
		"max_lvl" : max_level,
		"records" : timesArray
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var node_data = form_save()
	save_game.store_line(to_json(node_data))
	save_game.close()
	return true


func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return false
	
	save_game.open("user://savegame.save", File.READ)
	while not save_game.eof_reached():
		var current_line = parse_json(save_game.get_line())
		if current_line == null: # without this line, the method will run into a null line and crash
			return true
		for i in current_line.keys():
			set(i, current_line[i])
	save_game.close()
	return true


func get_best_time():
	if timesArray[current_level] == null:
		return 999.99
	return timesArray[current_level]
	pass

func update_best_time(level, time):
	timesArray[level] = time
	pass