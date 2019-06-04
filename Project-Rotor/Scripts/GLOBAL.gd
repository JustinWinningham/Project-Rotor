extends Node

var current_level = 0
var max_level = 0
var did_find_save = false
var showload = false
var shownload = false

var show_input_ui = true
var show_times_ui = true

var num_jumps = 0
var num_deaths = 0
var num_walljumps = 0
var num_ducks = 0
var time_moveleft = 0.0
var time_moveright = 0.0
var time_airborne = 0.0
var time_ducked = 0.0
var time_walled = 0.0
var time_floored = 0.0


var timesArray = []

func _ready():
	var i = 0
	timesArray.resize(20) # this will have to change if we get more than 40 levels
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
		"max_level" : max_level,
		"show_input_ui" : show_input_ui,
		"show_times_ui" : show_times_ui,
		"num_jumps" : num_jumps,
		"num_deaths" : num_deaths,
		"num_walljumps" : num_walljumps,
		"num_ducks" : num_ducks,
		"time_moveleft" : time_moveleft,
		"time_moveright" : time_moveright,
		"time_airborne" : time_airborne, # This one loads for some reason
		"time_ducked" : time_ducked, # This one loads for some reason
		"time_floored" : time_floored,
		"time_walled" : time_walled,
		
		# For readability, always leave times at the end of the dict
		"z_records" : timesArray
	}
	return save_dict


func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_var(form_save())
	save_game.close()
	return true



func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return false
	
	save_game.open("user://savegame.save", File.READ)
	var data = {}
	data = save_game.get_var()
	save_game.close()
	for i in data:
		set(i, data[i])
	return true


func get_best_time():
	if timesArray[current_level] == null:
		return 999.99
	return timesArray[current_level]
	pass

func update_best_time(level, time):
	timesArray[level] = time
	pass